Get-RDMUser
-----------

### Synopsis
Retrieve the list of available users.

---

### Description

Retrieve the list of available users for the current selected data source.

---

### Related Links
* [Set-RDMUser](Set-RDMUser)

* [Set-RDMUserProperty](Set-RDMUserProperty)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUser
Retrieves the list of available user.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUser; $list[0]
Retrieves the list of available users and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMUser; $list[1].Description = "New Description";Set-RDMUser $list[1]
Retrieves the list of available users, modify the name of the second user, update the user.
```
> EXAMPLE 4

```PowerShell
PS C:\> $user = Get-RDMUser -Name MyUser;
        $user.UserInfo.UserProfile.Company = 'UsersCompany';
        $user.UserInfo.UserProfile.Department = 'UsersDepartment';
        $user.UserInfo.UserProfile.Address = '123 UsersAddress';
        $user.UserInfo.UserProfile.Phone = '555-0100';
        Set-RDMUser -User $user
Update information about the user MyUser.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **Name**
User name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMUser -detailed". For technical information, type "Get-Help Get-RDMUser -full".

---

### Syntax
```PowerShell
Get-RDMUser [-CaseSensitive] [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
