Add-VBRCredentials
------------------

### Synopsis
Creates credentials records.

---

### Description

This cmdlet creates a new credentials record that you can use to:
- Authenticate with the instances of your virtual infrastructure.
- Add Windows or Linux credentials records including authentication using the Identity/Pubkey method.
- Add Group Managed Service Accounts (gMSAs). For more information, see the Using Group Managed Service Accounts section in the User Guide for VMware vSphere.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Creating New Windows Credentials Record Using User Name and Password

```PowerShell
Add-VBRCredentials -Type "Windows" -User "Administrator" -Password "qwerty" -Description "Administrator Credentials"
This command creates a new Windows credentials record with the Administrator user name and the qwerty password of the account. The description is Administrator Credentials.
```
> Example 2. Creating New Credentials Record for Administrator

Get-Credential | Add-VBRCredentials -Description "Administrator Credentials"
This example shows how to add a credential record for administrator.
Perform the following steps:
1. Run the Get-Credential cmdlet.
2. Pipe the cmdlet output to the Add-VBRCredentials cmdlet. Specify the Description parameter value.
> Example 3. Creating New Linux Credentials Record for Administrator

```PowerShell
Add-VBRCredentials -Type "Linux" -User "Administrator" -Password "qwerty" -SshPort "23" -ElevateToRoot -AddToSudoers -RootPassword "rootpwd"
This command adds a Linux credentials record with the Administrator user name and the qwerty password of the account. The credentials record will use the 23 SSH port. The root password privileges are given to the user.
```
> Example 4. Adding Linux Pubkey Credentials Record

```PowerShell
Add-VBRCredentials -Type "LinuxPubKey" -User "user1" -Password "qwerty" -PrivateKeyPath "c:\temp\deneb.ppk" -Passphrase "Pass"
This command adds a Linux Pubkey credentials record with the user1 user name and the qwerty password of the account. The path to the private key is c:\temp\deneb.ppk. The passphrase to the private key is Pass.
```

---

### Parameters
#### **AddToSudoers**
For the Identity/Pubkey authentication method. Defines that a user account is added to sudoers file.
Default: (if the ElevateToRoot parameter is set to False) False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Credential**
Specifies the credentials you want to add.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[PSCredential]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description for a credentials record. It is recommended to input this value to make credential records easily identified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ElevateToRoot**
For the Identity/Pubkey authentication method. Defines that non-root users are provided with root account privileges.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command fails.
If you provide this parameter, Veeam Backup & Replication will failover to the su command if sudo command fails. Otherwise, if sudo fails Veeam Backup & Replication will not be able to add Linux credentials records.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Passphrase**
Specifies a passphrase for a Linux private key on the backup server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies a password you want to use for authenticating with instances of your virtual infrastructure.
Note: This parameter is not required if the Type parameter is set to ManagedSvcAccount. In other cases, this parameter is required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrivateKey**
For the Identity/Pubkey authentication method. Specifies a private key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrivateKeyPath**
For the Identity/Pubkey authentication method.
The private key is located at the c:\temp\deneb.ppk path. Use this parameter to specify a private key for the Linux public key option of the Type parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RootPassword**
For the Identity/Pubkey authentication method. Specifies a root password for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SshPort**
For the Identity/Pubkey authentication method.
Specifies a number of an SSH port that you want to use to connect to a Linux server.
Permitted values: 1 to 65535.
Default: 22.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Type**
Specifies the credentials type: Linux, Windows, LinuxPubKey, ManagedSvcAccount.
Default: Windows.
Valid Values:

* Linux
* Windows
* LinuxPubKey
* ManagedSvcAccount

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRCredentialsType]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the instances of your virtual infrastructure. Note that you should use DOMAIN\USERNAME usernames format for all hosts except ESX/ESXi hosts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
System.Management.Automation.PSCredential

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCredentials [-AddToSudoers] -Credential <PSCredential> [-Description <String>] [-ElevateToRoot] [-FailoverToSu] [-Passphrase <String>] [-PrivateKey <String>] [-PrivateKeyPath <String>] [-RootPassword 
```
```PowerShell
<String>] [-SshPort <Int32>] [-Type {Linux | Windows | LinuxPubKey | ManagedSvcAccount}] [<CommonParameters>]
```
```PowerShell
Add-VBRCredentials [-AddToSudoers] [-Description <String>] [-ElevateToRoot] [-FailoverToSu] [-Passphrase <String>] [-Password <String>] [-PrivateKey <String>] [-PrivateKeyPath <String>] [-RootPassword <String>] 
```
```PowerShell
[-SshPort <Int32>] [-Type {Linux | Windows | LinuxPubKey | ManagedSvcAccount}] -User <String> [<CommonParameters>]
```
