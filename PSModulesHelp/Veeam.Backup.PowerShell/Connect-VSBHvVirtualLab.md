Connect-VSBHvVirtualLab
-----------------------

### Synopsis
Connects an existing Hyper-V virtual lab.

---

### Description

This cmdlet connects an existing Hyper-V virtual lab to Veeam Backup & Replication console.

When you add a new host to your Veeam Backup & Replication console, the virtual labs that are registered on it are not added automatically. Use this cmdlet to add the virtual labs to your Veeam Backup & Replication console.

---

### Examples
> Example 1

Find-VSBHvVirtualLab -Server $server -Name "Exchange VLab 01" | Connect-VSBHvVirtualLab
This command connects a virtual lab named "Exchange VLab 01".

- The virtual lab to connect is obtained with Find-VSBHvVirtualLab by looking for the specific virtual lab by name on the server represented by the $server variable.

- The server object is obtained with Get-VBRServer and assigned to the variable beforehand.
> Example 2

```PowerShell
Connect-VSBHvVirtualLab -VirtualLab $VLab01
This command connects a virtual lab represented by the $VLab01 variable.

The virtual lab object is obtained with Find-VSBHvVirtualLab and assigned to the variable beforehand.
```

---

### Parameters
#### **VirtualLab**
Specifies the virtual lab you want to connect to your Veeam Backup & Replication console.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CHvLabShortInfo]`|false   |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Model.CHvLabShortInfo

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VSBHvVirtualLab [[-VirtualLab] <CHvLabShortInfo>] [<CommonParameters>]
```
