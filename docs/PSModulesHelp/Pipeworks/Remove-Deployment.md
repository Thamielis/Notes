Remove-Deployment
-----------------

### Synopsis
Removes a Pipeworks deployment

---

### Description

Removes a Pipeworks deployment from the list of deployments

---

### Related Links
* [Get-Deployment](Get-Deployment)

* [Add-Deployment](Add-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-Deployment -Name EZOut # Removes EZOut from the list of deployed modules
```

---

### Parameters
#### **Name**
The name of the module to remove from the deployment

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Remove-Deployment [-Name] <String> [<CommonParameters>]
```
