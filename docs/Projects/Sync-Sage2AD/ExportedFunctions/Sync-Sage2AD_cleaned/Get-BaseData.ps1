function Get-BaseData {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Message = "Getting BaseData in parallel"
    #[Timer]::GetTimer($FunctionName, $Message)
    $SyncHash.Timer::GetTimer($FunctionName, $Message)
    
    try {
        #TODO: Logging in Runspace und Error Handling
        Get-AllADUsers
        Import-SageData
        Get-AllADGroups

        # Erstelle eine Liste für die WaitHandles
        #$WaitHandles = @()
        $Jobs = $global:SyncHash.Runspace.Jobs
        Wait-Runspace -Runspaces $Jobs
        #foreach ($Job in $Jobs) {
        #$WaitHandles += $Job.Runspace.AsyncWaitHandle
        #    $Job.Runspace.AsyncWaitHandle.WaitOne()
        #}

        # Warte, bis alle Runspaces abgeschlossen sind
        #[System.Threading.WaitHandle]::WaitAll($WaitHandles)

        # Überprüfe jeden Job auf Errors
        foreach ($Job in $Jobs) {
            # Beende die Ausführung des Runspaces
            $Job.PowerShell.EndInvoke($Job.Runspace)

            # Prüfe, ob Fehler aufgetreten sind
            if ($Job.Errors.Count -gt 0) {
                Write-Log -Level ERROR -Message "[$($Job.Errors.Count)] Fehler im Task '$($Job.Name)':"

                foreach ($Err in $Job.Errors) {
                    #Write-Host $Error.ToString() -ForegroundColor Yellow
                    $ErrorMessage = "[$($Job.Name)] Error: $($Err.Exception.Message)"
                    Write-Log -Level WARNING -Message $ErrorMessage -ExceptionInfo $Err
                }
            }
            else {
                $SyncHash.Timer::GetTimer($Job.FunctionName, $Job.Message)
                #$SyncHash.Timer::GetTimer($Job.FunctionName, $Job.Message, $Job.LogBody)
                #Write-Log -Level INFO -Message "Task '$($Job.Name)' erfolgreich abgeschlossen." -LogBody $Job.LogBody
            }
    
            # Bereinige den PowerShell-Runspace
            $Job.PowerShell.Dispose()
        }
        
    }
    catch {
        $Err = $_
        $ErrorMessage = $Err.Exception.Message
        $ErrorType = ($Err.GetType().FullName -Split ('.'))[-1]
        #$SyncHash.Logger.Log('ERROR', "Error in $FunctionName")
        Write-Log -Level ERROR -Message "[$ErrorType] $ErrorMessage"
    }
    
    #[Timer]::GetTimer($FunctionName, $Message)
    $SyncHash.Timer::GetTimer($FunctionName, $Message)
}
