
# $Token = ''
# Connect-GitHub -Token $Token

function Get-GitHubRepos {
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )

    Import-Module GitHub -ErrorAction Stop

    <# $Organizations = @(
        'In-Pro-Org'
        'KOWThamielis'
    ) #>

    $AllRepos = @{}
    #$Contexts = @{}
    $All = @()

    <# foreach ($Org in $Organizations) {
        #$Contexts[$Org] = Get-GitHubOrganization -Organization $Org
        $AllRepos[$Org] = Get-GitHubRepository -Owner $Org #| Where-Object { $_.fork -eq $false }
        $All += $AllRepos[$Org]
    } #>
    
    $AllRepos['Thamielis'] = Get-GitHubRepository #| Where-Object { $_.fork -eq $false }
    $All += $AllRepos['Thamielis']
    $AllRepos['All'] = $All

    # Step 3: Filter original (non-forked)
    $MeineRepos = $AllRepos.Thamielis | Where-Object { $_.Fork -ne $True } | Sort-Object -Property name
    $AllRepos['MeineRepos'] = $MeineRepos

    # Step 4: Define categories
    $Categories = @{
        Kostwein           = 'KOW'
        Projekte           = 'PSMLNet|PSVisualizer|ServiceAccounts|Device2UserMapping|PSAssetManagement|Scrape2Markdown|AnalyzePSCode'
        Veeam              = 'Veeam'
        Sage               = 'Sage|CSV'
        MECM               = 'ConfigMgr|MECM|SCCM|Driver'
        Config             = 'PS(.*)?(?:Config|Base)|Basic|Company'
        Knowledge          = 'Knowledge|Doku|Notes|Wiki|docs|Thamiel|Links|PSModules|codedoc'
        Repo               = 'Repo|PowerShell-Main'
        EScreens           = 'PPT2SCR|PSeScreens'
        Helpdesk           = 'Helpdesk|BaseUI'
        UniversalDashboard = 'Universal|kow_pud|pudkow'
        Python             = 'Percipio|Trading|Python|Crypto|Procurve|Sophos|tools|scans|bitcoin'
        Tools              = 'GlobalPS|In-Pro|ADQueries|NetAdapter|PowerML|Explore-PSFilesAndElements|PSToolbox'
        Template           = 'PSModuleTemplate'
        Banking            = 'Banking'
        Dell               = 'DellEMC'
    }

    # Step 5: Match repos to categories
    $CategoryMatches = @{}
    $MatchedRepoNames = New-Object System.Collections.Generic.HashSet[string]

    foreach ($Category in $Categories.Keys) {
        $Pattern = $Categories[$Category]
        $RepoMatches = $MeineRepos | Where-Object { $_.Name -imatch $Pattern }
        $CategoryMatches[$Category] = $RepoMatches
        $RepoMatches.Name | ForEach-Object { $MatchedRepoNames.Add($_) } | Out-Null
    }

    $CategoryMatches | Export-Clixml -Path "CategorizedRepos.xml" -Depth 3 -Force -Encoding utf8

    # Step 6: Remaining repos
    $RemainingRepos = $MeineRepos | Where-Object { -not $MatchedRepoNames.Contains($_.Name) }

    # Step 7: Output
    $SortedRepoNames = $CategoryMatches.Values | ForEach-Object { $_.Name }
    $SortedRepoNames += $RemainingRepos.Name
    $SortedRepoNames | Sort-Object | Out-File -FilePath "SortedRepoNames.txt" -Encoding utf8 -Force

    # Optional: Export full original repo list
    $MeineRepos | ConvertTo-Json -Depth 3 | Out-File -FilePath "MeineRepos.json" -Encoding utf8 -Force

}
