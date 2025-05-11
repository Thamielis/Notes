Import-DSAdUsers
----------------

### Synopsis
Import users from the domain.

---

### Description

Import users from the domain. Two alternatives are offered: import all users or import users based on their name.

---

### Related Links
* [Get-DSDomainUsers](Get-DSDomainUsers)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Import-DSAdUsers -DomainName "domain.loc" -All
Import all users of the domain "domain.loc".
```

---

### Parameters
#### **All**
Import all users from the specified domain.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DomainName**
Name of the domain containing the users.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Name**
Names of the users to import. It is corresponding to the samAccountName field from the users obtained from Get-DSDomainUsers.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|true    |named   |false        |Names  |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]][]

---

### Notes
For more information, type "Get-Help Import-DSAdUsers -detailed". For technical information, type "Get-Help Import-DSAdUsers -full".

---

### Syntax
```PowerShell
Import-DSAdUsers -Name <String[]> -DomainName <String> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Import-DSAdUsers -All -DomainName <String> [-AsLegacyResponse] [<CommonParameters>]
```
