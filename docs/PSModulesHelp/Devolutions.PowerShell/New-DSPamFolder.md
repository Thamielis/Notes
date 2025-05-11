New-DSPamFolder
---------------

### Synopsis
Create a pam folder

---

### Description

Create a pam folder. Set it as a new vault or a subfolder of an existing folder.

---

### Related Links
* [Get-DSPamFolder](Get-DSPamFolder)

* [Remove-DSPamFolder](Remove-DSPamFolder)

* [Update-DSPamFolder](Update-DSPamFolder)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> New-DSPamFolder -Name 'PamVaultA' -AsNewVault
Create a new PAM vault named 'PamVaultA'
```
> EXAMPLE 2

```PowerShell
PS C:\> $foldersResponse = Get-DSPamFolder;
    $parentFolder = $foldersResponse | Where Name -eq 'AnExistingVault';
    $usersResponse = Get-DSUser;
    $user = $usersResponse | Where Name -eq 'ManagerA';
    $security = @();
    $security += New-DSPamSecurity -Role Manager -Mode Override -UserID $userID;
    $security += New-DSPamSecurity -Role Approver -Mode Both -UserID $userID;
    New-DSPamFolder -Name 'PamFolderA' -ParentFolderID $parentFolder.ID -Security $security
Create a new PAM folder in the PAM vault named 'AnExistingVault'. The only manager will be the user named 'ManagerA'. That user will also be granted the approver role.
```
> EXAMPLE 3

```PowerShell
PS C:\> $foldersResponse = Get-DSPamFolder;
    $pamVault = $foldersResponse | Where Name -eq 'AnExistingVault';
    $security = Get-DSPamFolderSecurity -ID $pamVault.ID;
    New-DSPamFolder -Name 'PamVaultA' -Security $security -AsNewVault
Create a new PAM vault named 'PamFolderA' with the same security as the PAM vault named 'AnExistingVault'
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsNewVault**
The new folder's parent will be the root.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Name**
Folder's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ParentFolderID**
Id of the new folder's parent.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

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
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSPamFolder -detailed". For technical information, type "Get-Help New-DSPamFolder -full".

---

### Syntax
```PowerShell
New-DSPamFolder -ParentFolderID <Guid> -Name <String> [-Security <PamUserPermission[]>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamFolder -AsNewVault -Name <String> [-Security <PamUserPermission[]>] [-AsLegacyResponse] [<CommonParameters>]
```
