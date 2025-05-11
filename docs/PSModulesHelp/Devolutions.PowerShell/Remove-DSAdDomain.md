Remove-DSAdDomain
-----------------

### Synopsis
Remove a domain.

---

### Description

Remove a domain identified by the supplied id.

---

### Related Links
* [Get-DSAdDomain](Get-DSAdDomain)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $domains = Get-DSAdDomain; Remove-DSAdDomain -DomainID $domains.Data[0].ID
Get all domains. After spotting the ID of the domain to delete (first one in this case), delete the domain.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DomainID**
Id of the domain to delete.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Remove-DSAdDomain -detailed". For technical information, type "Get-Help Remove-DSAdDomain -full".

---

### Syntax
```PowerShell
Remove-DSAdDomain -DomainID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
