Repair-RDMUserSqlLogin
----------------------

### Synopsis
Fix the SQL login of an existing user

---

### Description

Fix the SQL login of an existing user, applicable to Microsoft Azure SQL or Microsoft SQL Server data sources. Ensure the user's authentication type aligns with one of the following ServerUserType property values of the PSUserInfo object: SqlServer (2), AzureAD (8), or Okta (10).

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMUser -Name 'myUsername' | Repair-RDMUserSqlLogin
Fix the SQL login of the user named 'myUserName'
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

#### **InputObject**
User needing SQL login fixing

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSUserInfo]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the PSUserInfo object after the SQL login fix

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo

User object obtained from Get-RDMUser

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo

---

### Notes
For more information, type "Get-Help Repair-RDMUserSqlLogin -detailed". For technical information, type "Get-Help Repair-RDMUserSqlLogin -full".

---

### Syntax
```PowerShell
Repair-RDMUserSqlLogin [-InputObject] <PSUserInfo> [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
