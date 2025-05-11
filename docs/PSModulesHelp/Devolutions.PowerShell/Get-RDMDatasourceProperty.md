Get-RDMDatasourceProperty
-------------------------

### Synopsis
Get the value of property given for a dataSource.

---

### Description

Protected values will always return null.

Non value types will always return ".ToString()".

---

### Parameters
#### **DataSource**
Specifies the datasource

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|true    |1       |true (ByValue)|

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

#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource

Data source object

System.String

Property name

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
For more information, type "Get-Help Get-RDMDatasourceProperty -detailed". For technical information, type "Get-Help Get-RDMDatasourceProperty -full".

---

### Syntax
```PowerShell
Get-RDMDatasourceProperty [-DataSource] <PSDataSource> [-Property] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
