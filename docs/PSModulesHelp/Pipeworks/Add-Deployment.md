Add-Deployment
--------------

### Synopsis
Adds a Pipeworks deployment

---

### Description

Adds a PowerShell Pipeworks deployment to the list of deployed modules

---

### Related Links
* [Get-Deployment](Get-Deployment)

* [Remove-Deployment](Remove-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-Deployment Pipeworks
```

---

### Parameters
#### **Name**
The name of the module

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Group**
The deployment group.  
Certain groups will be automatically created from the Pipeworks manifest.
* If AllowDownload=$true is set, the module will be added to the deployment group "Downloads"
* If Win8 is set, the module will be added to the deployment group "Win8Apps"
* If Bots are provided, the module will be added to the deployment group "Bots"
* If any command can be run online, the module will be added to the deployment group "SoftwareServices"
* If any command includes a price, the module will be added to the deployment group "CommercialServices"    
* If the module includes AdSense or PubCenter publishing, the module will be added to the deployment group "AdSupported"    
* If the module contains a UserTable or UserDB, the module will be added to the deployment group "UserSystems" 
* If the module contains analytics trackers, the module will be added to the deployment group "Analyzed"
* If the module contains securesettings, the module will be added to the deployment group "UsesCredential"

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Add-Deployment [-Name] <String> [[-Group] <String[]>] [<CommonParameters>]
```
