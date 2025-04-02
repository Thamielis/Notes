Set-RDMUser
-----------

### Synopsis

---

### Description

---

### Examples
> EXAMPLE

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

#### **User**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSUserInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMUser -detailed". For technical information, type "Get-Help Set-RDMUser -full".

---

### Syntax
```PowerShell
Set-RDMUser [-User] <PSUserInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
