Invoke-RDMCreateDataSourceDatabase
----------------------------------

### Synopsis
Create a new Database

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $ds = New-RDMDataSource -SQLServer -Database 'PSTestCreation5' -Name 'PSSQLServerCreation' -Server 'localhost' -Username 'sa' -Password (ConvertTo-SecureString 'masterkey' �asplaintext �force); Invoke-RDMCreateDataSourceDatabase -DataSource $ds
Create a SQL Server data source and create the database
```

---

### Parameters
#### **AzureDatabaseEdition**
Azure database edition.
Valid Values:

* Basic
* Standard
* Premium

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[AzureDatabaseEdition]`|false   |2       |true (ByValue)|

#### **AzureDatabaseMaxSize**
Azure database maximum size.
Valid Values:

* Size100MB
* Size500MB
* Size1GB
* Size2GB
* Size5GB
* Size10GB
* Size20GB
* Size30GB
* Size40GB
* Size50GB
* Size100GB
* Size150GB
* Size200GB
* Size250GB
* Size300GB
* Size400GB
* Size500GB

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[AzureDatabaseMaxSize]`|false   |4       |true (ByValue)|

#### **AzureDatabaseServiceObjective**
Azure database service objective.
Valid Values:

* Basic
* S0
* S1
* S2
* S3
* P1
* P2
* P3

|Type                             |Required|Position|PipelineInput |
|---------------------------------|--------|--------|--------------|
|`[AzureDatabaseServiceObjective]`|false   |3       |true (ByValue)|

#### **DataSource**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession that you want to unparented.

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
For more information, type "Get-Help Invoke-RDMCreateDataSourceDatabase -detailed". For technical information, type "Get-Help Invoke-RDMCreateDataSourceDatabase -full".

---

### Syntax
```PowerShell
Invoke-RDMCreateDataSourceDatabase [[-AzureDatabaseEdition] <Basic | Standard | Premium>] [[-AzureDatabaseMaxSize] <Size100MB | Size500MB | Size1GB | Size2GB | Size5GB | Size10GB | Size20GB | Size30GB | Size40GB | Size50GB | Size100GB | Size150GB | Size200GB | Size250GB | Size300GB | Size400GB | Size500GB>] [[-AzureDatabaseServiceObjective] <Basic | S0 | S1 | S2 | S3 | P1 | P2 | P3>] [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
