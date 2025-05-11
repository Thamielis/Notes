Get-SamPasswordPolicy
---------------------

### Synopsis
Queries Active Directory for the default password policy.

---

### Description

Retrieves the current password policy for a domain through the MS-SAMR protocol.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-SamPasswordPolicy.md)

* [Set-SamAccountPasswordHash](Set-SamAccountPasswordHash)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-SamPasswordPolicy -Domain CONTOSO -Server LON-DC1
<# Sample Output:
MinPasswordLength           : 8
ComplexityEnabled           : True
ReversibleEncryptionEnabled : False
MaxPasswordAge              : 90.00:00:00.0
MinPasswordAge              : 01:00:00
PasswordHistoryCount        : 10
#>
Queries the LON-DC1 domain controller for default domain password policy.
```
> Example 2

```PowerShell
PS C:\> Get-SamPasswordPolicy -Domain Builtin
<# Sample Output:
MinPasswordLength           : 0
ComplexityEnabled           : False
ReversibleEncryptionEnabled : False
MaxPasswordAge              : 42.22:47:31.7437440
MinPasswordAge              : 00:00:00
PasswordHistoryCount        : 0
#>
Queries the local computer for its current password policy.
```

---

### Parameters
#### **Credential**
Specifies the user account credentials to use to perform this task. The default credentials are the credentials of the currently logged on user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **Domain**
Specifies the NetBIOS domain name. Local accounts are stored a domain called Builtin.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Server**
Specifies the target computer for the operation. Enter a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. When the remote computer is in a different domain than the local computer, the fully qualified domain name is required.
The default is the local computer. To specify the local computer, such as in a list of computer names, use "localhost", the local computer name, or a dot (.).

|Type      |Required|Position|PipelineInput|Aliases                  |
|----------|--------|--------|-------------|-------------------------|
|`[String]`|false   |named   |False        |ComputerName<br/>Computer|

---

### Inputs
None

---

### Outputs
* DSInternals.SAM.SamDomainPasswordInformation

---

### Notes

---

### Syntax
```PowerShell
Get-SamPasswordPolicy [-Credential <PSCredential>] -Domain <String> [-Server <String>] [<CommonParameters>]
```
