# PowerShell Helper Functions

## Enumeratoren finden

```powershell
# Hilfreiches Cmdlet für die PowerShell Objekt Analyse

function Get-Enum {
    param (
        [string]$Value, 
        [String]$Name, 
        [switch]$All
    )
    
    $defaultManifestModules = 'CommonLanguageRuntimeLibrary',
                              'Microsoft.CSharp.dll',
                              'Microsoft.Management.Infrastructure.dll',
                              'Microsoft.PowerShell.Commands.Management.dll',
                              'Microsoft.PowerShell.commands.Utility.dll',
                              'System.dll',
                              'System.Configuration.dll',
                              'System.Configuration.Install.dll',
                              'System.Core.dll',
                              'System.Data.dll',
                              'System.DirectoryServices.dll',
                              'System.Management.Automation.dll',
                              'System.Management.dll',
                              'System.ServiceProcess.dll',
                              'System.Transactions.dll',
                              'System.Xml.dll'

    [System.AppDomain]::CurrentDomain.GetAssemblies() | 
        Where-Object -FilterScript { $All -or ($defaultManifestModules -contains $_.ManifestModule) } | 
        ForEach-Object -Process { 
            try { 
                $_.GetExportedTypes() 
            } catch { 
                'Keine ExportedTypes vorhanden' | Write-Verbose 
            } 
        } | Where-Object -FilterScript { $_.IsEnum -and $_.Name -imatch $Name } | 
                ForEach-Object -Process {
                    return [PSCustomObject]@{
                        Name   = $_.FullName
                        Source = $_.Module.ScopeName
                        Values = [System.Enum]::GetNames($_)
                    }
                } | Where-Object -Property Values -imatch -Value $Value
 }

Get-Enum -Value 'SilentlyContinue'
Get-Enum -Name 'ServiceStartMode'
Get-Enum -All | Measure-Object

```

## Objekte erweitern

```powershell
# Hilfreiche Erweiterung für die PowerShell Objekt Analyse

$code = {
    Add-Type -AssemblyName "System.Windows.Forms"

    $propertyGrid                            = New-Object -TypeName "System.Windows.Forms.PropertyGrid"
    $propertyGrid.Dock                       = [System.Windows.Forms.DockStyle]::Fill
    $propertyGrid.PropertySort               = [System.Windows.Forms.PropertySort]::Alphabetical
    $propertyGrid.CanShowVisualStyleGlyphs   = $true
    $propertyGrid.CommandsVisibleIfAvailable = $true
    $propertyGrid.HelpVisible                = $true
    $propertyGrid.ToolbarVisible             = $true
    $propertyGrid.SelectedObject             = $this

    $window         = New-Object -TypeName "System.Windows.Forms.Form"
    $window.Text    = $this.ToString()
    $window.Size    = New-Object -TypeName "System.Drawing.Size" -ArgumentList @(600, 800)
    $window.TopMost = $true
    $window.Controls.Add($propertyGrid)
    $window.ShowDialog() | Out-Null
}

Update-TypeData -MemberType "ScriptMethod" -MemberName "ShowObject" -Value $code -TypeName "System.Object" -Force

```
