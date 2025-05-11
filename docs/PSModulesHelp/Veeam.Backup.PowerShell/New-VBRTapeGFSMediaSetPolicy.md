New-VBRTapeGFSMediaSetPolicy
----------------------------

### Synopsis
Creates a new VBRTapeGFSMediaSetPolicy object.

---

### Description

This cmdlet creates a new VBRTapeGFSMediaSetPolicy object. This object contains advanced GFS media set options and is used to apply these options to a GFS media pool.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRTapeVault](Get-VBRTapeVault)

---

### Examples
> Example 1 Creating Policy to Append Data to Current Tape and Move Offline Tapes to Vault

$vault = Get-VBRTapeVault -Name "Sydney Remote Storage"
New-VBRTapeGFSMediaSetPolicy -AppendToCurrentTape -MoveOfflineToVault -Vault $vault
This example shows how to create a GFS media set policy with advanced settings. After you apply the policy to a GFS media set, it will append new data to the current tape and move offline tapes to the Sydney Remote Storage vault.
Perform the following step:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $vault variable.
2. Run the New-VBRTapeGFSMediaSetPolicy cmdlet. Provide the AppendToCurrentTape parameter. Provide the MoveOfflineToVault parameter. Set the $vault variable as the Vault parameter value.

---

### Parameters
#### **AppendToCurrentTape**
Defines if the new data is appended to the tape with previously written data. If you set it to $false, a new tape is used for each backup set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Medium**
Specifies the array of tapes. The cmdlet will add these tapes to the media set. Accepts the VBRTapeMedium  object, GUID or string.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **MoveFromMediaPoolAutomatically**
Defines that the media set will be replenished by tapes from the parent media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveOfflineToVault**
Defines that the tapes that go offline must be automatically moved to a vault. Use the Vault parameter to specify the vault to which you want to move the tapes from this media set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name that must be used for creating media set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Vault**
Used to set the vault for the MoveOfflineToVault parameter.  Specifies the vault to which you want to automatically move the tapes. You can use one vault for several media pools. Accepts the VBRTapeVault object, GUID or string.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRTapeVault]`|false   |named   |False        |

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
New-VBRTapeGFSMediaSetPolicy [-AppendToCurrentTape] [-Medium <VBRTapeMedium[]>] [-MoveFromMediaPoolAutomatically] [-MoveOfflineToVault] [-Name <String>] [-Vault <VBRTapeVault>] [<CommonParameters>]
```
