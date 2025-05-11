Move-VBRTapeMedium
------------------

### Synopsis
Moves a tape to media pool or vault.

---

### Description

This cmdlet moves selected tapes to another media pool or media vault.

IMPORTANT! When you move a tape to any media pool, Veeam Backup & Replication marks this tape as free.

You can configure automatic moving offline tapes to a vault in the media pool settings. Run the Set-VBRTapeMediaPool cmdlet to edit media pool configuration.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [Get-VBRTapeVault](Get-VBRTapeVault)

---

### Examples
> Example 1. Moving Tape to Media Pool [Using Pipeline]

$mediapool = Get-VBRTapeMediaPool -Name "File Backup Media Pool"
Get-VBRTapeMedium -Name 0014001H | Move-VBRTapeMedium -MediaPool $mediapool
This example shows how to move the 0014001H tape to the File Backup Media Pool media pool.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save the result to the $mediapool variable.
2. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Move-VBRTapeMedium cmdlet. Set the $mediapool variable as the MediaPool parameter value.
> Example 2. Moving Tape to Vault [Using Variable]

$medium = Get-VBRTapeMedium -Name 0014001H
$vault = Get-VBRTapeVault -Name "Sydney Remote Vault"
Move-VBRTapeMedium -Medium $medium -Vault $vault
This example shows how to move the 0014001H tape to the Sydney Remote Vault vault.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $medium variable.
2. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $vault variable. 3. Run the Move-VBRTapeMedium cmdlet. Set the $medium variable as the Medium parameter value. Set the $vault variable as the Vault parameter value.

---

### Parameters
#### **MediaPool**
Specifies the media pool to which you want to move the tapes. Accepts the VBRTapeMediaPool object, GUID or string.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolBase]`|true    |named   |False        |

#### **Medium**
Specifies the array of tapes you want to move. Accepts the VBRTapeMedium[] objects, GUID or string. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Vault**
Specifies the media vault to which you want to move the tapes. Accepts the VBRTapeVault object, GUID or string. To get this object, run the Get-VBRTapeVault cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRTapeVault]`|true    |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRTapeMedium[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Move-VBRTapeMedium -MediaPool <VBRTapeMediaPoolBase> -Medium <VBRTapeMedium[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Move-VBRTapeMedium -Medium <VBRTapeMedium[]> -Vault <VBRTapeVault> [-Confirm] [-WhatIf] [<CommonParameters>]
```
