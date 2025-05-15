# [Building a custom Windows Update Report p1: Parsing HTML via PowerShell on modern systems (no IE)](https://arsenb.wordpress.com/2022/07/28/building-a-custom-windows-update-report-p1-parsing-html-via-powershell-on-modern-systems-no-ie/)

Wow, it’s been a while! A customer of mine recently wanted a detailed report that should include info such as how many weeks is the Windows on the machine behind the latest available Security Update. We’ve found to a way to combine Intune Data Warehouse and PowerBI to pull data that allows to identify the last installed patch, but we needed data from a different source to find out when that patch was released. And that involved some PowerShell, which Is what this part of the mini-series is about.

## Problem Statement

The required info is found in the Windows Release Health section of MS Docs website: [Win10](https://docs.microsoft.com/en-us/windows/release-health/release-information) and [Win11](https://docs.microsoft.com/en-us/windows/release-health/windows11-release-information) pages respectively. They contain very nice tables that look like this:

[![](https://arsenb.files.wordpress.com/2022/07/image.png?w=893)](https://arsenb.files.wordpress.com/2022/07/image.png)[Windows Release Information](https://docs.microsoft.com/en-us/windows/release-health/release-information) docs page has lots of useful information

From there, it is easy to figure out the release date for every OS build (which includes Quality/Security and Feature updates). Problem is, there is no machine-readable version of it (JSON/XML/CSV). And to make matters worse, the “human-friendly” Windows version (i.e. “21H2”) is not even part of the table! How can we approach this?

## Looking for a solution

There are two options: copy-paste manually (“nnnoooooooo…..” (c)Luke Skywalker”) or load the page programmatically and scrape the HTML. Fortunately, all the tables have a common **id** tag format and all the headings containing the human-friendly Windows version are wrapped into a **&lt;strong&gt;** tag, which we can also leverage.

Using PowerShell it is quite simple to pull down an HTML page and parse it using (*thanks, Internet*) the **[ParsedHtml](https://docs.microsoft.com/en-us/dotnet/api/microsoft.powershell.commands.htmlwebresponseobject.parsedhtml?view=powershellsdk-1.1.0#microsoft-powershell-commands-htmlwebresponseobject-parsedhtml)** property of the result returned by the **[Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-5.1)** cmdlet. …Except that it does not work if your system has Internet Explorer! Does you machine have one? Mine does not.

There are workarounds based on creating COM objects etc. that were not stable on my machine. I ended up (*thanks, Internet*) finding a workaround called **HTML Agility Pack** and its wrapper called [PowerHTML](https://www.powershellgallery.com/packages/PowerHTML/0.1.6).

```powershell
PS> Install-Module -Name PowerHTML
```

Afterward, the script was relatively easy to build (most of the time spent unwrapping the resulting structure for proper CSV output). You are free to use and modify the script. ***Note that this is a raw MVP-kind of script – no error-checking and input validation whatsoever. You are responsible for everything that happens after you run it! 🙂***

The command line for running the script is  below. The output formats can be JSON or CSV. If this parameter is not specified it will return a pure PowerShell object (can be piped to other cmdlets). Otherwise just pipe it into a file.

```powershell
Get-WindowsUpdateBuildsData [-OutFormat <JSON, CSV>] | <next step>
Get-WindowsUpdateBuildsData -CSV | WinVersions.csv
```

Here is the script itself, the output is below.

```powershell
[CmdletBinding()]
Param(
    [string]$OutFormat = "raw"
)
$ProgressPreference = 'SilentlyContinue'
$URLs = @{
"10" = "https://docs.microsoft.com/en-us/windows/release-health/release-information" #Win10
"11" = "https://docs.microsoft.com/en-us/windows/release-health/windows11-release-information"
}
$VersionTable = @{}
$BuildVersionTable = @{}
function PullUpdateData {
    param (
        $ver = "10"
    )
    $Response = Invoke-WebRequest -Uri $URLs[$ver] -UseBasicParsing -ErrorAction Stop
    $HTMLdom = ConvertFrom-Html($Response)
    #First parse the Build number relationship - OS Name relationship
    #they are enclosed into <strong> element and have a format of "Version 21H2 (OS build 19044)"
    #one of them has "RTM", so we get rid of it via Substring
    $BuildVersions = $HTMLdom.SelectNodes('//strong') | Where-Object {$_.InnerText -match "^Version*"}
    foreach ($element in $BuildVersions) {
        $res = (Select-String -InputObject $element.InnerText -Pattern "^Version (.+?) \(OS build (\d+)\)").Matches[0]
        $BuildVersionTable[$res.Groups[2].Value] = $res.Groups[1].Value.Substring(0,4)
    }
    #Then parse the history tables into relevant sections
    #the history tables have id historyTable##
    $tables = $HTMLdom.SelectNodes('//table') | Where-Object {
        $_.Attributes['id'].Value  -match "historyTable"
    }
    #parse each table. First row should contain headers (th).
    foreach ($table in $tables) {
        $headers = $table.SelectNodes('tr')[0].SelectNodes('th').InnerText
        foreach ($row in $table.SelectNodes('tr')) {
            $values = $row.SelectNodes('td').InnerText
            if ($null -eq $values) { continue } # for the row containing headers
            $newrow = @{}
            for ($index = 0; $index -lt $values.count; $index++) {
                $newrow[$headers[$index]] = $values[$index]
            }
            $build = $newrow['Build'].Split('.')[0]
            $newrow['BuildShort'] = $build
            $newrow['BuildFull'] = "10.0."+$newrow['Build']
            $newrow['Version'] = $BuildVersionTable[$build]
            $newrow['WinVer'] = $ver
            $VersionTable[$newrow['Build']] = $newrow
        }
    }
}
PullUpdateData("10")
PullUpdateData("11")
$VersionArray = $VersionTable.GetEnumerator() | Sort-Object  $_.Key | ForEach-Object{[PSCustomObject]$_.Value}
switch ($OutFormat) {
    "CSV"  { return ($versionArray | ConvertTo-CSV -NoTypeInformation)}
    "JSON" { return ($versionArray | ConvertTo-JSON)}
    Default { return $VersionArray}
}
```

The script produces a data structure like this (*CSV file with several example rows*), which includes the patch date and several variations of the OS Version (full, partial, human friendly etc.) for various potential use cases. Note that if you are using Excel you must load the build numbers as Text, Excel insists that they are Integer, which messes them up.

[![](https://arsenb.files.wordpress.com/2022/07/image-2.png?w=1024)](https://arsenb.files.wordpress.com/2022/07/image-2.png)Sample rows from the resulting CSV file

## Summary

Now we can load this data into PowerBI to cross-reference with the **osVersion **device property from the **[Intune Data Warehouse](https://docs.microsoft.com/en-us/mem/intune/developer/reports-nav-create-intune-reports)** and build a detailed OS Update report, including how many weeks is the device behind the latest security update and show all kinds of useful graphs and charts (percentages against threshold, compliant/non-compliant devices, etc.). Which will be the next part of this blog once I figure out how to build cool visuals in PowerBI and get more familiar with PBI DAX (*or give up and just publish the PBI query and data transform, whichever comes first*).

Why use Data Warehouse instead of direct calls against the Intune API?
