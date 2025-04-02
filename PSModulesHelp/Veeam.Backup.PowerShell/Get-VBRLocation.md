Get-VBRLocation
---------------

### Synopsis
Returns geographic locations created in Veeam Backup & Replication.

---

### Description

This cmdlet returns geographic locations created in Veeam Backup & Replication.
You can get the list of all locations or search for instances directly by name, ID or associated infrastructure components.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Getting Locations by Name

```PowerShell
Get-VBRLocation -Name "Location North", SuperLocation
This command returns locations by names.
```
> Example 2. Getting Locations by ID

```PowerShell
Get-VBRLocation -Id 97e9f314-690c-410f-a1c2-acc101faa2ce, a1218a40-e863-4d38-813f-e68974c3896
This command returns locations by ID.
```
> Example 3. Getting Location Assigned to ESXi Host

$esxi = Find-VBRViEntity -Name team.support.north
Get-VBRLocation -Object $esxi
This example shows how to get the location assigned to the ESXi host.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $esxi variable.
2. Run the Get-VBRLocation cmdlet. Set the $esxi variable as the Object parameter value.

---

### Parameters
#### **Id**
Specifies the array of location IDs.
The cmdlet will return locations with these IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

#### **Name**
Specifies the array of location names.
The cmdlet will return locations with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **Object**
Specifies the Veeam Backup & Replication infrastructure component.
The cmdlet will return a location assigned to this component.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

System.String[]

System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRLocation [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRLocation [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRLocation [-Object <Object>] [<CommonParameters>]
```
