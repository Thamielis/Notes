Set-RDMDefaultDataSource
------------------------

### Synopsis
Set the data source loaded when the application starts

---

### Description

Set the data source loaded when the application starts.
It is possible to modify the 'On start up' option to choose how the loaded data source is chosen. The choices are: LastUsed, Prompt, and UseDefault. Modifying this option will not alter the current default or last used data source.
To change the data source loaded on the next application start, the parameter ID or Name must be used. This will modify the last used or default data source to load.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMDefaultDataSource -Name MyDefaultDS -OnStartUpOption UseDefault
Set the data source 'MyDefaultDS' as the default one that will be loaded on every application starts.
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-RDMDefaultDataSource -Name MyDefaultDs -CaseSensitive
Set the data source 'MyDefaultDs' as the default or last used data source. The search for the data source is case sensitive.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive search of the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
ID of the data source to set as default or last used

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **Name**
Name of the data source to set as default or last used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **OnStartUpOption**
Option to determine which data source to open when the applications starts
Valid Values:

* LastUsed
* Prompt
* UseDefault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDefaultDataSource -detailed". For technical information, type "Get-Help Set-RDMDefaultDataSource -full".

---

### Syntax
```PowerShell
Set-RDMDefaultDataSource [-ID] <Guid> [[-OnStartUpOption] <LastUsed | Prompt | UseDefault>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMDefaultDataSource [[-Name] <String>] [-CaseSensitive] [[-OnStartUpOption] <LastUsed | Prompt | UseDefault>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
