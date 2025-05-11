Import-VBRLinuxKnownHost
------------------------

### Synopsis
Imports Linux TLS fingerprints from a file.

---

### Description

This cmdlet imports TLS fingerprints of Linux hosts from a file to Veeam Backup & Replication. Veeam Backup & Replication will consider the hosts as trusted.
To instruct Veeam Backup & Replication to establish connections only with trusted hosts, run the Set-VBRLinuxTrustedHostPolicy cmdlet.

---

### Examples
> Importing Linux TLS Fingerprints

```PowerShell
Import-VBRLinuxKnownHost -Path "C:\fingerprints.xml"
This command imports Linux TLS fingerprints from an XML file.
```

---

### Parameters
#### **Force**
Defines that the cmdlet will overwrite TLS fingerprints for existing hosts in the Veeam Backup & Replication database without asking a user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NetworkCredentials**
For importing from a folder on a file share.
Specifies the credentials you want to use for authenticating with the shared folder.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies the path to the file. The cmdlet will import TLS fingerprints from this file.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Import-VBRLinuxKnownHost [-Force] [-NetworkCredentials <CCredentials>] -Path <String> [<CommonParameters>]
```
