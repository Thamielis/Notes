Get-RDMPrivilegedAccount
------------------------

### Synopsis
Get the connection representing 'My Privileged Account'.

---

### Description

Get the connection representing 'My Privileged Account'. All the pertinent informations are in the property Credentials. On Windows, the policy DisableMyPrivilegedAccount prevent using this cmdlet.

---

### Related Links
* [Set-RDMPrivilegedAccount](Set-RDMPrivilegedAccount)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $privAcc = Get-RDMPrivilegedAccount
Store the privileged account in the variable $privAcc. Access the desired values in $privAcc.Credentials.
```
> EXAMPLE 2

PS C:\> $privAcc = Get-RDMPrivilegedAccount; $privAcc.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $privAcc.Credentials.SecretServerUsername = 'aPassword'; $privAcc.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPrivilegedAccount -Session $privAcc
Fetch the privileged account. Modify the Secret Server's domain, password and username value. Save the modificatons. The password modification can be seen in the value change of the field SafeSecretServerPassword.

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

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMPrivilegedAccount -detailed". For technical information, type "Get-Help Get-RDMPrivilegedAccount -full".

---

### Syntax
```PowerShell
Get-RDMPrivilegedAccount [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
