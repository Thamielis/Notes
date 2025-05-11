New-RDMDataSource
-----------------

### Synopsis
Create a new datasource instance.

---

### Description

Create a new datasource instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMDatasource $s" to save the datasource.

---

### Related Links
* [Set-RDMDataSource](Set-RDMDataSource)

---

### Parameters
#### **Database**
Indicates the filename of the SQLite database (.db).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **DOD**
Create a Devolutions Online Drive data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **DontSavePassword**
Don't save the password in the SQL Server data source settings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Dropbox**
Create a Dropbox data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **DVLS**
Create a DVLS data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **Filename**
XML Filename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Hostname**
Name of the server where the data source will be store.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **HubBusiness**
Create a Hub Business data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **HubPersonal**
Create a Hub Personal data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **IntegratedSecurity**
Specify to use Windows Integrated Authentication for authenticating to the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **MySQL**
Create a MySQL data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **Name**
Name of the data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Password**
Password used to encrypt the SQLite database (.db).

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |1       |false        |

#### **Schema**
Name of the schema on the MySQL server for the utilization of Remote Desktop Manager.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ScriptingApplicationPassword**
Application password used to access the Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ScriptingTenantID**
Application ID used to access the Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Server**
Name of Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetDatasource**
Save the data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **SQLite**
Create a SQLite data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **SQLServer**
Create a SQL Server data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **UserEditable**
Editable username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Username**
Username to access the Devolutions Password Server instance

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **XML**
Create a XML data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource

---

### Notes
For more information, type "Get-Help New-RDMDataSource -detailed". For technical information, type "Get-Help New-RDMDataSource -full".

---

### Syntax
```PowerShell
New-RDMDataSource [-SQLite] [-Database] <String> [[-Password] <SecureString>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-SQLServer] [-Database] <String> [-Password] <SecureString> [-Server] <String> [-Username] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-SQLServer] [-Database] <String> [[-IntegratedSecurity]] [-Server] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-Database] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-SQLServer] [-Database] <String> [[-DontSavePassword]] [-Server] <String> [[-UserEditable]] [[-Username] <String>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-DOD] [-Filename] <String> [[-ScriptingApplicationPassword] <String>] [[-ScriptingTenantID] <String>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-Dropbox] [-Filename] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-DVLS] [[-Password] <SecureString>] [[-ScriptingApplicationPassword] <String>] [[-ScriptingTenantID] <String>] [-Server] <String> [[-Username] <String>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-DVLS] [[-IntegratedSecurity]] [-Server] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-XML] [-Filename] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-MySQL] [-Hostname] <String> [-Schema] <String> [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-HubBusiness] [[-ScriptingApplicationPassword] <String>] [[-ScriptingTenantID] <String>] [-Server] <String> [[-Username] <String>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource [-HubPersonal] [[-Username] <String>] [-Name] <String> [[-SetDatasource]] [<CommonParameters>]
```
