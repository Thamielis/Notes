function Sync-Sage2AD {
    [CmdletBinding()]
    param (
        [Parameter()]
        [datetime]$Austrittsgrenze = (Get-Date -Date '01.03.2025'),
        [switch] $GetMailDifferences = $false,
        [switch] $ShowEmployees = $false,
        [switch] $ExportSyncHashs = $false
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Sage to AD Sync"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)
    
    try {
        
        Set-Runspace

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
        
        if ($ExportSyncHashs) {
            Export-Objects -Name 'SyncHash' -Object $global:SyncHash
            Export-Objects -Name 'Data' -Object $global:Data
        }
        
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    #Invoke-Timer -FunctionName $FunctionName
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)

    #return $ADSync
}
