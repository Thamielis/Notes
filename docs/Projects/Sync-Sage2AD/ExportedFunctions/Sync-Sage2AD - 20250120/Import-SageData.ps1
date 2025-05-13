function Import-SageData {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$SageCSVFilePath
    )

    Write-Log -Level INFO -Message "Importing Sage Data from $SageCSVFilePath"

    try {
        $SageData = Get-Content -Path $SageCSVFilePath -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
        Write-Log -Level INFO -Message "Sage Data successfully imported."
        return $SageData
    }
    catch {
        Write-Log -Level ERROR -Message "Failed to import Sage data from $SageCSVFilePath." -ExceptionInfo $_
        throw "Error reading Sage CSV file."
    }

    Wait-Logging
}
