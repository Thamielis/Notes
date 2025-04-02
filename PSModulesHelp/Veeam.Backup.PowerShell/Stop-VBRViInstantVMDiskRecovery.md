Stop-VBRViInstantVMDiskRecovery
-------------------------------

### Synopsis
Stops restore of VM virtual disks.

---

### Description

This cmdlet stops a restore of VM virtual disks.

---

### Related Links
* [Get-VBRInstantRecovery](Get-VBRInstantRecovery)

---

### Examples
> Stopping Restore of VM Virtual Disks

$session = Get-VBRInstantRecovery
Stop-VBRViInstantVMDiskRecovery -InstantRecovery $session
This example shows how to stop a session that is running to restore VM virtual disks.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Save the result to the $session variable. 2. Run the Stop-VBRViInstantVMDiskRecovery cmdlet. Set the $session variable as the InstantRecovery parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will run without warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstantRecovery**
Specifies a session that is running to restore VM virtual disks.
The cmdlet will stop this session.
Accepts the InstantRecovery object.
To get this object, run the Get-VBRInstantRecovery cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[InstantRecovery]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Indicates that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRViInstantVMDiskRecovery [-InstantRecovery] <InstantRecovery> [-Force] [-RunAsync] [<CommonParameters>]
```
