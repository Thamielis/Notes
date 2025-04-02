Uninstall-VBRLinuxTransportService
----------------------------------

### Synopsis
Uninstalls guest processing Veeam Data Mover from Linux VMs.

---

### Description

This cmdlet uninstalls guest processing Veeam Data Mover from Linux VMs.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Find-VBRHvEntity](Find-VBRHvEntity)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Uninstalling Veeam Data Mover from Linux VM

$linVm = Find-VBRViEntity -Name "Lin2049"
Uninstall-VBRLinuxTransportService -Entity $linVm -SSHUser Administrator -SSHPassword XXXXXXXXXX -SSHElevateToRoot -SSHAddToSudoers -SSHFailoverToSu -SSHRootPassword XXXXXXXXXX
This example shows how to uninstall Veeam Data Mover from the Lin2049 Linux VM.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $linVm variable.
2. Run the Uninstall-VBRLinuxTransportService cmdlet. Specify the following settings:
- Set the $linVm variable as the Entity parameter value.
- Specify the SSHUser parameter value.
- Specify the SSHPassword parameter value.
- Provide the SSHElevateToRoot parameter.
- Provide the SSHAddToSudoers parameter.
- Provide the SSHFailoverToSu parameter.
- Specify the SSHRootPassword parameter value.

---

### Parameters
#### **Entity**
Specifies an array of Linux VMs from which you want to uninstall Veeam Data Mover.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IVmItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SSHAddToSudoers**
Defines that the user account is added to the sudoers file.
Default: (if the ElevateToRoot parameter is set to False) False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHElevateToRoot**
Defines that non-root users are provided with the root account privileges.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHFailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command fails.
If you do not provide this parameter and sudo fails, Veeam Backup & Replication will not be able to connect to Linux VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHPassword**
Specifies the password you want to use for authenticating with Linux VMs.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|true    |named   |False        |SSH-Password|

#### **SSHPort**
Specifies the Web service port for connection to a Linux server console.
Default: 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SSHRootPassword**
Specifies the root password used for authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHUser**
Specifies the user name you want to use for authenticating with Linux VMs.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |named   |False        |SSH-User|

---

### Inputs
Veeam.Backup.Core.IVmItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRLinuxTransportService -Entity <IVmItem[]> [-SSHAddToSudoers] [-SSHElevateToRoot] [-SSHFailoverToSu] -SSHPassword <String> [-SSHPort <Int32>] [-SSHRootPassword <String>] -SSHUser <String> 
```
```PowerShell
[<CommonParameters>]
```
