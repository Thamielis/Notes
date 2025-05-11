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

#### **NewMasterKey**
New data source master key.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **NoMasterKey**
Set no master key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |2       |false        |

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
Set-RDMDatasourceMasterKey [-NewMasterKey] <SecureString> [-DataSource] <PSDataSource> [<CommonParameters>]
```
```PowerShell
Set-RDMDatasourceMasterKey [-NoMasterKey] [-DataSource] <PSDataSource> [<CommonParameters>]
```
