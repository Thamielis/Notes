New-DSPamAccount
----------------

### Synopsis
Create a pam account.

---

### Description

Create a pam account. For custom account, custom properties are not supported yet.

---

### Related Links
* [Get-DSPamAccount](Get-DSPamAccount)

* [Get-DSPamAccountSyncStatus](Get-DSPamAccountSyncStatus)

* [Remove-DSPamAccount](Remove-DSPamAccount)

* [Update-DSPamAccount](Update-DSPamAccount)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> New-DSPamAccount -Name DomAcc -CredentialType DomainUser -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -Description "My description" -ProviderID $providerID
Create an account with a pam provider of the type "Domain User" where the account will be synchronized.
```
> EXAMPLE 2

```PowerShell
PS C:\> New-DSPamAccount -Name LoneAcc -CredentialType Standalone -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -Description "My description"
Create a standalone account.
```
> EXAMPLE 3

```PowerShell
PS C:\> New-DSPamAccount -Name CertAcc -CredentialType Certificate -FolderID $folderID -Certificate "certificateValue" -Passphrase "passphraseValue"
Create a certificate account.
```
> EXAMPLE 4

```PowerShell
PS C:\> $security = Get-DSPamAccountSecurity -ID $existingAccountID;
    New-DSPamAccount -Name DomAcc -CredentialType DomainUser -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -ProviderID $providerID -Security $security
Create a new PAM account named 'DomAcc' with the same security as the PAM account whose ID is stored in $existingAccountID
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Certificate**
Certificate's value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **CredentialType**
Account's credential type
Valid Values:

* Unknown
* Standalone
* LocalUser
* DomainUser
* DomainAdmin
* SqlServer
* Certificate
* WindowsLocalAccount
* AzureADUser
* MySqlUser
* OracleUser
* CiscoHost
* Custom

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[PamCredentialType]`|true    |named   |false        |

#### **Description**
Pam account's description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FolderID**
ID of the folder that will contains the new pam account.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **Name**
Pam account's name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Passphrase**
Certificate' passphrase

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Password**
Pam account's name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProviderID**
Provider's ID where the account will be synced

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **ResetPasswordOnCheckIn**
Reset password on check in

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Security**
Security permissions

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PamUserPermission[]]`|false   |named   |false        |

#### **Username**
Pam account's credentials username.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamCredential

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help New-DSPamAccount -detailed". For technical information, type "Get-Help New-DSPamAccount -full".

---

### Syntax
```PowerShell
New-DSPamAccount -CredentialType <Certificate> -Certificate <String> [-Passphrase <String>] -FolderID <Guid> -Name <String> [-Security <PamUserPermission[]>] [-ResetPasswordOnCheckIn] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamAccount -CredentialType <Custom> -ProviderID <Guid> [-Description <String>] [-Password <String>] [-Username <String>] -FolderID <Guid> -Name <String> [-Security <PamUserPermission[]>] [-ResetPasswordOnCheckIn] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamAccount -CredentialType <[AzureADUser | DomainUser | LocalUser | SqlServer | WindowsLocalAccount]> -ProviderID <Guid> -Username <String> [-Description <String>] [-Password <String>] -FolderID <Guid> -Name <String> [-Security <PamUserPermission[]>] [-ResetPasswordOnCheckIn] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamAccount -CredentialType <Standalone> -Username <String> [-Password <String>] [-Description <String>] -FolderID <Guid> -Name <String> [-Security <PamUserPermission[]>] [-ResetPasswordOnCheckIn] [-AsLegacyResponse] [<CommonParameters>]
```
