---
created: 2022-03-10T18:25:40 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/powershell-export-gpo/
author: 
---

# Using PowerShell to Export GPOs to Create a Fancy GPO Report

> ## Excerpt
> Learn how to import the GPO module in PowerShell, use PowerShell to export GPOs, and get GPOs linked to an OU to build some fancy reports.

---
Have you ever wondered what’s happening with group policy in your environment? Perhaps you have hundreds of group policy objects (GPOs). It’s hard to keep track of all of the changes applied to your Active Directory (AD) domain! Lucky for you, PowerShell can export GPOs and create some fancy reports!

> _Discover, report and prevent insecure Active Directory account passwords in your environment with [Specops’ completely free Password Auditor Pro](https://specopssoft.com/product/specops-password-auditor/?utm_source=ATA&utm_medium=referral&utm_campaign=ATA%20promo%202021&utm_content=SPA%20in-article%20link). Download it today!_

The Get-GpoReport cmdlet generates reports on GPOs allowing you to create simple text-based reports to full-fledged HTML reports. Using PowerShell to automate this report-generation process, you can save time and get key insights on what’s happening in your AD environment.

In this tutorial, you’re going to learn how to import the GPO module in PowerShell, use PowerShell to export GPOs, get GPOs linked to an OU as an example to ultimately come together to create some awesome reports!

-   [The GUI Way Doesn’t Cut It](https://adamtheautomator.com/powershell-export-gpo/#The_GUI_Way_Doesnt_Cut_It "The GUI Way Doesn’t Cut It")
-   [Prerequisites](https://adamtheautomator.com/powershell-export-gpo/#Prerequisites "Prerequisites")
-   [Generating HTML Reports: Single GPO](https://adamtheautomator.com/powershell-export-gpo/#Generating_HTML_Reports_Single_GPO "Generating HTML Reports: Single GPO")
-   [Generating HTML Reports: All GPOs](https://adamtheautomator.com/powershell-export-gpo/#Generating_HTML_Reports_All_GPOs "Generating HTML Reports: All GPOs")
-   [Using PowerShell to Export GPOs: XML](https://adamtheautomator.com/powershell-export-gpo/#Using_PowerShell_to_Export_GPOs_XML "Using PowerShell to Export GPOs: XML")
-   [Diving into the GPO XML Report](https://adamtheautomator.com/powershell-export-gpo/#Diving_into_the_GPO_XML_Report "Diving into the GPO XML Report")
-   [Going Deeper: Parsing XML GPO Reports](https://adamtheautomator.com/powershell-export-gpo/#Going_Deeper_Parsing_XML_GPO_Reports "Going Deeper: Parsing XML GPO Reports")
-   [Using PowerShell to Get a GPO Linked to an OU](https://adamtheautomator.com/powershell-export-gpo/#Using_PowerShell_to_Get_a_GPO_Linked_to_an_OU "Using PowerShell to Get a GPO Linked to an OU")
-   [Further Reading](https://adamtheautomator.com/powershell-export-gpo/#Further_Reading "Further Reading")

## The GUI Way Doesn’t Cut It

Traditionally, we’ve always had the [Group Policy Management Console (GPMC)](https://docs.microsoft.com/en-us/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11). This application comes installed by default on all domain controllers and via the [Remote Server Administration Tools (RSAT) package](https://adamtheautomator.com/powershell-import-active-directory/).

The GPMC works allowing you to check each policy setting and how the policies may apply to clients. Think of the GPMC as your standalone GPO management station for creating, modifying, and removing GPOs.

GPMC remains the primary tool for editing GPOs. But better tools are needed for reporting, troubleshooting, and automation purposes.

Then came the Powershell Get-GpoReport cmdlet from the Group Policy [PowerShell module](https://adamtheautomator.com/powershell-modules/) (a part of the RSAT package) that uses PowerShell to export GPOs. This cmdlet is now able to retrieve the same information as the GPMC does via PowerShell allowing you to query many GPOs at once and build some nice reports.

## Prerequisites

In this blog post, you’re going to walk through some scenarios. If you’d like to follow along with the examples, be sure you have the following in place already:

-   The [Group Policy](https://adamtheautomator.com/what-is-group-policy/) PowerShell module. You can find this by downloading and installing [RSAT](https://adamtheautomator.com/powershell-import-active-directory/) if you’re on Windows 10 or you can run the PowerShell command `Install-WindowsFeature -Name GPMC` if you’re on Windows Server. This tutorial will assume you’ve already imported the GPO module in PowerShell.
-   You are logged onto a computer that is a member of the same AD domain you’re going to be querying GPOs from.
-   You are logged onto an AD-joined computer with a domain user account with rights to read GPOs. If you’re logged on with a local account, you will probably see the error message below.

![Current security context is not associated with an Active Directory domain or forest error message](https://adamtheautomator.com/wp-content/uploads/2020/09/016_No-AD-Domain.png)

Current security context is not associated with an Active Directory domain or forest error message

-   You have Internet Explorer (IE) available. Unfortunately, the HTML reports that Get-GPOReport generates contain ActiveX controls, you’ll need IE if you’d like to take advantage of showing/collapsing some sections in the reports.

![Viewing HTML reports in IE](https://adamtheautomator.com/wp-content/uploads/2020/09/030_Allow-ActiveX.png)

Viewing HTML reports in IE

![Viewing HTML reports in other browsers](https://adamtheautomator.com/wp-content/uploads/2020/09/040_Reports-without-ActiveX.png)

Viewing HTML reports in other browsers

## Generating HTML Reports: Single GPO

To get started, let’s say you have a single GPO you’d like to view the settings (and generate an HTML report from). To do that, you’ll either need the name of the GPO or the GPO’s GUID. Fortunately, Get-GpoReport can find a GPO on either and use PowerShell to export them.

To generate a simple HTML report, you’ll need to use at least three parameters:

-   `Guid` or `Name` to find the GPO
-   `ReportType` to specify the kind of report to generate (HTML or XML)
-   `Path` to specify where you’d like the HTML report saved to

Perhaps you have a GPO called _AppLocker Publisher Block Rules (EXE)_ in your environment. If you know the name of the GPO as in this case, you can simply provide the name to the `Name` parameter along with a `ReportType` of HTML for an HTML (not XML) report and the path where you’d like to save this HTML file to.

The below example is querying the domain for the _AppLocker Publisher Block Rules (EXE)_ GPO then building an HTML report saving to the _C:\\Temp\\AppL-Report.html_ file location.

```
Get-GPOReport -Name 'AppLocker Publisher Block Rules (EXE)' -ReportType 'HTML' -Path 'C:\Temp\AppL-Report.html'
```

You could alternatively use the `Guid` parameter to find the GPO but this is an extra step using the below example.

```
$guid = (Get-GPO -Name 'AppLocker Publisher Block Rules (EXE)').Id
Get-GPOReport -Guid $guid -ReportType 'HTML' -Path 'C:\Temp\AppL-Report.html'
```

Once created, you can open the report in your favorite browser and review it.

## Generating HTML Reports: All GPOs

Perhaps you’d like to build a domain-wide report for GPOs. In that case, you’ll need to query all GPOs in the domain using the `All` parameter.

Below you can see the same command to have PowerShell export GPOs and run it except this time rather than using the `Name` or `Guid` parameter to specify a single GPO, you’re using the `All` parameter to find them all.

```
Get-GPOReport -All -ReportType Html -Path "C:\Temp\All-GPOs.html"
```

> _The `Get-GPOReport` cmdlet, when run in an AD environment, queries a domain controller (DC) provided via the `Server` parameter to read GPOs. If no `Server` is provided, it will default to the DC holding the PDC Emulator role._

## Using PowerShell to Export GPOs: XML

When you have imported the GPO module in PowerShell, you can do more with Get-GPOReport than just use PowerShell to export GPOs and generate HTML reports. You can create XML reports too. If, for example, you’d like to create an XML report for a particular GPO, you’d simply need to change the value for the `ReportType` parameter from HTML to XML.

The below example is querying an existing GPO called _Google Chrome_, generating an XML report, and opening it via `Invoke-Item` in the default app associated with the XML file (probably your default browser).

```
# Export the XML report for the GPO to an XML file
Get-GPOReport -Name 'Google Chrome' -ReportType Xml -Path "C:\temp\GoogleChromeGpReport.xml"
# Open the XML file
Invoke-Item -Path "C:\Temp\GoogleChromeGpReport.xml"
```

When complete, you will see the XML file generated below.

The first thing you’ll notice is that everything is contained in the GPO XML node. Inside it you may find things like _Identifier_ (the GPO GUID), _Name_ (The GPO Name), _Include Comments_, _Security Descriptor_, _SDDL_, and a lot more information.

![XML report via Get-GpoReport](https://adamtheautomator.com/wp-content/uploads/2020/09/070_XML_report_browser.png)

XML report via Get-GpoReport

## Diving into the GPO XML Report

What makes this XML report so different than HTML other than the format? In the XML report, you will see the attributes shown in the HTML report, but they are more structured and easy to parse (not for the human eye, but for an automation tool like PowerShell).

![XML nodes in the XML report](https://adamtheautomator.com/wp-content/uploads/2020/09/071_XML_report_Versions.png)

XML nodes in the XML report

-   _VersionDirectory –_ This XML node shows the version of the GPO stored in the Active Directory database.
-   _VersionSysvol_ – This XML node shows the version of the GPO stored in [SYSVOL](https://www.webopedia.com/definitions/sysvol/#:~:text=The%20term%20SYSVOL%20refers%20to,NETLOGON%20and%20SYSVOL%20shared%20folders.).
-   _Enabled_ – This XML node indicates whether the _Computer_ or _User_ sections of the GPO are enabled or not. If disabled, the Group Policy processing engine on the client computer will not apply the settings in the corresponding part of the GPO.

> _When you make a change in a GPO, the version of the policy (either computer or user) increases. This allows the Group Policy processing engine to know when a policy has changed to know when to apply new settings. This behavior is what allows you to run [gpupdate](https://adamtheautomator.com/gpupdate/).exe without the ubiquitous /force after a GPO was changed._

You’ll see these GPO attributes reflected in the GPMC as shown below.

![In the GPMC you may see the GPO version (for AD and SYSVOL), as well as its status (Disabled, Disabled for Computer, Disabled for User, or Enabled).](https://adamtheautomator.com/wp-content/uploads/2020/09/080_GPO_versions_and_status.png)

In the GPMC you may see the GPO version (for AD and SYSVOL), as well as its status (Disabled, Disabled for Computer, Disabled for User, or Enabled).

In the GPMC you may see the GPO version (for AD and SYSVOL), as well as its status (Disabled, Disabled for Computer, Disabled for User, or Enabled).

All these values are important for the consistency of the GPOs and the speed in processing of the GPOs on the client computers.

> _Sidenote: A difference between the values of VersionDirectory and VersionSysvol indicates a mismatch between what’s shown in the GPMC and what settings are stored in SYSVOL. Identifying such mismatches can save you from a lot of pain in troubleshooting GPOs._
> 
> _A policy that has VersionDirectory and VersionSysvol equal to 0 but the value Enabled set to true will be processed by the client, even though there are no settings. Disabling the corresponding part of the GPO will signal the processing engine that that part of the GPO does not need to be applied. This will not impact much the performance of a fast computer on a reasonably fast network, but it can save precious seconds in the case of many such GPOS, particularly for older computers on slower networks._
> 
> _A policy that has VersionDirectory and VersionSysvol (hopefully identical and) higher than 0 but Enabled set to false will not be applied by the processing engine on the client computer. This may be on purpose but it’s worth looking into, as you may wonder why some settings do not apply._

Armed with some knowledge of GPO internals, you can take advantage of `Get-GPOReport` to check for these settings directly via referencing a property rather than clicking through the GPMC.

Perhaps you’d like to only look at specific settings in a GPO or maybe even eventually use PowerShell to get a GPO linked to an OU and don’t need to generate a report at all. In that case, remove the `Path` parameter. Notice in the below example, no `Path` parameter, and the use of the `[xml]` cast.

```
[xml]$GpoXml = Get-GPOReport -Name 'YourGPOName' -ReportType Xml
```

By casting the XML output of Get-GPOReport to an XML object, you can now easily reference various properties by simple dot notation.

```
# Check the version information for the Computer part of the GPO
$GpoXml.GPO.Computer
# Check the version information for the User part of the GPO
$GpoXml.GPO.User
```

![The Computer and User versions and status of the GPO components (Computer and User).](https://adamtheautomator.com/wp-content/uploads/2020/09/090_GPO_Versions.png)

The Computer and User versions and status of the GPO components (Computer and User).

Do you need to find specific attributes for _all_ GPOs in a domain? No problem. Throw in a `[foreach](https://adamtheautomator.com/powershell-foreach/)` loop to iterate over each GPO output using the `All` parameter.

```
# Retrieve all GPOs (not all GPO Reports!)
$AllGpos = Get-GPO -All
# Create a custom object holding all the information for each GPO component Version and Enabled state
$GpoVersionInfo = foreach ($g in $AllGpos) {
    [xml]$Gpo = Get-GPOReport -ReportType Xml -Guid $g.Id
    [PSCustomObject]@{
        "Name" = $Gpo.GPO.Name
        "Comp-Ad" = $Gpo.GPO.Computer.VersionDirectory
        "Comp-Sys" = $Gpo.GPO.Computer.VersionSysvol
        "Comp Ena" = $Gpo.GPO.Computer.Enabled
        "User-Ad" = $Gpo.GPO.User.VersionDirectory
        "User-Sys" = $Gpo.GPO.User.VersionSysvol
        "User Ena" = $Gpo.GPO.User.Enabled
    }
}
# See the result
$GpoVersionInfo | Sort-Object Name | Format-Table -AutoSize -Wrap
```

![The Computer and User versions and status of all the GPO components (Computer and User) in the AD Domain](https://adamtheautomator.com/wp-content/uploads/2020/09/091_All_GPO_Versions_Report.png)

The Computer and User versions and status of all the GPO components (Computer and User) in the AD Domain

## Going Deeper: Parsing XML GPO Reports

Using the XML output that `Get-GPOReport` returns, you can do gain insight into many different aspects of your GPOs. Using the example above, looking at the `$GPOXml.GPO.Computer` and `$GPOXML.GPO.User` properties from above, you will see an `ExtensionData` property as shown below.

![The User section of the GPO contains Extension Data. ](https://adamtheautomator.com/wp-content/uploads/2020/09/090_GPO_Versions-1.png)

The User section of the GPO contains Extension Data.

If you look at the XML report saved earlier shown below using the `Path` parameter, you can see that `ExtensionData` contains settings defined in the GPO. The `ExtensionData` XML node refers to various settings defined in the GPO.

![The content of ExtensionData, highlighted](https://adamtheautomator.com/wp-content/uploads/2020/09/072_XML_report_Settings-1024x750.png)

The content of ExtensionData, highlighted

By referencing these XML nodes with PowerShell, you can begin to build your own reports based on the XML data as shown below. This example queries the _Google Chrome_ GPO and loops through each user setting only returning the `Name`, `State` and `Supported` attributes.

```
# Get the GPO Guid (just like above)
$Id = (Get-GPO -DisplayName "Google Chrome").Id
# Store the output in a (XML) variable
[xml]$GpoXml = Get-GPOReport -Guid $Id -ReportType Xml

#Create a custom object containing only the policy "fields" we're interested in
$PolicyDetails = foreach ($p in $GpoXml.GPO.User.ExtensionData.Extension.Policy) {
    [PSCustomObject]@{
        "Name" = $p.Name
        "State" = $p.State
        "Supported" = $p.Supported
    }
}

#Let's see the results
$PolicyDetails
```

![Settings from the policy. It only includes the desired fields (in this case Name, State, and OS Support info)](https://adamtheautomator.com/wp-content/uploads/2020/09/092_GPO_Selected_Settings.png)

Settings from the policy. It only includes the desired fields (in this case Name, State, and OS Support info)

## Using PowerShell to Get a GPO Linked to an OU

Before we wrap up, here is another quick example on how to use `Get-GPOReport` to look at which OU(s) each GPO is linked to, and also at the status of each link (Enabled or Disabled).

First, always, find the properties you need to reference. One the easiest ways to do that is to look an XML file generated with the `Path` parameter. You can see below the XML structure has multiple `LinksTo` node. These nodes contain child nodes which indicate information about the various GPO links.

![The GPO Links listed in the GPO report](https://adamtheautomator.com/wp-content/uploads/2020/09/093_GPO_Links.png)

The GPO Links listed in the GPO report

As you may notice, there may be multiple links from the same GPO (you can link the same GPO to different sites, domains or OUs). You need to keep this in mind and loop through each different link.

Once you know the XML nodes to query, you can build a script to parse that XML as shown below. The below example is finding all GPOs in the domain, generating an XML output from them then reading the `LinksTo` XM node returning the name of the GPO (`$Gpo.GPO.Name`), the name of the path of the OU (`$i.SOMPath`) and whether or not it’s enabled (`$i.Enabled`).

```
# Retrieve all GPOs (not all GPO Reports!)
$AllGpos = Get-GPO -All
# Create a custom object holding all the GPOs and their links (separate for each distinct OU)
$GpoLinks = foreach ($g in $AllGpos){
        [xml]$Gpo = Get-GPOReport -ReportType Xml -Guid $g.Id
        foreach ($i in $Gpo.GPO.LinksTo) {
                [PSCustomObject]@{
                "Name" = $Gpo.GPO.Name
                "Link" = $i.SOMPath
                "Link Enabled" = $i.Enabled
                }
            }
        }
# See all the GPOs and the links for each
$GpoLinks | Sort-Object Name
```

Once finished, you should see the output below. In this case, _Google Chrome_ appears three times in the report, since it is linked to three different OUs. You may also notice that the link for the _Servers_ OU is not enabled.

> _Scan your Active Directory for 750M+ known leaked passwords with a [free read-only Password Auditor scan](https://specopssoft.com/product/specops-password-auditor/?utm_source=ATA&utm_medium=referral&utm_campaign=ATA%20promo%202021&utm_content=SPA%20in-article%20link) from Specops._

![All the GPOs in the domain, each OU they are linked to, and the status for each link. ](https://adamtheautomator.com/wp-content/uploads/2020/09/094_All_GPOs_Links-1.png)

All the GPOs in the domain, each OU they are linked to, and the status for each link.

## Further Reading

_Once you’re comfortable with Get-GPOReport you may find other Group Policy related cmdlets to help you on your quest to manage Group Policies._

-   The official Microsoft documentation for Get-GPOReport is available [here](https://docs.microsoft.com/en-us/powershell/module/grouppolicy/get-gporeport?view=windowsserver2019-ps&viewFallbackFrom=win10-ps)
-   Other related cmdlets for working with Group Policies include [Get-GPO](https://docs.microsoft.com/en-us/powershell/module/grouppolicy/get-gpo?view=windowsserver2019-ps&viewFallbackFrom=win10-ps), [Get-GPPermission](https://docs.microsoft.com/en-us/powershell/module/grouppolicy/get-gppermission?view=windowsserver2019-ps&viewFallbackFrom=win10-ps), etc. The entire list of Group-Policy-related cmdlets is available [here](https://docs.microsoft.com/en-us/powershell/module/grouppolicy/?view=windowsserver2019-ps&viewFallbackFrom=win10-ps).
-   [Active Directory Scripts Galore](https://adamtheautomator.com/active-directory-scripts/)
