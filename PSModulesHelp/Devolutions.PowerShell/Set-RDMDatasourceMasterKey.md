Set-RDMDatasourceMasterKey
--------------------------

### Synopsis
Modify or clear your data source master key

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $dataSource = Get-RDMDataSource -Name MyDataSource; Set-RDMDatasourceMasterKey -DataSource $dataSource -NewMaster (ConvertTo-SecureString -AsPlainText "MyMasterKey" -Force)
Modify the master key of the data source named MyDataSource to MyMasterKey
```

---

### Parameters
#### **DataSource**
Specifies the data source to change the master key

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

#### **NewMasterKey**
New data source master key.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **NoMasterKey**
Set no master key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDatasourceMasterKey -detailed". For technical information, type "Get-Help Set-RDMDatasourceMasterKey -full".

---

### Syntax
```PowerShell
Set-RDMDatasourceMasterKey [-NewMasterKey] <SecureString> [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMDatasourceMasterKey -NoMasterKey [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
