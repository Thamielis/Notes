Set-PasswordRemotely
--------------------

### Synopsis
Set-PasswordRemotely function changes a user's password on a remote domain controller.

---

### Description

The Set-PasswordRemotely function allows changing a user's password securely on a remote domain controller. It requires the username, old password, new password, and optionally the domain controller's DNS name or IP address.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PasswordRemotely -UserName "JohnDoe" -OldPassword $SecureOldPassword -NewPassword $SecureNewPassword -DomainController "DC01"
Description:
Changes the password for the user account "JohnDoe" on the domain controller "DC01" using the provided old and new passwords.
```
> EXAMPLE 2

```PowerShell
Set-PasswordRemotely -UserName "JaneSmith" -OldPassword $SecureOldPassword -NewPassword $SecureNewPassword
Description:
Changes the password for the user account "JaneSmith" on the domain controller determined automatically, using the provided old and new passwords.
```

---

### Parameters
#### **UserName**
Specifies the username of the account for which the password will be changed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **OldPassword**
Specifies the old password of the user account.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |named   |false        |

#### **NewPassword**
Specifies the new password to set for the user account.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |named   |false        |

#### **DomainController**
Specifies the domain controller's DNS name or IP address. If not provided, the function will prompt for it or automatically determine it if the machine is joined to a domain.

|Type      |Required|Position|PipelineInput|Aliases                       |
|----------|--------|--------|-------------|------------------------------|
|`[String]`|false   |named   |false        |DC<br/>Server<br/>ComputerName|

---

### Syntax
```PowerShell
Set-PasswordRemotely -UserName <String> -OldPassword <SecureString> -NewPassword <SecureString> [-DomainController <String>] [<CommonParameters>]
```
