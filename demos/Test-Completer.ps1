param(
    [ArgumentCompleter({
        [Enum]::GetNames([Vowel])
    })]
    [string]$Vowel
)


enum Vowel {
    A = 1
    E = 2
    I = 3
    O = 4
    U = 5
}



function Test-Completer {
    [CmdletBinding()]
    param(
        [ArgumentCompleter({
            [Enum]::GetNames([Vowel])
        })]
        [Vowel[]][string[]][Char[]]$Vowel
    )
    [Vowel[]]$Vowel = $Vowel

    $Vowel
}

Test-Completer @PSBoundParameters