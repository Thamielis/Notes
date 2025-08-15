<# PSFunctionInfo

    Version 0.0.1
    Author Mario Mellunig
    CompanyName 
    Copyright 2025
    Description Diese Funktion liest eine CSV-Datei ein, konvertiert die Daten in ein PowerShell-Objekt und speichert diese als YAML-Datei.
    Guid f4e1eb13-fb09-4d46-b73e-9b330a40d89a
    Tags 
    LastUpdate 09.08.2025 19:43
    Source B:\PowerShell\Notes\docs\Projects\Import-CsvToYaml.ps1

#>
<#
    .SYNOPSIS
        Importiert CSV-Daten und exportiert sie als YAML-Datei.
    .DESCRIPTION
        Diese Funktion liest eine CSV-Datei ein, konvertiert die Daten in ein PowerShell-Objekt und speichert diese als YAML-Datei.
    .PARAMETER CsvPath
        Pfad zur CSV-Datei.
    .PARAMETER YamlPath
        Pfad zur zu erstellenden YAML-Datei.
    .EXAMPLE
        Import-CsvToYaml -CsvPath 'C:\Temp\data.csv' -YamlPath 'C:\Temp\data.yaml'
    .NOTES
        Autor: [Name]
        Version: 1.0.0
        Datum: 2025-08-09
#>
function Import-CsvToYaml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path $_})]
        [string]$CsvPath,

        [Parameter(Mandatory)]
        [string]$YamlPath
    )

    try {
        $Data = Import-Csv -Path $CsvPath
        $Data | ConvertTo-Yaml | Out-File -FilePath $YamlPath -Encoding UTF8
        Write-Log -Message "CSV erfolgreich in YAML exportiert: $YamlPath" -Level Info
    }
    catch {
        Write-Log -Message "Fehler beim Export: $_" -Level Error
        throw
    }
}
