New-VBRRecoveryMediaISOTarget
-----------------------------

### Synopsis
Creates the path for saving Veeam Recovery Media in the ISO file format.

---

### Description

This cmdlet creates the VBRRecoveryMediaISOTarget object. This object contains the path to the ISO file. Use this object to create Veeam Recovery Media in the ISO file format with the Add-VBRDiscoveredComputerRecoveryMedia cmdlet.
You can specify the full path to the ISO file or use the default one. The default ISO file path includes the path to the Documents folder and the ISO file name containing the name of the protected computer.

---

### Related Links
* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [Add-VBRDiscoveredComputerRecoveryMedia](Add-VBRDiscoveredComputerRecoveryMedia)

---

### Examples
> Example 1. Creating User Defined Veeam Recovery Media ISO File Path

New-VBRRecoveryMediaISOTarget -Path "c:\image.iso"
Path                                                                                             Type
----                                                                                             ----
c:\image.iso                                                                                      ISO
This command creates the user defined Veeam Recovery Media ISO file path.
> Example 2. Creating Default Veeam Recovery Media ISO File Path for Selected Computer

$computer = Get-VBRDiscoveredComputer | Where {$_.name -eq "support.east.local"}
New-VBRRecoveryMediaISOTarget -DiscoveredComputer $computer
Path                                                                                             Type
----                                                                                             ----
C:\Users\Administrator\Documents\VeeamRecoveryMedia_SUPPORT.EAST.LOCAL.iso                        ISO
This example shows how to create the default Veeam Recovery Media ISO file path for a selected computer.
Perform the following steps:
1. Run the Get-VBRDiscoveredComputer cmdlet. Use the Where-Object method to get the computer. Save the result to the $computer variable.
2. Run the New-VBRRecoveryMediaISOTarget cmdlet. Set the $computer variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies a discovered computer. The cmdlet will create the object containing the default Veeam Recovery Media ISO file path for this computer.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies the path for saving Veeam Recovery Media in the ISO file format. The cmdlet will create the object containing this file path.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRRecoveryMediaISOTarget -DiscoveredComputer <VBRDiscoveredComputer> [<CommonParameters>]
```
```PowerShell
New-VBRRecoveryMediaISOTarget -Path <String> [<CommonParameters>]
```
