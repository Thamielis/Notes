Set-RDMDatasourceRepository
---------------------------

### Synopsis
Modify data source repository

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $dataSource = Get-RDMDataSource -Name MyDataSource; $repository = Get-RDMRepository -Name MyRepository ;Set-RDMDatasourceRepository -DataSource $dataSource -Repository $repository
Modifiy the data source repository to
```

---

### Parameters
#### **DataSource**
Specifies the data source to change the current repository

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

#### **Repository**
New data source current repository.

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[PSRepositoryInfo]`|true    |2       |false        |Vault  |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDatasourceRepository -detailed". For technical information, type "Get-Help Set-RDMDatasourceRepository -full".

---

### Syntax
```PowerShell
Set-RDMDatasourceRepository [-DataSource] <PSDataSource> [-Repository] <PSRepositoryInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
