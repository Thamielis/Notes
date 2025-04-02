Get-VSBHvVirtualLab
-------------------

### Synopsis
Returns Hyper-V virtual labs.

---

### Description

This cmdlet returns Hyper-V virtual labs that are connected to the Veeam backup console.

Run Find-VSBHvVirtualLab to look for virtual labs that are not managed by Veeam Backup & Replication.

You can get the list of all virtual labs or search for instances directly by name or ID.

---

### Examples
> Example 1

Get-VSBHvVirtualLab
This command looks for the list of all virtual labs created or connected to Veeam Backup & Replication.
> Example 2

```PowerShell
Get-VSBHvVirtualLab -Name Exchange*
This command looks for the list of virtual labs with names starting with "Exchange".
```
> Example 3

```PowerShell
Get-VSBVirtualLab -Id 1022504c-9008-4883-b166-718bdf7280ea, 502dc485-84f5-4a9d-86e7-8b00d1d5a0be
This command returns virtual labs by Id.
```

---

### Parameters
#### **Id**
Specifies the array of Hyper-V virtual lab IDs. The cmdlet will return Hyper-V virtual labs with these IDs.
Accepts GUID or string type.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name(s) of the virtual lab, or search conditions.  You can specify multiple names separated by commas.

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
Get-VSBHvVirtualLab [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VSBHvVirtualLab [-Name <String[]>] [<CommonParameters>]
```
