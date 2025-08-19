
#TODO: Folgende Repos zusammenführen und löschen: https://github.com/Thamielis/tools.git 


$ReposList = gh repo list --limit 500 --json name,description,isPrivate,isInOrganization,isFork

$ReposList | Out-file -FilePath "GitHubRepos.json" -Encoding utf8 -Force
$Repos = ConvertFrom-Json -InputObject $ReposList

$MeineRepos = $Repos | Where-Object { $_.isFork -eq $False }
$MeineRepos | ConvertTo-Json | Out-File -FilePath "MeineRepos.json" -Encoding utf8 -Force

#$MeineRepos.Name | Sort-Object -Unique
$PythonRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Percipio|Trading|Python|Crypto|Procurve|Sophos|tools|scans' }
$VeeamRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Veeam' }
$SageRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Sage|CSV' }
$EScreensRepos = $MeineRepos | Where-Object { $_.Name -imatch 'PPT2SCR|PSeScreens' }
$MECMRepos = $MeineRepos | Where-Object { $_.Name -imatch 'MECM|SCCM|Driver' }
$HelpdeskRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Helpdesk|BaseUI' }
$ConfigRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Config|Basic|Company' }
$ToolsRepos = $MeineRepos | Where-Object { $_.Name -imatch 'In-Pro|ADQueries|NetAdapter|PowerML|Explore-PSFilesAndElements' }
$KnowledgeRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Knowledge|Doku|Notes|Wiki|docs|Thamiel|Links|PSModules' }
$RepoRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Repo' }
$UniversalDashboardRepos = $MeineRepos | Where-Object { $_.Name -imatch 'Universal|kow_pud|pudkow' }

$SortedRepoNames = $VeeamRepos.Name + $SageRepos.Name + $MECMRepos.Name + $ConfigRepos.Name + $KnowledgeRepos.Name + $RepoRepos.Name + $EScreensRepos.Name + $HelpdeskRepos.Name + $UniversalDashboardRepos.Name + $PythonRepos.Name + $ToolsRepos.Name
$RemainingRepos = $MeineRepos | Where-Object { $_.Name -notin $SortedRepoNames }
