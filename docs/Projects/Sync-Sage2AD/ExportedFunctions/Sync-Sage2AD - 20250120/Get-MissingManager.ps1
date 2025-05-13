function Get-MissingManager {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    $NoManager = $Employees | Where-Object { $_.Vorgesetzter -eq '' }

    $ManagerNotInSage = $Employees | Where-Object { $_.Sage.Vorgesetzter -eq '' }
    $ManagerInSage = $Employees | Where-Object { $_.Sage.Vorgesetzter -ne '' }

    $NotInAD = $Employees | Where-Object { $null -eq $_.AD }
    $ManagerNotInAD = $ManagerInSage | Where-Object { $_ -notin $NotInAD -and $null -eq $_.AD.Manager }

    $ManagerInSageNotInAD = $ManagerInSage | Where-Object { $_ -in $ManagerNotInAD }

    Write-Host "[$($NoManager.Count)] Mitarbeiter ohne Vorgesetzten."
    Write-Host "[$($ManagerNotInSage.Count)] Mitarbeiter ohne Vorgesetzten in Sage."
    #Write-Host "[$($ManagerInSage.Count)] Mitarbeiter mit Vorgesetzten in Sage."
    Write-Host "[$($NotInAD.Count)] Mitarbeiter ohne AD Account."
    Write-Host "[$($ManagerNotInAD.Count)] Mitarbeiter ohne Vorgesetzten in AD."
    Write-Host "[$($ManagerInSageNotInAD.Count)] Mitarbeiter mit Vorgesetzten in Sage aber ohne Vorgesetzten in AD."
    
}
