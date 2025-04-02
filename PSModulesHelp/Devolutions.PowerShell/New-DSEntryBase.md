New-DSEntryBase
---------------

### Synopsis
Create a new entry.

---

### Description

Create a new entry without validating anything. This is the functional equivalent of a passthrough. Unless you know exactly what you are doing, you should probably use the CMDlets created by us to generate new entries.

---

### Related Links
* [New-DSCredentialEntry](New-DSCredentialEntry)

* [New-DSRDPEntry](New-DSRDPEntry)

* [New-DSSSHShellEntry](New-DSSSHShellEntry)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FromRDMConnection**
Entry obtained from Get-DSEntry -AsRDMConnection. It can be used to create a copy of an existing entry wihtout losing any data.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ConnectionInfoEntity]`|true    |1       |false        |

#### **JsonBody**
Entry in JSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSEntryBase -detailed". For technical information, type "Get-Help New-DSEntryBase -full".

---

### Syntax
```PowerShell
New-DSEntryBase [-JsonBody] <String> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSEntryBase [-FromRDMConnection] <ConnectionInfoEntity> [-AsLegacyResponse] [<CommonParameters>]
```
