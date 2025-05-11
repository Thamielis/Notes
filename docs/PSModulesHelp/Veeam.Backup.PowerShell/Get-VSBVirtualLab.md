Get-VSBVirtualLab
-----------------

### Synopsis
Returns VMware virtual labs.

---

### Description

This cmdlet returns existing VMware virtual labs.

Run Find-VSBVirtualLab to look for virtual labs that are not managed by Veeam Backup & Replication.

You can get the list of all virtual labs or search for instances directly by name or ID.

---

### Examples
> Example 1

```PowerShell
Get-VSBVirtualLab
This command looks for the list of all virtual labs.
```
> Example 2

```PowerShell
Get-VSBVirtualLab -Name "MailServer VLab 01", "MailServer VLab 05"
This command looks for the virtual labs named "MailServer VLab 01" and "MailServer VLab 05".
```
> Example 3

```PowerShell
Get-VSBVirtualLab -Id 3fw1505l-8811-4283-b066-718bdf7280ea, 909fg28c-14f5-9a9d-6ve7-0b40d1k5a9jm
This command returns virtual labs by Id.
```

---

### Parameters
#### **Id**
Specifies the array of VMware virtual lab IDs. The cmdlet will return VMware virtual labs with these IDs.
Accepts GUID or string type.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name of the VMware virtual lab you want to get, or search conditions. You can specify multiple names separated by commas.

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
Get-VSBVirtualLab [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VSBVirtualLab [-Name <String[]>] [<CommonParameters>]
```
