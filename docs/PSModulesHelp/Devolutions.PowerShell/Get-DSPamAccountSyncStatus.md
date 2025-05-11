Get-DSPamAccountSyncStatus
--------------------------

### Synopsis
Verify if the provider can still access the account in the Domain or the Local SSH machine.

---

### Description

Verify if the provider can still access the account in the Domain or the Local SSH machine. The supported credential types are AzureADUser, DomainUser, LocalUser, SqlServer, and WindowsLocalAccount. If not, an internal server error will be received.

---

### Related Links
* [Get-DSPamAccount](Get-DSPamAccount)

* [New-DSPamAccount](New-DSPamAccount)

* [Remove-DSPamAccount](Remove-DSPamAccount)

* [Update-DSPamAccount](Update-DSPamAccount)

---

### Parameters
#### **AccountID**
Pam account's ID

|Type    |Required|Position|PipelineInput|Aliases     |
|--------|--------|--------|-------------|------------|
|`[Guid]`|true    |named   |false        |PamAccountID|

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSPamAccountSyncStatus -detailed". For technical information, type "Get-Help Get-DSPamAccountSyncStatus -full".

---

### Syntax
```PowerShell
Get-DSPamAccountSyncStatus -AccountID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
