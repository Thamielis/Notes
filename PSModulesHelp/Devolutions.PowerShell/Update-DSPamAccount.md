Update-DSPamAccount
-------------------

### Synopsis
Update a pam account.

---

### Description

Update a pam account. All modifications are made on the pam account object obtained from Get-DSPamAccount.

---

### Related Links
* [Get-DSPamAccount](Get-DSPamAccount)

* [Get-DSPamAccountSyncStatus](Get-DSPamAccountSyncStatus)

* [New-DSPamAccount](New-DSPamAccount)

* [Remove-DSPamAccount](Remove-DSPamAccount)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $pamAccount = Get-DSPamAccount -AccountID $accountID;
        $pamAccount.Label = NewName;
        $pamAccount.password = N3wPa$$w0rd!;
        Update-DSPamAccount -PamAccount $pamAccount
Obtain the pam account to modify. Change its name and password and persist the changes.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PamAccount**
Modified pam account

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[PamCredential]`|true    |named   |true (ByValue)|

#### **Password**
New password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Security**
Security permissions

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PamUserPermission[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamCredential

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Update-DSPamAccount -detailed". For technical information, type "Get-Help Update-DSPamAccount -full".

---

### Syntax
```PowerShell
Update-DSPamAccount -PamAccount <PamCredential> [-Password <String>] [-Security <PamUserPermission[]>] [-AsLegacyResponse] [<CommonParameters>]
```
