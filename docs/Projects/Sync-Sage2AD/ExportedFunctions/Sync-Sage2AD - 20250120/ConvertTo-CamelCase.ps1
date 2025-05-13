function ConvertTo-CamelCase {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Name
    )

    $TextInfo = (Get-Culture).TextInfo

    $TextInfo.ToTitleCase($Name)
}
