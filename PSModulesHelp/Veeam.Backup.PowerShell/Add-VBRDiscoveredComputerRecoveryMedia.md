Add-VBRDiscoveredComputerRecoveryMedia
--------------------------------------

### Synopsis
Creates Veeam Recovery Media.

---

### Description

This cmdlet creates Veeam Recovery - a recovery image of your computer. You can create Veeam Recovery Media on removable storage devices, optical disks or save it locally in the ISO file format.
Note: To create Veeam Recovery Media for a protected computer, you must have a full backup of this computer. This backup must contain an OS of this computer.

---

### Related Links
* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [Get-VBRRecoveryMediaTarget](Get-VBRRecoveryMediaTarget)

* [New-VBRRecoveryMediaISOTarget](New-VBRRecoveryMediaISOTarget)

---

### Examples
> Example 1. Saving Veeam Recovery Media in ISO File Format

$isopath = New-VBRRecoveryMediaISOTarget -Path "c:\image.iso"
$computer = Get-VBRDiscoveredComputer | Where {$_.name -eq "support.east.local"}
Add-VBRDiscoveredComputerRecoveryMedia -DiscoveredComputer $computer -RecoveryMediaTarget $isopath
This example shows how to save Veeam Recovery Media in the ISO file format.
Perform the following steps:
1. Run the New-VBRRecoveryMediaISOTarget cmdlet. Specify the Path parameter value. Save the result to the $isopath variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Use the Where-Object method to get the computer for which you want to create Veeam Recovery Media. Save the result to the $computer variable.
3. Run the Add-VBRDiscoveredComputerRecoveryMedia cmdlet. Set the $computer variable as the DiscoveredComputer parameter value. Set the $isopath variable as the RecoveryMediaTarget parameter value.
> Example 2. Creating Veeam Recovery Media on Removable Storage Device

$computer = Get-VBRDiscoveredComputer | Where {$_.name -eq "support.east.local"}
$removable = Get-VBRRecoveryMediaTarget -Type RemovableDevice | Where {$_.Description -eq "RECOVERY (F:)"}
Add-VBRDiscoveredComputerRecoveryMedia -DiscoveredComputer $computer -RecoveryMediaTarget $removable
This example shows how to create Veeam Recovery Media on a removable storage device.
Perform the following steps:
1. Run the Get-VBRDiscoveredComputer cmdlet. Use the Where-Object method to get the computer for which you want to create Veeam Recovery Media. Save the result to the $computer variable.
2. Run the Get-VBRRecoveryMediaTarget cmdlet. Set the RemovableDevice value as the Type parameter value. Use the Where-Object method to get the removable storage device where you want to create Veeam Recovery Media. Save the result to the $removable variable.
3. Run the Add-VBRDiscoveredComputerRecoveryMedia cmdlet. Set the $computer variable as the DiscoveredComputer parameter value. Set the $removable variable as the RecoveryMediaTarget parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies the discovered computer for which you want to create Veeam Recovery Media.
Note: You can create Veeam Recovery Media only for discovered computers.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will create Veeam Recovery Media even if any of the following occurs:
* The target removable device needs to be formatted.
* The target optical disk needs to be erased.
* The ISO file under the specified path already exists.
* There is not enough space on the target removable device or optical disk.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **RecoveryMediaTarget**
Specifies a storage device, optical disk or the ISO file path for creating Veeam Recovery Media.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRRecoveryMediaTarget]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer

Veeam.Backup.PowerShell.Infos.VBRRecoveryMediaTarget

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRDiscoveredComputerRecoveryMedia -DiscoveredComputer <VBRDiscoveredComputer> [-Force] -RecoveryMediaTarget <VBRRecoveryMediaTarget> [<CommonParameters>]
```
