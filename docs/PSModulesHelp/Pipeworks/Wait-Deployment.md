Wait-Deployment
---------------

### Synopsis
Waits for a deployment to complete

---

### Description

Waits for a deployment to Azure to complete

---

### Related Links
* [Add-Deployment](Add-Deployment)

* [Get-Deployment](Get-Deployment)

* [Import-Deployment](Import-Deployment)

* [Publish-Deployment](Publish-Deployment)

* [Remove-Deployment](Remove-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Wait-Deployment -ServiceName "start-automating"
```

---

### Parameters
#### **ServiceName**
The name of the Azure service

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Slot**
The slot that is being deployed.  Either Staging or Production.
Valid Values:

* Staging
* Production

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Wait-Deployment -ServiceName <String> [-Slot <String>] [<CommonParameters>]
```
