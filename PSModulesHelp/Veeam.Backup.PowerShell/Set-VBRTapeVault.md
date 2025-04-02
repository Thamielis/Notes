Set-VBRTapeVault
----------------

### Synopsis
Modifies a tape vault.

---

### Description

This cmdlet modifies tape vault that was created before. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRTapeVault](Get-VBRTapeVault)

---

### Examples
> Example 1 Modifying Tape Vault Name and Description [Using Pipeline]

Get-VBRTapeVault -Name "Vault 01" | Set-VBRTapeVault -Name "Sydney Remote Storage" -Description "Secondary Sydney Remote Storage" -PassThru

Location    : Sydney Offsite Storage
Medium      : {}
Id          : 4be3b4c9-a620-4abd-a68b-b8a697115781
Name        : Sydney Remote Storage 02
Description : Secondary Sydney Remote Storage
This example shows how to modify the name and the description of the vault named Vault 01.

Perform the following steps:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRTapeVault cmdlet. Specify the Name and Description parameter values. Provide the PassThru parameter.
> Example 2 Modifying Tape Vault Name [Using Variable]

$vault = Get-VBRTapeVault -Name "Sydney Remote Storage 01"
Set-VBRTapeVault -Vault $vault -Name "Sydney Remote Storage 02"
This example shows how to modify the name of the vault to Sydney Remote Storage 02.

Perform the following steps:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $vault variable.
2. Run the Set-VBRTapeVault cmdlet. Set the $vault variable as the Vault parameter values. Specify the Name parameter value.

---

### Parameters
#### **Description**
Specifies the description of the vault. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Protect**
Defines that all tapes moved to this media vault are automatically protected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vault**
Specifies the vault you want to modify.  Accepts the VBRTapeVault object, Guid or string.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRTapeVault]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeVault

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRTapeVault [-Description <String>] [-Name <String>] [-PassThru] [-Protect] -Vault <VBRTapeVault> [<CommonParameters>]
```
