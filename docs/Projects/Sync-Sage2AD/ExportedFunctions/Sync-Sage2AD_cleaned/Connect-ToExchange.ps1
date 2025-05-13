function Connect-ToExchange {
    PARAM (
        [Parameter(HelpMessage = 'http://<ServerFQDN>/powershell')]
        [system.string]$ConnectionUri = 'http://kowex01/powershell',

        [Alias('RunAs')]
        [pscredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    try {

        $Splatting = @{
            ConnectionUri     = $ConnectionUri
            ConfigurationName = 'microsoft.exchange'
            WarningAction     = 'SilentlyContinue'
        }

        IF ($PSBoundParameters['Credential']) { 
            $Splatting.Credential = $Credential 
        }

        # Load Exchange cmdlets (Implicit remoting)
        Import-PSSession -Session (New-PSSession @Splatting) -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Out-Null

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
