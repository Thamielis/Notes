Remove-VBRTapeMediaPool
-----------------------

### Synopsis
Removes media pool.

---

### Description

This cmdlet removes a selected media pool from Veeam Backup & Replication.

Removing media pools has the following restrictions:
- You can only delete custom media pools; predefined media pools cannot be deleted.
- You cannot delete a media pool that contains tapes. To be able to delete such a pool, first move tapes from this pool to other media pools.
- You cannot delete media pools used by an existing backup/files to tape copy job. In case you definitely have to disable this pool, you should first modify the corresponding job to target another media pool.

---

### Related Links
* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

---

### Examples
> Example 1 Removing Media Pool [Using Pipeline]

Get-VBRTapeMediaPool -Name "Winserver MediaPool" | Remove-VBRTapeMediaPool
This example shows how to remove the media pool named Winserver MediaPool.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRTapeMediaPool cmdlet.
> Example 2 Removing Media Pool [Using Variable]

$pool = Get-VBRTapeMediaPool -Name "Winserver MediaPool"
Remove-VBRTapeMediaPool -MediaPool $pool
This example shows how to remove the media pool represented by the $pool variable.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
2. Run the Remove-VBRTapeMediaPool cmdlet. Set the $pool variable as the MediaPool parameter value.

---

### Parameters
#### **MediaPool**
Specifies the array of media pools. The cmdlet will remove these media pools. Accepts the VBRTapeMediaPool object, GUID or string.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRTapeMediaPoolBase[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeMediaPoolBase[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRTapeMediaPool -MediaPool <VBRTapeMediaPoolBase[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
