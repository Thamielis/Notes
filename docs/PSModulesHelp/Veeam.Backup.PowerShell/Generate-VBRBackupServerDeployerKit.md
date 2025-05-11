Generate-VBRBackupServerDeployerKit
-----------------------------------

### Synopsis
Generates the Veeam Deployer Service certificate and installation packages for Linux machines.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

The cmdlet generates Veeam Deployer Service certificate and installation packages and exports them to the necessary location for Linux machines. The cmdlet will generate the following files:
- client-cert.pem
- server-cert.p12
- veeamdeployment_12.1.0.x_amd64.deb
- veeamdeployment-12.1.0.x.x86_64.rpm
For more information, see the Deploying Veeam Agents Using Pre-installed Veeam Deployer Service section in the Veeam Agent Management User Guide.

---

### Examples
> Generating Veeam Deployer Service Certificate and Installation Packages

```PowerShell
Generate-VBRBackupServerDeployerKit -ExportPath "C:\Users\Administrator\Documents"
This command generates Veeam Deployer Service certificate and installation packages to the C:\Users\Administrator\Documents folder.
```

---

### Parameters
#### **ExportPath**
Specifies a path to a location. The cmdlet will export generated files to this location.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ValidityPeriodInHours**
Specifies a period in hours during which Veeam Deployer Service certificates are valid.
Default: 24 hours.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Int32]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Generate-VBRBackupServerDeployerKit -ExportPath <String> [-ValidityPeriodInHours <Int32>] [<CommonParameters>]
```
