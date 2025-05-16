---
created: 2022-03-04T12:09:21 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ii-sample-json-and-reading-it/
author: Published by feardamhan
---

# Part 02 Sample JSON and Reading It

> ## Excerpt
> Rather than give you all a nose bleed with the 500 lines of JSON input I used in my lab, I thought it might be easier to just show you a sample JSON snippet and some PowerShell code to read it in a…

---
Rather than give you all a nose bleed with the 500 lines of JSON input I used in my lab, I thought it might be easier to just show you a sample JSON snippet and some PowerShell code to read it in and various ways to reference it. That way when you see variables in similar formats across the subsequent PowerShell snippets in the series, you will know what you are looking at, how to create your own JSON file and how to use its values to meet your needs.

### Sample JSON

```json
{
    "isoGeneration": {
        "productKey": "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX",
        "windowsVariant": "Windows Server 2016 Datacenter (Desktop Experience)",
        "VMwareToolsIsoUrl": "https://packages.vmware.com/tools/esx/latest/windows/VMware-tools-windows-10.3.10-12406962.iso",
        "isosPath": "E:\\ISOs",
        "buildfolder": "E:\\Unattended",
        "windowsISOFile": "en_windows_server_2016_x64_dvd_9327751.ISO",
        "SQLISOFile": "en_sql_server_2017_enterprise_x64_dvd_11293666.ISO"
    },
    "templates": {
        "masteriaas": {
            "machinename": "member-server",
            "ipCidr": "10.10.10.25/24",
            "dnsServer1": "10.10.10.5",
            "dnsServer2": "10.10.10.4",
            "gateway": "10.10.10.1"
        },
        "vra01mssql01": {
            "machinename": "sql-server",
            "ipCidr": "10.10.10.52/24",
            "dnsServer1": "10.10.10.4",
            "dnsServer2": "10.10.10.5",
            "gateway": "10.10.10.1"
        },
        "rootDC": {
            "machinename": "root-dc01",
            "ipCidr": "10.10.10.4/24",
            "dnsServer1": "10.10.10.4",
            "dnsServer2": "10.10.10.5",
            "gateway": "10.10.10.1"
        },
        "childDC": {
            "machinename": "child-dc01",
            "ipCidr": "10.10.10.5/24",
            "dnsServer1": "10.10.10.4",
            "dnsServer2": "10.10.10.5",
            "gateway": "10.10.10.1"
        }
    }
}
```

### PowerShell Manipulation

Lets assume the above content was saved as lab-parameters.json in the same location as my PowerShell script

```powershell
#Define the file name we will look for
$jsonConfig = "lab-parameters.json"

#Test for the file being present
$jsonFilePresent = Test-Path -path $($PSScriptRoot+"\"+$jsonConfig)

#Read file into a variable called labJSON
If ($jsonFilePresent) { $labJSON = (Get-Content -Raw $($PSScriptRoot+"\"+$jsonConfig)) | ConvertFrom-Json }

#Assign a subsection of the variable to another variable
$templates = $labJSON.templates

#Operate on a specific value
ping $templates.masterIaas.gateway

#or
ping $labJSON.templates.masterIaas.gateway

#Write some value to the screen (note the parenthesis and extra $ sign)
Write-Host "I found the value $($labJSON.templates.masteriaas.machinename) in your file"
```

That should help you decode and substitute the variables you see in the rest of the series.

### Posts in this Series

-   [Part 1: Overview](https://feardamhan.com/2020/01/14/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-i-overview/)
-   [Part 2: Reading JSON](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ii-sample-json-and-reading-it/)
-   [Part 3: Creating a Single Binaries ISO](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iii-building-a-single-binaries-iso/)
-   [Part 4: Understanding the autoUnattend.xml](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iv-understanding-and-building-the-autounattend-xml-file/)
-   [Part 5: Creating a Configure-Host.ps1 and Building the Answerfiles ISO for SQL Server](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-v-build-a-configure-host-ps1-and-answer-files-iso-for-sql-server/)
-   [Part 6: Creating the VM](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-vi-creating-and-configuring-the-vm/)
-   [Part 7: Creating a New Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
-   [Part 8: Adding a Domain Controller to an Existing Domain](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-viii-build-a-configure-host-ps1-and-answer-files-iso-for-new-domain-controller-in-existing-domain/)
-   [Part 9: Adding a New Child Domain to an Existing Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
