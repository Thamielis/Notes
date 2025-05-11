Get-DSEntrySensitiveData
------------------------

### Synopsis
Return sensitive data for a specified entry.

---

### Description

Return sensitive data for a specified entry. DVLS version must be at least 2020.3.17 to be supported.

---

### Related Links
* [Get-DSEntry](Get-DSEntry)

* [Get-DSEntryPasswordHistory](Get-DSEntryPasswordHistory)

* [Get-DSEntrySubConnections](Get-DSEntrySubConnections)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSEntrySensitiveData -EntryId $entryId
Get the sensitive data for the entry identified by $entryId.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryID**
Id of the entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSEntrySensitiveData -detailed". For technical information, type "Get-Help Get-DSEntrySensitiveData -full".

---

### Syntax
```PowerShell
Get-DSEntrySensitiveData -EntryID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
