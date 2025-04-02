Get-VBRCloudGateway
-------------------

### Synopsis
Returns cloud gateways.

---

### Description

This cmdlet returns existing cloud gateways.

---

### Examples
> Example 1. Getting All Cloud Gateways

Get-VBRCloudGateway
This command returns all cloud gateways configured in Veeam Backup & Replication.
> Example 2. Getting Cloud Gateway by Name

Get-VBRCloudGateway -Name "Cloud gateway
This command gets the cloud gateway by name.

---

### Parameters
#### **Id**
Specifies the array of IDs of cloud gateways. Accepts GUID[] or string[].

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of the cloud gateway names you want to get or search conditions.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudGateway [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudGateway [-Name <String[]>] [<CommonParameters>]
```
