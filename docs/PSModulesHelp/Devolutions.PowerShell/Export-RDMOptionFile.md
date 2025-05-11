Export-RDMOptionFile
--------------------

### Synopsis
Export a RemoteDesktopManager configuration file

---

### Description

Export a RemoteDesktopManager configuration file

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg
Retrieve the current configuration and export it to a cfg file at C:\MyPath\Filename.cfg
```
> EXAMPLE 2

```PowerShell
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg -DataSources (Get-RDMDataSource | Where-Object {$_.Name -like "Test*"})
Retrieve the current configuration with only the datasources whose name beginning with Test and export it to a cfg file at C:\MyPath\Filename.cfg
```
> EXAMPLE 3

```PowerShell
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg -ProxySettings -RegistrationName -RegistrationEmail -RegistrationKey -DataSources @()
Retrieve the current configuration file including the proxy settings and the registration information and without datasources and export it to a cfg file at C:\MyPath\Filename.cfg
```

---

### Parameters
#### **ClearApplicationLockInformation**
Clear the application lock information in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CloudCredentials**
Include the Devolutions Account credentials in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DataSourceCredentials**
Include your data source credentials.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Datasources**
PSDataSource objects, must be retrieved from Get-RDMCurrentDataSource or Get-RDMDatasource, or created via New-RDMDataSource.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSDataSource[]]`|false   |named   |false        |

#### **ForceAlwaysRetrieveNewRegistration**
Include the force always new registration in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Path**
Path where the file will be the saved. Must be different from the current configuaration file and end with .cfg

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ProxySettings**
Includes your proxy settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RegistrationEmail**
Include the registration email in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RegistrationKey**
Registration keys are now stored in the datasource. Avoid using this parameter. Include the registration key in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RegistrationName**
Include the registration name in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SavedInstallationPaths**
Preserve your installation paths configured for the external application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SavedTemplates**
Include the local templates in the configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
System.String

File path

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMOptionFile -detailed". For technical information, type "Get-Help Export-RDMOptionFile -full".

---

### Syntax
```PowerShell
Export-RDMOptionFile [-ClearApplicationLockInformation] [-CloudCredentials] [-Datasources <PSDataSource[]>] [-ForceAlwaysRetrieveNewRegistration] [-DataSourceCredentials] [-ProxySettings] [-RegistrationEmail] [-RegistrationKey] [-RegistrationName] [-SavedInstallationPaths] [-SavedTemplates] -Path <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
