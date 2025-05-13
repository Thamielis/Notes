function Update-Employee {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $SageUser,
        [switch] $GetADUsers
    )

    $Params = @{
        UserData = $SageUser
    }

    if ($GetADUsers) {
        $Params.GetADUsers = $true
    }

    $Employee = Find-ADUser @Params

    if ($Employee.AD) {
        $Employee.eMailAD = $Employee.AD.mail

        if ($Employee.AD.mail -ne $Employee.eMailSage) {
            if ($Employee.AD.ProxyAddresses -ccontains "smtp:$($Employee.eMailSage)") {
                $Employee.eMailAD = $Employee.eMailSage
            }
            else {
                $Employee.eMailAD = $Employee.AD.mail
            }
        }
        
    }

    return $Employee
}
