function Sync-Sage {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch] $GetMailDifferences = $false,
        [switch] $ShowEmployees = $false
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Sage to AD Sync"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)

    $Austrittsgrenze = Get-Date -Date '01.03.2025'

    try {
        
        Get-BaseData
        $Employees = Start-SageDataProcess -Austrittsgrenze $Austrittsgrenze

        Export-SageADData -EmployeeData

        if ($ShowEmployees) {
            Show-Employees -Employees $Employees
        }

        if ($GetMailDifferences) {
            Get-MailDifference -Employees $Employees
        }
        
        $EmployeesToSync = $Employees #| Where-Object { $_.Sage.Country -eq 'HR' }

        Get-ADChanges -Employees $EmployeesToSync
        Set-ADChanges
        
        $global:SyncHash | Export-Clixml -Path ([System.IO.Path]::Combine([PathsManager]::GetScriptPath('Export'), 'SyncHash.xml'))
        $global:Data | Export-Clixml -Path ([System.IO.Path]::Combine([PathsManager]::GetScriptPath('Export'), 'Data.xml'))
        
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    #Invoke-Timer -FunctionName $FunctionName
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)

    return $ADSync
}
