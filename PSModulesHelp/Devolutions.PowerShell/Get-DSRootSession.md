Get-DSRootSession
-----------------

### Synopsis
Get the root entry of the specified vault.

---

### Description

Get the root entry of the specified vault.

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Specify the ID of the desired vault.

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
For more information, type "Get-Help Get-DSRootSession -detailed". For technical information, type "Get-Help Get-DSRootSession -full".

---

### Syntax
```PowerShell
Get-DSRootSession -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
