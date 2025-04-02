Import-RDMDataSource
--------------------

### Synopsis
Import RDM DataSource from a file

---

### Description

Import RDM DataSource from a file

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Import-RDMDataSource -Path "C:\MyFile.rdd" | Set-RDMDataSource
Import the data source from a configuration and save it
```
> EXAMPLE 2

```PowerShell
PS C:\> $ds = Import-RDMDataSource -Path "C:\MyFile.rdd"; $ds.Name = "ANewName"; Set-RDMDataSource -DataSource $ds
Import the data source from a configuration file, rename it "ANewName" and save it
```

---

### Parameters
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

#### **Path**
Path where the file is loaded. Must end with .rdd

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Import-RDMDataSource -detailed". For technical information, type "Get-Help Import-RDMDataSource -full".

---

### Syntax
```PowerShell
Import-RDMDataSource -Path <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
