function Start-SageDataProcess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [datetime] $Austrittsgrenze
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Processing Sage UserData and find AD Account"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    [Timer]::GetTimer($FunctionName, $Description)
    
    $CleanData = $global:SyncHash.Sage.CleanData | Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_."Pers.Nr." -ne '6100' } | Where-Object { -not [string]::IsNullOrEmpty($_.Vorname) -and $_.Nachname -notmatch 'Reinigung|Betriebsarzt' }
    
    try {

        if ($CleanData) {

            $ScriptBlock = {
                param (
                    $SyncHash,
                    $Data,
                    $sUser,
                    $Austrittsgrenze
                )

                $UserData = New-SageObject -sUser $sUser
            
                if ($UserData.Austritt -eq '' -or $UserData.Austritt -ge $Austrittsgrenze) {
                
                    $Employee = Update-Employee -SageUser $UserData
                    $global:SyncHash.Employees.Add($UserData.PersNr, $Employee)

                    $global:Data.Employees[$UserData.PersNr] = $Employee
                }

            }

            foreach ($sUser in $CleanData) {
                $Params = @{
                    SyncHash        = $SyncHash
                    Data            = $Data
                    sUser           = $sUser
                    Austrittsgrenze = $Austrittsgrenze
                }

                $JobName = $sUser."Pers.Nr."
                New-RunspaceJob -JobName $JobName -ScriptBlock $ScriptBlock -RunspacePool $Global:SyncHash.Runspace.RunspacePool -Parameters $Params

                $Global:SyncHash.Runspace.Jobs += [PSCustomObject]@{
                    "$($JobName)" = $global:runspaces.Clone() | Where-Object { $_.JobName -eq $JobName }
                }
            }

        }
        
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "[$($sUser.Name)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    Receive-RunspaceJob -Wait

    if ($SyncHash.Errors) {
        Write-Log -Level ERROR -Message 'Error: ' -ExceptionInfo $SyncHash.Errors
    }

    $global:SyncHash.Sage.ADGroupNames = $CleanData.SageADGroup | Sort-Object -Unique | Sort-Object
    
    Get-SageGroups

    $global:SyncHash.Sage.NotInCleanData = $global:SyncHash.Sage.DataRaw | Where-Object { $_.'Pers.Nr.' -notin $CleanData.'Pers.Nr.' }
    $global:SyncHash.Sage.LeavingEmployees = $CleanData | Where-Object { $_.'Pers.Nr.' -notin $global:Data.Employees.Values.employeeID }
    $global:SyncHash.Sage.NotInAD = $global:Data.Employees.Values | Where-Object { $null -eq $_.AD }

    $Employees = $global:Data.Employees.Values | Sort-Object -Property Name

    #Invoke-Timer -FunctionName $FunctionName
    [Timer]::GetTimer($FunctionName, $Description)
    
    return $Employees
    
}
