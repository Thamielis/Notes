New-DSPamSecurity
-----------------

### Synopsis
Create a new PamUserPermission object

---

### Description

Create a new PamUserPermission object. This can be used to update the security of pam vaults and pam accounts.

---

### Examples
> EXAMPLE 1

PS C:\> $security = New-DSPamSecurity -Role Approver -Mode Global;
    Update-DSPamFolder -FolderID $pamFolderID -Security $security
For the PAM folder whose ID is stored in $pamFolderID, its approver security will be set to 'System default'.
> EXAMPLE 2

```PowerShell
PS C:\> $usersResponse = Get-DSUser;
    $user = $usersResponse.Data | Where Name -eq 'MyUserName';
    $security = New-DSPamSecurity -Role Owner -Mode Override -UserID $user.ID;
    New-DSPamFolder -Name 'MyNewPamVault' -Security $security -AsNewvault
Create a new PAM vault whose owner is 'MyUserName'
```

---

### Parameters
#### **Mode**
Resolution mode: Global (System default | Inherited), Override (Custom), Both
Valid Values:

* Global
* Override
* Both

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[PermissionResolutionMode]`|true    |2       |false        |

#### **Role**
Predefined role.
Valid Values:

* None
* Approver
* Contributor
* LogReader
* Manager
* Operator
* Owner
* Reader

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PamRoleType]`|true    |1       |false        |

#### **UserID**
Ids of the users or applications to give access

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission

---

### Notes
For more information, type "Get-Help New-DSPamSecurity -detailed". For technical information, type "Get-Help New-DSPamSecurity -full".

---

### Syntax
```PowerShell
New-DSPamSecurity [-Role] <None | Approver | Contributor | LogReader | Manager | Operator | Owner | Reader> [-Mode] <Global | Override | Both> [[-UserID] <Guid[]>] [<CommonParameters>]
```
