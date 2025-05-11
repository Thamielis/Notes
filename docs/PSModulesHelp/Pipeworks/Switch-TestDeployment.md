Switch-TestDeployment
---------------------

### Synopsis
Switches host entries to test a deployment

---

### Description

Toggles the local name resolution for a test domain to and from test host.  

This lets you preview a deployment before making it live, and allows you to perform automated tests against the deployment.

---

### Related Links
* [Publish-AzureService](Publish-AzureService)

---

### Examples
> EXAMPLE 1

```PowerShell
Switch-TestDeployment -HostName "Start-LearningPowerShell.com" -TestHost 03ad2d078dd348cb9eaddfb50a6d8141.cloudapp.net
```

---

### Parameters
#### **HostName**
The public DNS name for the website

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **TestHost**
The DNS name for the test deployment

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Switch-TestDeployment [-HostName] <String> [-TestHost] <String> [<CommonParameters>]
```
