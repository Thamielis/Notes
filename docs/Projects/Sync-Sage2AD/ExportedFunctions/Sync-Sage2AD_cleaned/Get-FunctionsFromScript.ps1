function Get-FunctionsFromScript {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $FilePath
    )

    $OutputParameter = @()
    $FNCs = [System.Management.Automation.Language.Parser]::ParseFile($FilePath, [ref]$null, [ref]$Null)

    foreach ($BlockName in @("BeginBlock", "ProcessBlock", "EndBlock")) {
        $CurrentBlock = $FNCs.$BlockName

        foreach ($Statement in $CurrentBlock.Statements) {
            $Extent = $Statement.Extent.ToString()

            if ([String]::IsNullOrWhiteSpace($Statement.Name) -Or $Extent -inotmatch ('function\W+(?<name>{0})' -f $Statement.Name)) {
                continue
            }

            $OutputParameter += $Statement.Name
        }

    }

    return $OutputParameter
}
