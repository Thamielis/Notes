Set-RDMSQLiteDatasourcePassword
-------------------------------

### Synopsis
Modify or clear your data source password

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $dataSource = Get-RDMDataSource -Name MySqliteDataSource; Set-RDMSQLiteDatasourcePassword -DataSource $dataSource -NewPassword (ConvertTo-SecureString -AsPlainText "MyPassword" -Force)
Modify the password of the data source named MySqliteDataSource to MyPassword
```

---

### Parameters
#### **DataSource**
Specifies the SQLite data source

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

#### **NewPassword**
New data source password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **NoPassword**
Set no password.

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
For more information, type "Get-Help Set-RDMSQLiteDatasourcePassword -detailed". For technical information, type "Get-Help Set-RDMSQLiteDatasourcePassword -full".

---

### Syntax
```PowerShell
Set-RDMSQLiteDatasourcePassword [-NewPassword] <SecureString> [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMSQLiteDatasourcePassword -NoPassword [-DataSource] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
