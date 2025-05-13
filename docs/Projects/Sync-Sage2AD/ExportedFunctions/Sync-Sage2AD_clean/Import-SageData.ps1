function Import-SageData {
    [CmdletBinding()]
    param (
        [Parameter()]
        $SyncHash
    )

    $TaskArgs = @{
        FunctionName = $MyInvocation.MyCommand.Name
        RunspaceName = "ImportSageData"
        Message      = "Import Employees from Sage"

        ScriptBlock  = {
            param (
                #$SyncHash,
                $RunspaceName,
                $FunctionName,
                $Message
            )
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
    
            $SyncHash.Sage.DataRaw = Get-Content -Path $SyncHash.Config.Paths.SageCSVFile -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
            Get-NameExtraction -csvData $SyncHash.Sage.DataRaw | Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_.'Pers.Nr.' -ne '6100' }
    
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        }
    }

    Start-RunspaceTask @TaskArgs
}
