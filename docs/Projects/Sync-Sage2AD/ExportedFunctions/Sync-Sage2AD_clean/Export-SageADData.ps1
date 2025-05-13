function Export-SageADData {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch] $EmployeeData = $false
    )

    $ExportFile = Join-Path -Path $Script:ExportsPath -ChildPath 'Employees.csv'
    $ExportCSV = $global:SyncHash.Employees.Values | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, @{Name = "ADGroup"; Expression = { $_.ADGroups.SageGroup } }, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } }
    $ExportCSV | Export-Csv -Path $ExportFile -NoTypeInformation -Encoding utf8 -Delimiter ';'

}
