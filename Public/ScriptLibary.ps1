
function Write-HostHelper {
    param (
        [int]$numberOfItem = 1 ,
        [switch] $line,
        [switch] $tab,
        [switch] $space
        )
    begin 
    { 
        if ($line) {$writeWith = "`n"}
        if ($tab) {$writeWith = "`t"}
        if ($space) {$writeWith = ' '}
    } # End Begin
    process {
        foreach ($item in 1..$numberOfItem) {
            Write-Host -Object $writeWith -NoNewline
        }
    } # End Process
    end {} # End End
}

function Get-TimeStamp {
    param (
        [string]$format = 'yyyy-MM-dd HH:mm:ss:ff',
        [switch]$out 
    )
    begin {} # End begin
    process { $result = Get-Date -Format $format  } # End Process
    end  { 
        if ($out) {Write-Host "[$result] " -ForegroundColor Cyan -NoNewline}
        else {return $result} 
    } # End end
}

function Write-color {
    param (
        [alias ('t')] [String[]]$Text,
        [alias ('c')] [ConsoleColor[]]$Color,
        [switch] $showTime
    )

    if ($showTime) {Get-TimeStamp -out }
    foreach ($i in 0..($Text.count-1))
    {
        if ($NULL -eq $Color[$i])
        {
            $ForegroundColor = [ConsoleColor]::White
        } # End if
        else 
        {
            $ForegroundColor = $Color[$i]
        }
        
        Write-Host -Object $($Text[$i]+' ') -ForegroundColor $ForegroundColor -NoNewLine
    }
    Write-Host
}
