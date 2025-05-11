Remove-VBRServer
----------------

### Synopsis
Removes hosts from the backup infrastructure.

---

### Description

This cmdlet removes a host from the backup infrastructure.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Removing Virtual Center from Backup Infrastructure

Get-VBRServer -Type "VC" -Name "vCenter01" | Remove-VBRServer
This example shows how to remove the vCenter01 Virtual Center from the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and the Name parameter values.
2. Pipe the cmdlet output to the Remove-VBRServer cmdlet.
> Example 2. Removing Hyper-V Cluster from Backup Infrastructure

$server = Get-VBRServer -Type "HvCluster" -Name "Production05"
Remove-VBRServer -Server $server
This example shows how to remove the Production05 Hyper-V cluster from the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and the Name parameter values. Save the result to the $server variable.
2. Run the Remove-VBRServer cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **Server**
Specifies the array of servers you want to remove.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **SSHElevateToRoot**
Defines that non-root users are provided with the root account privileges.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHFailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command failes.
If you provide this parameter, Veeam Backup & Replication will failover to the su command if the sudo command fails. Otherwise, if sudo failes Veeam Backup & Replication will not be able to add Linux credentials records.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHPassword**
Specifies the password you want to use for authenticating with the Linux server.
Note: To add a Linux host using an SSH key fingerprint, provide the Confirm parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHPort**
Specifies the Web service port for the connection to the Linux server console.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SSHRootPassword**
Specifies the root password used for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHUser**
Specifies the user name you want to use for authenticating with the Linux server.
Note: To add a Linux host using an SSH key fingerprint, provide the Confirm parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRServer [-Server] <CHost[]> [-SSHElevateToRoot] [-SSHFailoverToSu] [-SSHPassword <String>] [-SSHPort <Int32>] [-SSHRootPassword <String>] [-SSHUser <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
