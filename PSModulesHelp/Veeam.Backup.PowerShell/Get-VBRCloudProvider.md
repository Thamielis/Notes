Get-VBRCloudProvider
--------------------

### Synopsis
Returns service providers.

---

### Description

This cmdlet returns service providers added to Veeam Backup & Replication. You can get the list of all existing service providers or search for instances directly by name or ID.

---

### Examples
> Example 1. Getting All Cloud Service Providers

Get-VBRCloudProvider
This command returns all cloud service providers added to Veeam Backup & Replication.
> Example 2. Getting Cloud Service Provider by IP Address

```PowerShell
Get-VBRCloudProvider -Name "104.45.95.227"
This command looks for the cloud service provider with the 104.45.95.227 IP address.
```

---

### Parameters
#### **Id**
Specifies the array of the IDs of the VBRCloudProvider object you want to get.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of the service provider names you want to get or search conditions.

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
Get-VBRCloudProvider [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudProvider [-Name <String[]>] [<CommonParameters>]
```
