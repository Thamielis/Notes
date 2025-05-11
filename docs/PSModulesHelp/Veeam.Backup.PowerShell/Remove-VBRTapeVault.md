Remove-VBRTapeVault
-------------------

### Synopsis
Removes a specified tape vault from the backup infrastructure.

---

### Description

This cmdlet removes a specified tape vault from the backup infrastructure.

When you remove a vault, you do not remove the tapes stored in it.

---

### Related Links
* [Get-VBRTapeVault](Get-VBRTapeVault)

---

### Examples
> Example 1 Removing Tape Vault [Using Pipeline]

Get-VBRTapeVault -Name "Sydney Remote Storage" | Remove-VBRTapeVault
This command removes a tape vault named 'Sydney Remote Storage'.

Perform the following steps:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRTapeVault cmdlet.
> Example 2 Removing Tape Vaults [Using Variable]

$SydneyRemoteStorage = Get-VBRTapeVault -Name "Sydney Remote Storage"
$NewYorkRemoteStorage = Get-VBRTapeVault -Name "New York Remote Storage"
Remove-VBRTapeVault -Vault $SydneyRemoteStorage, $NewYorkRemoteStorage
This example shows how to remove tape vaults Sydney Remote Storage and New York Remote Storage.

Perform the following steps:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $SydneyRemoteStorage variable.
2. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $NewYorkRemoteStorage variable.
3. Run the Remove-VBRTapeMediaPool cmdlet. Set the $SydneyRemoteStorage and $NewYorkRemoteStorage variables as the Vault parameter values.

---

### Parameters
#### **Vault**
Specifies the array of vaults. The cmdlet will remove these vaults. Accepts the VBRTapeVault[] object.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeVault[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeVault[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRTapeVault -Vault <VBRTapeVault[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
