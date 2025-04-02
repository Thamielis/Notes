Connect-VSBVirtualLab
---------------------

### Synopsis
Connects an existing VMware virtual lab.

---

### Description

This cmdlet connects an existing VMware virtual lab to Veeam Backup & Replication console.

When you add a new host to your Veeam Backup & Replication console, the virtual labs that are registered on it are not added automatically. Use this cmdlet to add the virtual labs to your Veeam Backup & Replication console.

---

### Examples
> Example 1

Find-VSBVirtualLab -Server $server -Name "Exchange VLab 01" | Connect-VSBVirtualLab
This command connects a virtual lab named "Exchange VLab 01" to Veeam Backup & Replication. The server where the virtual lab is located is obtained with Get-VBRServer and assigned to the $server variable beforehand.
> Example 2

```PowerShell
Connect-VSBVirtualLab -VirtualLab $VLab01
This command connects a virtual lab represented by the $VLab01 variable. The virtual lab object is obtained with Find-VSBVirtualLab and assigned to the variable beforehand.
```

---

### Parameters
#### **VirtualLab**
Specifies the virtual lab you want to connect.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[CVirtualLabDescriptor]`|false   |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Model.CVirtualLabDescriptor

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VSBVirtualLab [[-VirtualLab] <CVirtualLabDescriptor>] [<CommonParameters>]
```
