Get-Deployment
--------------

### Synopsis
Gets Pipeworks deployments

---

### Description

Gets PowerShell Pipeworks deployment

---

### Related Links
* [Import-Deployment](Import-Deployment)

* [Push-Deployment](Push-Deployment)

* [Publish-Deployment](Publish-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Deployment
```

---

### Parameters
#### **Name**
The name of the module

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Outputs
* Pipeworks.Deployment

---

### Syntax
```PowerShell
Get-Deployment [<CommonParameters>]
```
```PowerShell
Get-Deployment [-Name] <String[]> [<CommonParameters>]
```
