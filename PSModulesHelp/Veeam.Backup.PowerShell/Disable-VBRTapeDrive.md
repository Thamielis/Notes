Disable-VBRTapeDrive
--------------------

### Synopsis
Disables a selected tape library drive.

---

### Description

This cmdlet disables a selected tape library recording drive.

When you disable a drive, Veeam Backup & Replication stops using it for read or write operations. You can disable a drive, for example, for maintenance.

Run the Enable-VBRTapeDrive cmdlet to enable the drive.

---

### Related Links
* [Get-VBRTapeDrive](Get-VBRTapeDrive)

---

### Examples
> Example 1 Disabling Drive of Selected Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Get-VBRTapeDrive | Select -Last 1 | Disable-VBRTapeDrive
This example shows how to disable one drive of the HP MSL G3 Series 3.00 library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeDrive cmdlet. Select the last drive in the list. Pipe this all to Disable-VBRTapeDrive.
> Example 2 Disabling Drive of Selected Library [Using Variable]

$library = Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00"
$drive =  Get-VBRTapeDrive -Library $library | Select -First 1
Disable-VBRTapeDrive -Drive $drive
This example shows how to disable a first drive in HP MSL G3 Series 3.00 tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
2. Run the Get-VBRTapeDrive cmdlet. Set the $library variable as the Library parameter value. Select the first drive. Save the result to the $drive variable.
3. Run the Disable-VBRTapeDrive cmdlet. Set the $drive variable as the Drive parameter value.

---

### Parameters
#### **Drive**
Specifies the array of drives. The cmdlet will disable these drives. Accepts the VBRTapeDrive[] object.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeDrive[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeDrive[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRTapeDrive -Drive <VBRTapeDrive[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
