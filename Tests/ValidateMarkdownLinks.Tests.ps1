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
            #TODO: Context should show relative path starting from $RootPath (Replace $($file.Directory.Name))
            Context "Folder: $($file.Directory.Name)" {
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

        #TODO: Another test should get the coverage of existing Markdown files linked in indexes.
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
