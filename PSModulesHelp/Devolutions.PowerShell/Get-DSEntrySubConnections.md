Get-DSEntrySubConnections
-------------------------

### Synopsis
Return the subconnections of the entry.

---

### Description

Return the subconnections of the entry.

---

### Related Links
* [Get-DSEntry](Get-DSEntry)

* [Get-DSEntryPasswordHistory](Get-DSEntryPasswordHistory)

* [Get-DSEntrySensitiveData](Get-DSEntrySensitiveData)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSEntrySubConnections -EntryId $entryId
Get the subconnetions for the entry identified by $entryId.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsRDMConnections**
Return as ConnectionInfoEntity instead of a partial connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryID**
Id of the entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultPassword**
Password of the vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSEntrySubConnections -detailed". For technical information, type "Get-Help Get-DSEntrySubConnections -full".

---

### Syntax
```PowerShell
Get-DSEntrySubConnections [-EntryID] <Guid> [[-VaultPassword] <String>] [-AsRDMConnections] [-AsLegacyResponse] [<CommonParameters>]
```
