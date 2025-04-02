Add-VBRLinux
------------

### Synopsis
Adds a Linux server to the backup infrastructure.

---

### Description

This cmdlet adds a Linux server to the backup infrastructure.
A Linux host that you want to add to the backup infrastructure must have SSH connection enabled.
If you plan to use non-persistent Veeam Data Movers, you must install Perl on a Linux host that you want to add to the backup infrastructure.
A Linux host that you add as a temporary helper appliance is not displayed in the Veeam Backup & Replication UI. Use this host to perform Linux-based or Unix-based guest OS files restore with the Start-VBRLinuxFileRestore cmdlet. Veeam Backup & Replication will delete this helper appliance after you run the Stop-VBRLinuxFileRestore cmdlet to complete the guest OS file restore.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

* [Remove-VBRServer](Remove-VBRServer)

---

### Examples
> Example 1. Adding Linux Host Using Credentials for Authentication

$Administrator = Get-Credential
Add-VBRLinux -Name "LinRepository" -Credentials $Administrator
This example shows how add a Linux host using credentials for authentication.
Perform the following steps:
1. Run the Get-Credential cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRLinux cmdlet. Specify the Name parameter value. Set the $Administrator variable as the Credentials parameter value.
> Example 2. Adding Linux Host Using Username/Password for Authentication

```PowerShell
Add-VBRLinux -Name "198.51.100.2" -SSHUser "Administrator" -SSHPassword "qwerty" -Description "Linux host 01"
This command adds the 198.51.100.2 Linux server.
```
> Example 3. Adding Linux Host as Temporary Helper Appliance

$Administrator = Get-Credential
$admincreds = Add-VBRCredentials -Credential $Administrator -Type Linux -ElevateToRoot -AddToSudoers -FailoverToSu -RootPassword Securepassword
Add-VBRLinux -Credentials $admincreds -HelperHostName 198.51.100.1
This example shows how add the 198.51.100.1 Linux host as a temporary helper appliance.
Perform the following steps:
1. Run the Get-Credential cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRCredentials cmdlet. Specify the Credential, Type, ElevateToRoot, AddToSudoers, FailoverToSu and RootPassword parameter values. Save the result to the $admincreds variable.
3. Run the Add-VBRLinux cmdlet. Set the $admincreds variable as the Credentials parameter value. Specify the HelperHostName parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Linux server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the Linux server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **HelperHostName**
Note: This parameter is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).
Specifies the DNS name or IP address of the temporary helper appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Name**
Specifies the DNS name or IP address of the Linux server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **SSHAddToSudoers**
Defines that the user account is added to sudoers file.
Default: (if the ElevateToRoot parameter is set to False) False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHElevateToRoot**
Defines that non-root users are provided with the root account privileges.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHFailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command fails.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHFingerprint**
Specifies SSH host fingerprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHPassword**
Specifies the password you want to use for authenticating with the Linux server.
Note: To add a Linux host using an SSH key fingerprint, provide the Confirm parameter.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|true    |2       |False        |SSH-Password|

#### **SSHPort**
Specifies the Web service port for connection to the Linux server console.
Default: 443

|Type     |Required|Position|PipelineInput|Aliases |
|---------|--------|--------|-------------|--------|
|`[Int32]`|false   |named   |False        |SSH-Port|

#### **SSHRootPassword**
Specifies the root password used for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHTempCredentials**
To add a Linux server that will be used as a hardened repository.
Defines that the cmdlet will use single-use credentials to access a Linux server.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHUser**
Specifies the user name you want to use for authenticating with the Linux server.
Note: To add a Linux host using an SSH key fingerprint, provide the Confirm parameter.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |False        |SSH-User|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRLinux [-Name] <String> -Credentials <CCredentials> [-Description <String>] [-SSHFingerprint <String>] [-SSHPort <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Add-VBRLinux -Credentials <CCredentials> [-Description <String>] -HelperHostName <String> [-SSHFingerprint <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Add-VBRLinux [-Name] <String> [-SSHUser] <String> [-SSHPassword] <String> [-Description <String>] [-SSHAddToSudoers] [-SSHElevateToRoot] [-SSHFailoverToSu] [-SSHFingerprint <String>] [-SSHPort <Int32>] 
```
```PowerShell
[-SSHRootPassword <String>] [-SSHTempCredentials] [-Confirm] [-WhatIf] [<CommonParameters>]
```
