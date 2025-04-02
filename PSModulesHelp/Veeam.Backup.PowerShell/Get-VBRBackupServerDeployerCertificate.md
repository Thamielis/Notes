Get-VBRBackupServerDeployerCertificate
--------------------------------------

### Synopsis
Exports Veeam Deployer Service certificates to the specified location for Linux machines.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet exports Veeam Deployer Service certificates to the specified location for Linux machines.

---

### Examples
> Uploading Veeam Deployer Service Certificate to ?ertain Folder

```PowerShell
Get-VBRBackupServerDeployerCertificate -ExportPath C:\Users\Administrator\Documents
This command uploads Veeam Deployer Service certificate to the "C:\Users\Administrator\Documents" folder.
```

---

### Parameters
#### **ExportPath**
Specifies a path to a location. The cmdlet will upload Veeam Deployer Service certificates to this location.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRBackupServerDeployerCertificate -ExportPath <String> [<CommonParameters>]
```
