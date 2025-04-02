Set-RDMDatasourceProperty
-------------------------

### Synopsis
Save/set the datasource.

---

### Description

Save/set the datasource. Datasource must be first fetch via Data source property of the Get-RDMDataSource cmdlet or via the New-RDMDataSource result.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMDataSource;  Set-RDMDataSourceProperty -DataSource $list[0] -Property "Name" -Value "MyNewDataSourceName"; Set-RDMDataSource $list[0]
Change the name of the first data source
```

---

### Parameters
#### **DataSource**
Specifies the datasouce

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

#### **Value**
New value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDatasourceProperty -detailed". For technical information, type "Get-Help Set-RDMDatasourceProperty -full".

---

### Syntax
```PowerShell
Set-RDMDatasourceProperty [-DataSource] <PSDataSource> [-Property] <String> [-Value] <Object> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
