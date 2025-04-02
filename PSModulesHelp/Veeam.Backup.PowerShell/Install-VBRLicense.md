Install-VBRLicense
------------------

### Synopsis
Installs licenses on a backup server.

---

### Description

This cmdlet installs licenses on a backup server.

---

### Examples
> Installing Veeam Backup & Replication License

Install-VBRLicense -Path "C:\Users\Administrator\Downloads\veeam_license.lic"
This command installs a Veeam Backup & Replication license.

---

### Parameters
#### **Force**
Defines that the cmdlet will install Veeam Backup & Replication license without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
Specifies a path to the license file. The cmdlet will install a license from this license file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Install-VBRLicense [-Force] -Path <String> [<CommonParameters>]
```
