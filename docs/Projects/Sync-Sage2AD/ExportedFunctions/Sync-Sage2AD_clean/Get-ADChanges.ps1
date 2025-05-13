function Get-ADChanges {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Find Differences and missing Data"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    ####################################################################################################################
    #TODO: Verwendung prüfen
    $Employees | Where-Object { $null -ne $_.AD -and $_.Sage.Nachname -ne $_.AD.Surname }

    $NameDiff = $Employees | Where-Object { $null -ne $_.AD -and $_.Sage.Vorname -ne $_.AD.GivenName }
    $NameDiff | Select-Object -Property Name, SamAccountName, GenSamAccName, @{Name = 'Vorname'; Expression = { $_.Sage.Vorname } }, @{Name = 'GivenName'; Expression = { $_.AD.GivenName } } | Out-HtmlView

    # Use SamAccountName if present, otherwise use GeneratedSamAccountName
    $AllAccountNames = $Employees | ForEach-Object { $_.SamAccountName ?? $_.GenSamAccName } | Where-Object { -not [string]::IsNullOrEmpty($_) }

    # Check for duplicates
    $Duplicates = $AllAccountNames | Group-Object | Where-Object { $_.Count -gt 1 }

    if ($Duplicates) {
        $Message = "❌ Duplicate SamAccountNames found:"
        $Duplicates | ForEach-Object { $Message = "$Message`n`t - $($_.Name) (Count: $($_.Count))" }

        Write-Log -Level WARNING -Message $Message
        #Write-Log -Level WARNING -Message "❌ Duplicate SamAccountNames found:"
        #$Duplicates | ForEach-Object { Write-Host " - $($_.Name) (Count: $($_.Count))" }
    }
    else {
        $Message = "✅ All SamAccountNames are unique."
        Write-Log -Level DEBUG -Message $Message
    }
    ####################################################################################################################

    #TODO: Einbauen
    $Employees = $global:Data.Employees.Values | Sort-Object -Property Name
    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD -and $_.employeeID -notin $global:SyncHash.Config.NoAccessUser.Keys }
    $global:Data.ADEmployees = $ADEmployees
    
    $PersNr = $ADEmployees | Where-Object { $_.Sage.PersNr -ne '' -and $_.AD.Personalnummer -ne $_.Sage.PersNr }
    $ID = $ADEmployees | Where-Object { $_.Sage.ID -ne '' -and $_.AD.EmployeeID -ne $_.Sage.ID }
    $ActivateMailbox = $ADEmployees | Where-Object { $null -eq $_.AD.msExchMailboxGuid }

    $Mobile = $ADEmployees | Where-Object { $_.Sage.Mobil -ne '' -and $_.AD.MobilePhone -ne $_.Sage.Mobil }
    $Language = $ADEmployees | Where-Object { $_.Sage.preferredLanguage -ne $_.AD.preferredLanguage }
    $Country = $ADEmployees | Where-Object { $_.Sage.Country -ne '' -and $_.AD.Country -ne $_.Sage.Country }

    $VorgesetzterInSage = $ADEmployees | Where-Object { $_.Sage.VorgesetzterID -ne '' -and $_.Sage.PersNr -notin $Script:Config.KeinVorgesetzter.Keys }
    $DifferentVorgesetzter = $VorgesetzterInSage | Where-Object {
        $VorgesetzterID = $_.Sage.VorgesetzterID
        $Vorgesetzter = $Employees | Where-Object { $_.Sage.ID -eq $VorgesetzterID }
        $_.AD.Manager -ne $Vorgesetzter.AD.DistinguishedName
    }
    
    $AddMemberToSageGroup = $ADEmployees | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Add) }
    $RemoveMemberFromSageGroup = $ADEmployees | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Remove) }
    $SageMembership = $ADEmployees | Where-Object { $_ -in $AddMemberToSageGroup -or $_ -in $RemoveMemberFromSageGroup }

    $ADChanges = @{
        ADEmployees               = $ADEmployees
        PersNr                    = $PersNr
        ID                        = $ID
        ActivateMailbox           = $ActivateMailbox
        Mobile                    = $Mobile
        Language                  = $Language
        Country                   = $Country
        DifferentVorgesetzter     = $DifferentVorgesetzter
        NewSageADGroups           = $global:SyncHash.AD.SageGroups.ToCreate
        AddMemberToSageGroup      = $AddMemberToSageGroup
        RemoveMemberFromSageGroup = $RemoveMemberFromSageGroup
        SageMembership            = $SageMembership
    }

    $global:SyncHash.ADChanges = $ADChanges

    #TODO: ADChangeManagement per Employee

    Invoke-Timer -FunctionName $FunctionName

    return
}
