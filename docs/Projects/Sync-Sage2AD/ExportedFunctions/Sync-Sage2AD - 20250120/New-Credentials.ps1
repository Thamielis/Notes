function New-Credentials {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $UserName
    )

    $Pass = 'Kostwein2025!'
    $Password = $Pass | ConvertTo-SecureString -AsPlainText -Force
    
    return [System.Management.Automation.PSCredential]::new($UserName, $Password)
}
