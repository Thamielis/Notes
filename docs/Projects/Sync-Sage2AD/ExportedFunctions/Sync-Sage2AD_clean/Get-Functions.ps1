function Get-Functions {
    [CmdletBinding()]
    param (
        [Parameter()]
        $_MyInvocation
    )

    $OutputParameter = @()

    foreach ($BlockName in @("BeginBlock", "ProcessBlock", "EndBlock")) {
        $CurrentBlock = $_MyInvocation.MyCommand.ScriptBlock.Ast.$BlockName

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
