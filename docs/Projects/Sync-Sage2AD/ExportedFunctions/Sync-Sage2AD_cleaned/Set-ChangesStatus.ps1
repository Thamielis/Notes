function Set-ChangesStatus {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $Attribute,
        [Parameter()]
        [string] $Action,
        [Parameter()]
        [string] $OldValue,
        [Parameter()]
        [string] $NewValue,
        [Parameter()]
        [string] $Status
    )

    $Change = [PSCustomObject]@{
        Attribute = $Attribute
        Action    = $Action
        OldValue  = $OldValue
        NewValue  = $NewValue
        Status    = $Status
    }

    return $Change
}
