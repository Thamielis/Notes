Set-VBRTapeMedium
-----------------

### Synopsis
Modifies tape properties.

---

### Description

This cmdlet modifies properties of a selected tape. You can modify name and/or description of the tape, or mark it as free.

To modify settings, specify new values for the necessary parameters. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example 1. Updating Tape Name and Description [Using Pipeline]

Get-VBRTapeMedium -Name "0014001F" | Set-VBRTapeMedium -Name "SQL 9/2014" -Description "SQL DB monthly full backups: Sept/2022"
This example shows how to rename the 0014001F tape into SQL 9/2022 and sets a description for it.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRTapeMedium cmdlet. Specify the Name parameter value. Specify the Description parameter value.
> Example 2. Marking Tape as Free [Using Pipeline]

Get-VBRTapeMedium -Name "0014001F" | Set-VBRTapeMedium -MarkAsFree
This example shows how to mark the 0014001F tape as free.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRTapeMedium cmdlet. Provide the MarkAsFree parameter.

---

### Parameters
#### **Description**
Specifies the new description you want to assign to the tape.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **MarkAsFree**
If you provide this parameter, the cmdlet will mark the tape as free. Veeam Backup & Replication will delete from backup and tape catalogs information about backup contents stored on tape.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Medium**
Specifies tape you want to modify. Accepts the VBRTapeMedium object, GUID or string.  To get this object, run the Get-VBRTapeMedium cmdlet.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRTapeMedium]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the new name you want to assign to the tape.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeMedium

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRTapeMedium [-Description <String>] [-MarkAsFree] -Medium <VBRTapeMedium> [-Name <String>] [-PassThru] [<CommonParameters>]
```
