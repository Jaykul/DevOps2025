Import-Module ErrorView -args ConciseView -Force

class Player { [string]$Name; [Position]$Position; [string] ToString() { return $this.Name + " (" + $this.Position + ")" } }
class Position { [int]$X; [int]$Y; [string] ToString() { return "" + $this.X + ", " + $this.Y } }
enum Direction { North; East; South; West }

[Player]$Player = @{
    Name     = "Player One"
    Position = @{
        X = 3
        Y = 5
    }
}


function Test-Code {
    [Alias("Your-Code-Goes-Here")]
    [CmdletBinding()]
    param()
    $spin = "/-\|"
    foreach ($i in 1..300) {
        [Console]::Write("`b" + $spin[$i % $spin.Length])
        if ($i -gt 25 -and 1 -eq (Get-Random -max 20)) { throw "You rolled Critical Fail" }
        Start-Sleep -Milliseconds 50
    }
}

function Move {
    [Alias("Better-Code-Example")]
    [CmdletBinding()]
    param()
    switch ($CardinalDirection) {
        North { $NewPosition = [Position]@{ X = $Player.Position.X; Y = $Player.Position.Y - $DistanceInMeters; } }
        East { $NewPosition = [Position]@{ X = $Player.Position.X + $DistanceInMeters; Y = $Player.Position.Y } }
        South { $NewPosition = [Position]@{ X = $Player.Position.X; Y = $Player.Position.Y + $DistanceInMeters; } }
        West { $NewPosition = [Position]@{ X = $Player.Position.X - $DistanceInMeters; Y = $Player.Position.Y } }
    }
    if ($Force -or $PSCmdlet.ShouldProcess($Player.Name, "Move ${DistanceInMeters} meters ${CardinalDirection} to ${NewPosition}")) {
        $Player.Position = $NewPosition
    }
}

New-Module "ErrorInfo" {

    Update-TypeData -TypeName System.Diagnostics.Process -MemberType ScriptMethod -MemberName ToString -Value {
        $this.Name + " (" + $this.Id + ")"
    } -Force

    Update-TypeData -TypeName System.Management.Automation.InvocationInfo -MemberType ScriptMethod -MemberName Instrument -Value {
        $this | Add-Member @{
            Process   = Get-Process -Id $PID
            Location  = Get-Location
            StartTime = [DateTimeOffset]::Now
        }
    } -Force

    Update-TypeData -TypeName System.Management.Automation.InvocationInfo -MemberType ScriptMethod -MemberName TraceEnd -Value {
        $this | Add-Member @{ EndTime = [DateTimeOffset]::Now }
        $PSCmdlet.WriteInformation($this, @($this.MyCommand, "MyInvocation", $this.GetHashCode()))
    } -Force

    # This function has to go inside a module ....
    # So that $PSCmdlet.SessionState.PSVariable.GetValue will retrieve from the caller
    function Write-ErrorInformation {
        [CmdletBinding()]
        param(
            # The error record to display (expects to be called in a catch, and takes $_ by default)
            $ErrorRecord = $PSCmdlet.SessionState.PSVariable.GetValue("_"),
            $Invocation = $PSCmdlet.SessionState.PSVariable.GetValue("MyInvocation")
        )
        # Important: this modifies _their_ MyInvocation...
        $Invocation | Add-Member @{ ErrorRecords = @() } -ErrorAction Ignore
        $Invocation.ErrorRecords += $ErrorRecord

        $PSStyle.OutputRendering, $Rendering = "Ansi", $PSStyle.OutputRendering
        $PSCmdlet.WriteInformation( -join @(
                ErrorView\Format-Error -InputObject $ErrorRecord -View Detailed
                "`n"
                "$($PSStyle.Formatting.ErrorAccent)MyInvocation:$($PSStyle.Reset)"
                ($Invocation | Format-List Process, Location, HistoryId,
                @{ n = "HashCode"; e = { $Invocation.GetHashCode() } },
                @{ n = "StartTime"; e = { $_.StartTime.ToString("yyyy-MM-dd HH:mm:ss.fff zzz") } },
                @{ n = "ErrorTime"; e = { [System.DateTimeOffset]::Now.ToString("yyyy-MM-dd HH:mm:ss.fff zzz") } }
                | Out-String)
                "$($PSStyle.Formatting.ErrorAccent)PSBoundParameters:$($PSStyle.Reset)"
                ($Invocation.BoundParameters | Out-String)
            ), @($Invocation.MyCommand, "ErrorInformation", $Invocation.GetHashCode()))
        $PSStyle.OutputRendering = $Rendering
    }
} | Import-Module


New-Module "DetectingMistakes" {
    function Move-Player {
        <#
            .SYNOPSIS
                Moves the player marker on the board
            .DESCRIPTION
                Moves the player marker on the board in a specified direction and distance.
                The player can only move in the cardinal directions,
                and within the bounds of the board (0,0) to (8,8).
            .EXAMPLE
                Move-Player North 3
        #>
        [CmdletBinding()]
        param(
            # The direction to move the player. Only cardinal directions are allowed.
            [ValidateSet("North", "East", "South", "West")]
            [Direction]$CardinalDirection,

            # The number of spaces to move the player. This is always a positive integer, and the maximum distance is limited by the player's current position on the 9x9 board.
            [ArgumentCompleter({
                    param($Name, $Parameter, $Partial, $Ast, $Bound )
                    @(switch ($Bound.CardinalDirection) {
                            North { ($Player.Position.Y)..0 }
                            South { (8 - $Player.Position.Y)..0 }
                            East { (8 - $Player.Position.X)..0 }
                            West { ($Player.Position.X)..0 }
                            default {
                                ($Player.Position.X, $Player.Position.Y, (8 - $Player.Position.X), (8 - $Player.Position.Y) | Sort-Object -Desc)[0]..0
                            }
                        }) | Where-Object { $_ -gt 0 } # Zero isn't a valid move
                })]
            [ValidateScript({
                    if ($CardinalDirection -eq "North" -and $Player.Position.Y - $_ -lt 0) {
                        throw "You can't move that far North. The edge is only $($Player.Position.Y) away."
                    }
                    $true
                })]
            [ValidateRange(1, 8)]
            [int]$DistanceInMeters,

            # If specified, skips the ShouldContinue check.
            [switch]$Force
        )
        try {
            $MyInvocation.Instrument()

            Your-Code-Goes-Here

            # Special handling for errors you expect
        } catch [System.IO.FileNotFoundException] {
            Write-Error "The target game file was not found." -Recommend "Check the path and try again."
        } catch {
            Write-ErrorInformation -InformationAction $InformationPreference -InformationVariable global:MyGame_ErrorInformation
            Write-Error $_ -Recommend ("Please consider reporting this issue at https://github.com/Jaykul/DevOps2025/issues`n" +
                "  Include as much information as you're comfortable sharing from `$MyGame_ErrorInformation | Set-Clipboard")
        } finally {
            $MyInvocation.TraceEnd()
        }
    }
} | Import-Module