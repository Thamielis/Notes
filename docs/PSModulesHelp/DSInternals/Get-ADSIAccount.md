Get-ADSIAccount
---------------

### Synopsis
Gets all Active Directory user accounts from a given domain controller using ADSI. Typically used for Credential Roaming data retrieval through LDAP.

---

### Description

Gets all Active Directory user accounts from a given domain controller using ADSI/LDAP. Typically used for Credential Roaming data retrieval and NGC key auditing.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-ADSIAccount.md)

* [Get-ADDBAccount](Get-ADDBAccount)

* [Get-ADReplAccount](Get-ADReplAccount)

* [Save-DPAPIBlob](Save-DPAPIBlob)

* [Get-ADKeyCredential](Get-ADKeyCredential)

---

### Examples
> Example 1

PS C:\> Get-LsaBackupKey -ComputerName 'lon-dc1.contoso.com' | Save-DPAPIBlob -DirectoryPath '.\Output'
PS C:\> Get-ADSIAccount -Server 'lon-dc1.contoso.com' | Save-DPAPIBlob -DirectoryPath '.\Output'
Retrieves DPAPI backup keys from the target domain controller through the MS-LSAD protocol. Also retrieves roamed credentials (certificates, private keys, and DPAPI master keys) from this domain controller through LDAP and saves them to the Output directory. Also creates a file called kiwiscript.txt that contains mimikatz commands needed to decrypt the private keys.
> Example 2

```PowerShell
PS C:\> Get-ADSIAccount -Server 'lon-dc1.contoso.com' |
            Select-Object -ExpandProperty KeyCredentials |
            Where-Object Usage -eq NGC |
            Format-Table -View ROCA
<# Sample Output:

Usage IsWeak Source  DeviceId                             Created    Owner
----- ------ ------  --------                             -------    -----
NGC   True   AzureAD fd591087-245c-4ff5-a5ea-c14de5e2b32d 2017-07-19 CN=John Doe,CN=Users,DC=contoso,DC=com
NGC   False  AD      1966d4da-14da-4581-a7a7-5e8e07e93ad9 2019-08-01 CN=Jane Doe,CN=Users,DC=contoso,DC=com
#>
Lists weak public keys registered in Active Directory that were generated on ROCA-vulnerable TPMs.
```

---

### Parameters
#### **Credential**
Specifies a user account to use when connecting to the target domain controller. The default is the current user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **Server**
Specifies the target computer for the operation. Enter a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. When the remote computer is in a different domain than the local computer, the fully qualified domain name is required.

|Type      |Required|Position|PipelineInput|Aliases                                          |
|----------|--------|--------|-------------|-------------------------------------------------|
|`[String]`|false   |named   |False        |Host<br/>DomainController<br/>DC<br/>ComputerName|

---

### Inputs
None

---

### Outputs
* DSInternals.Common.Data.DSAccount

---

### Notes

---

### Syntax
```PowerShell
Get-ADSIAccount [-Credential <PSCredential>] [-Server <String>] [<CommonParameters>]
```
