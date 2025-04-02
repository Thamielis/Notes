Invoke-RDMUpdateDataSourceDatabase
----------------------------------

### Synopsis
Upgrade a Database

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $ds = Get-RDMDataSource -Name SQLServerDataSourceName; Invoke-RDMUpdateDataSourceDatabase -DataSource $ds
Get a SQL Server data source and upgrade the database
```

---

### Parameters
#### **DataSource**
PSDataSource object, must be retrieved from Get-RDMDataSource.

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

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Invoke-RDMUpdateDataSourceDatabase -detailed". For technical information, type "Get-Help Invoke-RDMUpdateDataSourceDatabase -full".

---

### Syntax
```PowerShell
Invoke-RDMUpdateDataSourceDatabase [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
