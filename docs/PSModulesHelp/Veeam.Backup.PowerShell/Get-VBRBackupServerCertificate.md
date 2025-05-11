Get-VBRBackupServerCertificate
------------------------------

### Synopsis
Returns TLS certificates.

---

### Description

This cmdlet returns the TLS certificates.

---

### Examples
> Example 1. Getting TLS Certificates from Microsoft Windows Certificate Store

```PowerShell
Get-VBRBackupServerCertificate -FromStore | Where FriendlyName -eq "ABC"
This command gets a TLS certificate from the Microsoft Windows Certificate store.
```
> Example 2. Getting Currently Imported TLS Certificates

```PowerShell
Get-VBRBackupServerCertificate
This command returns the TLS  certificate that is currently imported to the backup server.
```
> Example 3. Getting Certificates from PFX Files

```PowerShell
Get-VBRBackupServerCertificate -Path "C:\cert\AMB_cert.pfx"
This command gets a TLS certificate from a PFX file.
```

---

### Parameters
#### **FromStore**
Defines that the cmdlet will return the TLS certificate present in the local certificate store on this server.
If you run the cmdlet without this parameter, it will return the certificate that is currently used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Password**
Specifies a password for a PXF file.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |False        |

#### **Path**
Specifies a path to the PXF file. The cmdlet will return TLS certificate that are available at this path.

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
Get-VBRBackupServerCertificate -FromStore [<CommonParameters>]
```
```PowerShell
Get-VBRBackupServerCertificate [-Password <SecureString>] -Path <String> [<CommonParameters>]
```
