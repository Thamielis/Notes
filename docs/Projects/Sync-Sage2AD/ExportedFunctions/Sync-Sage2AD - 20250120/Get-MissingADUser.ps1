function Get-MissingADUser {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    try {
        $MissingInAD = $Employees | Where-Object { $_.ADFoundWith -eq 'Missing' }
        $MissingInAD | ForEach-Object {
            $Status = New-ADUserAccount -NewUser $_
            if ($null -eq $_.Changes) {
                $_.Changes = [Ordered]@{}
            }
            $_.Changes.Add('NewADAccount', $Status)
        }

        if ($MissingInAD.Count -gt 0) {
            Write-Log -Level INFO -Message "Missing AD Accounts to create $($MissingInAD.Count)"

            foreach ($Employee in $MissingInAD) {
            
                if ($MissingInAD.IndexOf($Employee) -eq 0) {
                    $Employee = Update-Employee -SageUser $Employee.Sage -Changes $Employee.Changes -GetADUsers
                }
                else {
                    $Employee = Update-Employee -SageUser $Employee.Sage -Changes $Employee.Changes
                }
            
                $Employees.Remove($Employee)
                $Employees += $Employee
            }

            #$Employees = Get-MissingADUser -Employees $Employees

        }
        else {
            return $Employees
        }

    }
    catch {
        Write-Log -Level ERROR -Message "Error: " -ExceptionInfo $_
    }
    
}
