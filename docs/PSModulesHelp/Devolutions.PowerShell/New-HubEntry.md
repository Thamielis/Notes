New-HubEntry
------------

### Synopsis

---

### Description

---

### Parameters
#### **DocumentPath**
Path of file to attach to document entry (max 30 MB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **PSDecryptedEntry**
Hub entry

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[PSDecryptedEntry]`|true    |named   |false        |

#### **VaultId**
Id of the Hub vault you want to create the entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubEntry -detailed". For technical information, type "Get-Help New-HubEntry -full".

---

### Syntax
```PowerShell
New-HubEntry -VaultId <Guid> -PSDecryptedEntry <PSDecryptedEntry> [-DocumentPath <String>] [-HubContext <HubContext>] [<CommonParameters>]
```
