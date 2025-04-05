[CmdletBinding()]
param(
    [ArgumentCompleter({
        [Enum]::GetNames([Vowels])
    })]
    [string]$Vowel
)
enum Vowels {
    A = 1
    E = 2
    I = 3
    O = 4
    U = 5
}

$PSBoundParameters