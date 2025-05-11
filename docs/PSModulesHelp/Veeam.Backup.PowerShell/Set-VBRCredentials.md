Set-VBRCredentials
------------------

### Synopsis
Modifies credentials records properties.

---

### Description

This cmdlet allows you to modify password or description of a selected credentials record.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Setting New Password for Credentials Record Using User Name

$credentials = Get-VBRCredentials -Name "Administrator"
Set-VBRCredentials -Credential $credentials -Password "qwerty"
This example shows how to set a new password for the credentials record with the Administrator user name. The new password is qwerty.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Set-VBRCredentials cmdlet. Set the $credentials variable as the Credential parameter value. Specify the Password parameter value.
> Example 2. Setting New Password for Credentials Record Using User Name [Using Pipeline]

Get-VBRCredentials -Name "Administrator" | Set-VBRCredentials -Password "qwerty"
This example shows how to set a new password for the credentials record with the Administrator user name. The new password is qwerty.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRCredentials cmdlet. Specify the Password parameter value.
> Example 3. Setting New Description for Specific Credentials Record

$credentials = Get-VBRCredentials
Set-VBRCredentials -Credential $credentials[1] -Description "ESXi Host Credentials"
This example shows how to set a new description for the credentials record. The new description is ESXi Host Credentials.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
The Get-VBRCredentials cmdlet will return an array of credential records. Mind the ordinal number of the necessary credential record (in our example, it is the second restore session in the array).
2. Run the Set-VBRCredentials cmdlet. Set the $credentials variable as the Credentials parameter value. Specify the Description parameter value.

---

### Parameters
#### **AddToSudoers**
Used for Identity/Pubkey authentication method.
Defines that a user account is added to the sudoers file.
Default: (if the ElevateToRoot parameter is set to False) False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Credential**
Specifies credentials you want to modify.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description for a credentials record. It is recommended to input this value to make credential records easily identified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ElevateToRoot**
Used for Identity/Pubkey authentication method.
Defines that non-root users are provided with root account privileges.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command fails.
If you provide this parameter, Veeam Backup & Replication will failover to the su command if the sudo command fails. Otherwise, if the sudo fails Veeam Backup & Replication will not be able to add Linux credentials records.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Passphrase**
Specifies a passphrase for a Linux private key on a backup server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies a password you want to use to authenticate with instances of your virtual infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrivateKey**
Used for Identity/Pubkey authentication method.
Specifies a private key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrivateKeyPath**
Used for Identity/Pubkey authentication method.
Specifies a path to a private key. Use this parameter to specify a private key for the LinuxPubKey option of the Type parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RootPassword**
Used for Identity/Pubkey authentication method.
Specifies a root password for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SshPort**
Used for Identity/Pubkey authentication method.
Specifies a number of an SSH port that you want to use to connect to a Linux server.
Permitted values: 1 to 65535.
Default: 22.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **User**
Specifies a user name you want to use to authenticate against instances of your virtual infrastructure.
Note: You should use DOMAIN\username format for all hosts except ESX/ESXi hosts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCredentials [-AddToSudoers] -Credential <CCredentials> [-Description <String>] [-ElevateToRoot] [-FailoverToSu] [-Passphrase <String>] [-Password <String>] [-PrivateKey <String>] [-RootPassword <String>] 
```
```PowerShell
[-SshPort <Int32>] [-User <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRCredentials [-AddToSudoers] -Credential <CCredentials> [-Description <String>] [-ElevateToRoot] [-FailoverToSu] [-Passphrase <String>] [-Password <String>] [-PrivateKeyPath <String>] [-RootPassword 
```
```PowerShell
<String>] [-SshPort <Int32>] [-User <String>] [<CommonParameters>]
```
