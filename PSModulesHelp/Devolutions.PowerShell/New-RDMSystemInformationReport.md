New-RDMSystemInformationReport
------------------------------

### Synopsis
Generate a new system information report

---

### Description

Generate a new system information report.

---

### Related Links
* [Get-RDMSystemInformationReport](Get-RDMSystemInformationReport)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMEntry -Name 'MySystemInformationReportEntry' | New-RDMSystemInformationReport
Generate a new report from the entry 'MySystemInformationReportEntry'
```

---

### Parameters
#### **ExportPath**
Path where the inventory will be saved as an '.inv' file. The inventory will not be part of the history.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **ID**
ID of the system information report entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
System information report entry

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **NoClobber**
Do not overwrite an existing file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

System information report entry

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.InventorySystemInformation

---

### Notes
For more information, type "Get-Help New-RDMSystemInformationReport -detailed". For technical information, type "Get-Help New-RDMSystemInformationReport -full".

---

### Syntax
```PowerShell
New-RDMSystemInformationReport [-ID] <Guid> [-ExportPath <String>] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMSystemInformationReport [-InputObject] <PSConnection> [-ExportPath <String>] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
