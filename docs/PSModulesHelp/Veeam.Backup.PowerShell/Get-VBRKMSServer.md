Get-VBRKMSServer
----------------

### Synopsis
Returns KMS servers added to the Veeam Backup & Replication console.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns a Key Management System server (KMS server) added to the Veeam Backup & Replication console.

---

### Examples
> Example 1. Getting KMS Server by ID

```PowerShell
Get-VBRKMSServer -Id "8f723f68-82c6-430d-8915-58a0582440a4" , "8f723f68-82c6-430d-8915-58a0582440a4"
This command returns the 8f723f68-82c6-430d-8915-58a0582440a4 and 8f723f68-82c6-430d-8915-58a0582440a4 KMS servers.
```
> Example 2. Getting KMS Server by Name

```PowerShell
Get-VBRKMSServer -Name "thales.tech.local"
This command returns the thales.tech.local KMS server.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for KMS servers. The cmdlet will return KMS servers with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for KMS servers. The cmdlet will return KMS servers with these names

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
Get-VBRKMSServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRKMSServer [-Name <String[]>] [<CommonParameters>]
```
