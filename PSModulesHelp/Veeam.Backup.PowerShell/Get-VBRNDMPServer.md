Get-VBRNDMPServer
-----------------

### Synopsis
Returns NDMP servers.

---

### Description

This cmdlet returns an array of NDMP servers managed by Veeam Backup & Replication.

---

### Examples
> Example 1. Getting NDMP Server by DNS Name

```PowerShell
Get-VBRNDMPServer -Name "NetApp.tech.local"
This command gets the NetApp.tech.local NDMP server.
```
> Example 2. Getting NDMP Server by Server ID

```PowerShell
Get-VBRNDMPServer -ID "0fccf7c9-1f90-49de-8bec-53a0697e04ab"
This command gets the 0fccf7c9-1f90-49de-8bec-53a0697e04ab NDMP server.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for NDMP servers. The cmdlet will return NDMP servers with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of DNS names or IP addresses of NDMP servers. The cmdlet will return NDMP servers with these DNS names or IP addresses.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRNDMPServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNDMPServer [-Name <String[]>] [<CommonParameters>]
```
