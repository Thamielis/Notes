function Get-NameExtraction {
    [CmdletBinding()]
    param (
        [Parameter()]
        $csvData
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Cleaning Sage Data"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    foreach ($row in $csvData) {
        $nameField = $row.NAME -replace '\s+', ' ' # Normalize whitespace
        
        if ($nameField -match 'HECTAS') {
            $leihFirma, $sName = $nameField.Split(', ')
            $lastName, $firstName = $sName.Split(' ').ToLower().Trim()
        }
        # Improved Regex pattern for handling new cases
        elseif ($nameField -match '^([^/]+)\s*/\s*([^,]+),\s*(.+)$') {
            # Case with Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $leihFirma = $matches[2].ToLower().Trim()
            $firstName = $matches[3].ToLower().Trim()
        }
        elseif ($nameField -match '^([^,]+),\s*(.+)$') {
            # Case without Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $firstName = $matches[2].ToLower().Trim()
            $leihFirma = $null
        }
        else {
            # Default case if no match
            $lastName = ''
            $firstName = ''
            $leihFirma = ''
        }

        # Convert extracted data to CamelCase
        $lastName = ConvertTo-CamelCase -Name $lastName
        $firstName = ConvertTo-CamelCase -Name $firstName
        if ($leihFirma) {
            $leihFirma = ConvertTo-CamelCase -Name $leihFirma
        }

        # Add properties to the row
        $row | Add-Member -MemberType NoteProperty -Name 'Nachname' -Value $lastName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Vorname' -Value $firstName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Leihfirma' -Value $leihFirma -Force

        if ($lastName -and $firstName) {
            $GeneratedSAMAccount = ($lastName.Trim() + $firstname.Substring(0, 1).Trim()).ToLower() -replace ' ', ''
            
        }
        else {
            $GeneratedSAMAccount = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'GenSamAcc' -Value $GeneratedSAMAccount -Force

        if (-not([string]::IsNullOrWhiteSpace($row.Kostenstelle) -and [string]::IsNullOrWhiteSpace($row.Abteilung))) {
            
            $SageGroupAbteilung = $row.Abteilung -replace '[- ]+', '_' -replace '\.|\(|\)', ''
            $GroupName = "Sage_{0}_{1}" -f $SageGroupAbteilung, $row.Kostenstelle
            
        }
        else {
            $GroupName = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'SageADGroup' -Value $GroupName -Force


        $sVorgesetzterNachname, $sVorgesetzterVorname = $row.'Vorgesetzter Name'.Split(', ').ToLower()
        if ($sVorgesetzterNachname -and $sVorgesetzterVorname) {
            $Vorgesetzter = -join ($TextInfo.ToTitleCase($sVorgesetzterNachname), ' ', $TextInfo.ToTitleCase($sVorgesetzterVorname))
        }
        else {
            $Vorgesetzter = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'Vorgesetzter' -Value $Vorgesetzter -Force
        

    }

    $csvData | Export-Csv -Path "clean_canon.csv" -NoTypeInformation

    Invoke-Timer -FunctionName $FunctionName

    return $csvData
    
}
