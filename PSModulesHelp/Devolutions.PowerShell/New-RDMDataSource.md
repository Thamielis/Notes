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
|`[String]`|true    |named   |false        |

#### **DOD**
Create a Devolutions Online Drive data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DontSavePassword**
Don't save the password in the SQL Server data source settings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Dropbox**
Create a Dropbox data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DVLS**
Create a DVLS data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Filename**
XML Filename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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

#### **Hostname**
Not supported anymore

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **HubBusiness**
Create a Hub Business data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **HubPersonal**
Create a Hub Personal data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **IntegratedSecurity**
Specify to use Windows Integrated Authentication for authenticating to the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MySQL**
Not supported anymore

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Name**
Name of the data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Password**
Password used to encrypt the SQLite database (.db).

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Schema**
Not supported anymore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ScriptingApplicationPassword**
Application password used to access the Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ScriptingTenantID**
Application ID used to access the Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Server**
Name of Devolutions Password Server instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **SetDatasource**
Save the data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SQLite**
Create a SQLite data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **SQLServer**
Create a SQL Server data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **TrustServerCertificate**
Trust the server's self-signed certificate
Valid Values:

* Default
* True
* False

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DefaultBoolean]`|false   |named   |false        |

#### **UserEditable**
Editable username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Username**
Username to access the Devolutions Password Server instance

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **XML**
Create a XML data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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
New-RDMDataSource -SQLite -Database <String> [-Password <SecureString>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -SQLServer -Database <String> -Password <SecureString> -Server <String> [-TrustServerCertificate <Default | True | False>] -Username <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -SQLServer -Database <String> [-IntegratedSecurity] -Server <String> [-TrustServerCertificate <Default | True | False>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -Database <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -SQLServer -Database <String> [-DontSavePassword] -Server <String> [-TrustServerCertificate <Default | True | False>] [-UserEditable] [-Username <String>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -DOD -Filename <String> [-ScriptingApplicationPassword <String>] [-ScriptingTenantID <String>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -Dropbox -Filename <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -DVLS [-Password <SecureString>] [-ScriptingApplicationPassword <String>] [-ScriptingTenantID <String>] -Server <String> [-Username <String>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -DVLS [-IntegratedSecurity] -Server <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -XML -Filename <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -MySQL -Hostname <String> -Schema <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -HubBusiness [-ScriptingApplicationPassword <String>] [-ScriptingTenantID <String>] -Server <String> [-Username <String>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
New-RDMDataSource -HubPersonal [-Username <String>] -Name <String> [-SetDatasource] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
