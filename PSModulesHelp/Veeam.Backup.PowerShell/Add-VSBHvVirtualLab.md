Add-VSBHvVirtualLab
-------------------

### Synopsis
Creates a Hyper-V virtual lab.

---

### Description

This cmdlet creates a new Hyper-V virtual lab.

A virtual lab is a component of SureBackup technology that allows you to configure a model of your production environment in a fenced-off lab.

One virtual lab can be used by several SureBackup jobs.

With Veeam PowerShell, you can create a basic virtual lab with automatically configured settings. The network settings for the virtual lab will be used the same as configured for the Veeam Backup server.

---

### Examples
> Example 1

```PowerShell
Add-VSBHvVirtualLab -Name "Exchange VLab 01" -Server $server -Folder "c:\VirtualLabs"
This command creates a new virtual lab named "Exchange VLab 01". The server where the virtual lab will be located is obtained with Get-VBRServer and assigned to the $server variable beforehand. The folder path to store the redo files is c:\VirtualLabs.
```

---

### Parameters
#### **Folder**
Specifies the path to the folder where the redo log files of the virtual lab will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the virtual lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies the Hyper-V host where the virtual lab should be created.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VSBHvVirtualLab [-Folder <String>] [-Name <String>] [-Server <CHost>] [<CommonParameters>]
```
