Remove-VBRCloudVLANConfiguration
--------------------------------

### Synopsis
Removes pools of VLANs reserved for Veeam Backup & Replication.

---

### Description

This cmdlet removes a selected VLAN pool.

---

### Related Links
* [Get-VBRCloudVLANConfiguration](Get-VBRCloudVLANConfiguration)

---

### Examples
> Example - Removing Selected Pool of VLANs

$configs = Get-VBRCloudVLANConfiguration
Remove-VBRCloudVLANConfiguration -Configuration $configs[0]
This example shows how to remove a selected pool of VLANs.
Perform the following steps:
1. Run the Get-VBRCloudVLANConfiguration cmdlet. Save the array of pools to the $configs variable. Mind the ordinal number of the necessary VLAN pool (in our example, it is the first VLAN pool in the array).
2. Run the Remove-VBRCloudVLANConfiguration cmdlet. Set the $configs variable as the Configuration parameter value.

---

### Parameters
#### **Configuration**
Specifies the VLAN configuration you want to remove. Accepts the Get-VBRCloudVLANConfiguration object. To get this object, run the Get-VBRCloudVLANConfiguration cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRCloudVLANConfiguration]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudVLANConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudVLANConfiguration -Configuration <VBRCloudVLANConfiguration> [-Confirm] [-WhatIf] [<CommonParameters>]
```
