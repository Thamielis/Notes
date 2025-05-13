function Update-Employee {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $SageUser,
        [Object] $Changes,
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
    }

    $Employee.Changes = $Changes

    return $Employee
}
