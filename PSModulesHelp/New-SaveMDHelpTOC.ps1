[string]$ScriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

$dir = $ScriptPath
$files = Get-ChildItem -Path $dir -Recurse -Include *.md

$toc += "# Modul Dokumentationen`n"
$markdown += "# Modul Dokumentationen`n`n"

$dirs = $files | Select-Object -ExpandProperty Directory | Select-Object -Unique

foreach ($dir in $dirs) {

    $RelativePath = [System.IO.Path]::GetRelativePath($ScriptPath, $dir.FullName)

    $toc += "`n## $($dir.Name)`n"
    $markdown += "`n"
    $markdown += New-MDHeader $($dir.Name) -Level 2
    $markdown += "`n"
    $ModuleImported = Find-Module -Name $dir.Name -ErrorAction SilentlyContinue
<#
    if (!($ModuleImported)) {
        $ModuleImported = Get-Module -Name $dir.Name -ListAvailable
        if (!($ModuleImported)) {
            Install-Module -Name $dir.Name | Import-Module | Out-Null
            $ModuleImported = Get-Module -Name $dir.Name
        }
        else {
            Import-Module -Name $dir.Name | Out-Null
            $ModuleImported = Get-Module -Name $dir.Name
        }
    }
#>
    $Description = $ModuleImported.Description
    #$markdown += New-MDHeader "Description" -Level 3
    #$markdown += New-MDParagraph -Lines $($Description) #-NoNewLine

    $filesInDir = $files | Where-Object { $_.Directory.Name -eq $dir.Name }
    
    $markdown += @"
<details>
<summary>$(New-MDParagraph -Lines $($Description) -NoNewLine)</summary>`n`n
"@
    
    foreach ($file in $filesInDir) {
        $toc += "- [$($file.BaseName)]($($file.Directory.Name)/$($file.Name))`n"
        #$markdown += New-MDLink -Text $file.BaseName -Link $($RelativePath/$file.Name)
        
        $markdown += "- [$($file.BaseName)](<$($RelativePath)/$($file.Name)>)`n"
    }
    
    $markdown += "</details>`n"
}

$tocName = "ModuleDoku"

#$toc | Out-File -FilePath "$dir\$tocName.md" -Encoding utf8
$markdown | Out-File -FilePath "$ScriptPath\$tocName.md" -Encoding utf8 #-Append
