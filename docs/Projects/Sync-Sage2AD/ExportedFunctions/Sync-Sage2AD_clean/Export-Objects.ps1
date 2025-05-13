function Export-Objects {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $Name,
        [Object] $Object
    )

    $Object | Export-Clixml -Path ([System.IO.Path]::Combine([PathsManager]::GetScriptPath('Export'), "$Name.xml"))
}
