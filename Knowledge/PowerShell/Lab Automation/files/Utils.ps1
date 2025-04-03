
Function LogMessage 
{
    param(
    [Parameter(Mandatory=$true)]
    [String]$message,
    [Parameter(Mandatory=$false)]
    [String]$colour,
    [Parameter(Mandatory=$false)]
    [string]$skipnewline
    )

    If (!$colour){
        $colour = "green"
    }

    $timeStamp = Get-Date -Format "MM-dd-yyyy_hh:mm:ss"

    Write-Host -NoNewline -ForegroundColor White " [$timestamp]"
    If ($skipnewline)
    {
        Write-Host -NoNewline -ForegroundColor $colour " $message"        
    }
    else 
    {
        Write-Host -ForegroundColor $colour " $message" 
    }

}
