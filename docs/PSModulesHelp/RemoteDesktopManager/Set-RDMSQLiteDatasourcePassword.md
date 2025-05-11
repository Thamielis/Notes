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

#### **NewPassword**
New data source password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |4       |false        |

#### **NoPassword**
Set no password.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |4       |false        |

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
Set-RDMSQLiteDatasourcePassword [-NewPassword] <SecureString> [-DataSource] <PSDataSource> [<CommonParameters>]
```
```PowerShell
Set-RDMSQLiteDatasourcePassword [-NoPassword] [-DataSource] <PSDataSource> [<CommonParameters>]
```
