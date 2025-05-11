Import-Deployment
-----------------

### Synopsis
Imports modules in your deployment

---

### Description

Imports modules in a deployment

---

### Related Links
* [Push-Deployment](Push-Deployment)

* [Add-Deployment](Add-Deployment)

* [Remove-Deployment](Remove-Deployment)

---

### Examples
Import all modules in a deployment

```PowerShell
Import-Deployment
```

---

### Parameters
#### **Name**
The name of the deployment

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

---

### Outputs
* [Management.Automation.PSModuleInfo](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSModuleInfo)

---

### Syntax
```PowerShell
Import-Deployment [<CommonParameters>]
```
```PowerShell
Import-Deployment -Name <String> [<CommonParameters>]
```
