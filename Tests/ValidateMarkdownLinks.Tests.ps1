#requires -modules Pester

BeforeDiscovery {
    $Script:RootPath = [System.IO.Path]::Combine($PSScriptRoot, '..', 'docs')
}

# Helper: extract links from markdown content
function Get-MarkdownLinks {
    [CmdletBinding()]
    param(
        [string]$Content
    )
    $pattern = '\[.*?\]\((.*?)\)'
    return ([regex]::Matches($Content, $pattern) | ForEach-Object { $_.Groups[1].Value })
}

Describe "Validate links in all index.md files" {
    
    Context "Knowledgebase" {
        $PathToTest = [System.IO.Path]::Combine($RootPath, 'Knowledge')
        # Find all index.md files
        $mdFiles = Get-ChildItem -Path $PathToTest -Filter index.md -Recurse -File

        foreach ($file in $mdFiles) {
            $relativeDir = [System.IO.Path]::GetRelativePath($RootPath, $file.Directory.FullName)
            $relativeDir = $relativeDir -replace '\\', '/'
            Context "Folder: $relativeDir" {
                $content = Get-Content -Path $file.FullName -Raw
                $links = Get-MarkdownLinks -Content $content | Where-Object { $_ -imatch '.md' }
                
                if ($links) {
                    foreach ($link in $links.Replace('<', '').Replace('>', '')) {

                        It "link '$link' should be valid" {
                            $Target = [System.IO.Path]::Combine($RootPath, $link)
                            Test-Path -Path $Target | Should -BeTrue -Because "Relative link '$link' should exist at resolved path '$target'"
                        }
                    }
                }
                
            }
        }

        Context "Coverage of markdown files referenced in indexes" {
            It "outputs markdown coverage" {
                $allLinks = foreach ($idx in $mdFiles) {
                    $idxContent = Get-Content -Path $idx.FullName -Raw
                    Get-MarkdownLinks -Content $idxContent | Where-Object { $_ -imatch '.md' } |
                        ForEach-Object { $_.Trim('<>') }
                }

                $allLinks = $allLinks | Select-Object -Unique

                $allMdFiles = Get-ChildItem -Path $PathToTest -Filter *.md -Recurse -File | Where-Object { $_.Name -ne 'index.md' }

                $notLinked = foreach ($md in $allMdFiles) {
                    $relative = [System.IO.Path]::GetRelativePath($RootPath, $md.FullName) -replace '\\', '/'
                    if ($allLinks -inotcontains $relative) { $relative }
                }

                $coverage = if ($allMdFiles.Count -gt 0) {
                    [math]::Round((($allMdFiles.Count - $notLinked.Count) / $allMdFiles.Count) * 100, 2)
                } else { 100 }

                Write-Host "Markdown coverage: $coverage% ($($allMdFiles.Count - $notLinked.Count)/$($allMdFiles.Count))"

                if ($notLinked) {
                    Write-Host "Unlinked files:" 
                    $notLinked | ForEach-Object { Write-Host " - $_" }
                }

                $true | Should -BeTrue
            }
        }
    }

}

<# 
Describe "Validate links in all index.md files" {
    # Find all index.md files
    $mdFiles = Get-ChildItem -Path $RootPath -Filter index.md -Recurse -File

    foreach ($file in $mdFiles) {
        Context "File: $($file.FullName)" {
            $content = Get-Content -Path $file.FullName -Raw
            $links = Get-MarkdownLinks -Content $content

            foreach ($link in $links) {
                It "link '$link' should be valid" {
                    if ($link -match '^https?://') {
                        # External link
                        try {
                            $resp = Invoke-WebRequest -Uri $link -Method Head -UseBasicParsing -ErrorAction Stop
                            $resp.StatusCode | Should -BeLessOrEqual 399
                        }
                        catch {
                            Assert-VerifiableMocks # force Pester failure
                            throw "External link '$link' is not reachable: $_"
                        }
                    }
                    else {
                        # Internal link (relative path)
                        $target = Join-Path -Path $file.DirectoryName -ChildPath $link
                        $exists = Test-Path -LiteralPath $target
                        $exists | Should -BeTrue -Because "Relative link '$link' should exist at resolved path '$target'"
                    }
                }
            }
        }
    }
}
#>
