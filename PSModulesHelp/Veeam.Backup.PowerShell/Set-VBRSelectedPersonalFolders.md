Set-VBRSelectedPersonalFolders
------------------------------

### Synopsis
Modifies the scope of personal data for Agent Backup jobs that back up Microsoft Windows machines.

---

### Description

This cmdlet modifies the scope of personal data for Agent Backup jobs that back up Microsoft Windows machines.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSelectedPersonalFolders](New-VBRSelectedPersonalFolders)

---

### Examples
> Modifying Scope of Personal Data for Agent Backup Jobs that Back Up Microsoft Windows Machines

$folders = New-VBRSelectedPersonalFolders
Set-VBRSelectedPersonalFolders -SelectedPersonalFolders $folders -Favorites -Downloads -ExcludeOneDrive
This example shows how to define the following settings for personal data scope:
- The cmdlet will include data stored in the Favorites and Downloads folders to the backup scope.
- The cmdlet will exclude data stored in the OneDrive folder from the backup scope.
Perform the following steps:
1. Run the New-VBRSelectedPersonalFolders cmdlet. Save the result to the $folders variable.
2. Run the Set-VBRSelectedPersonalFolders cmdlet. Specify the following settings:
- Set the $folders variable as the SelectedPersonalFolders parameter value.
- Provide the Favorites parameter.
- Provide the Downloads parameter.
- Provide the ExcludeOneDrive parameter.

---

### Parameters
#### **ApplicationData**
Defines that the cmdlet will include to the backup scope application data stored on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Custom**
Defines that the cmdlet will include to the backup scope data stored in the in custom locations on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Desktop**
Defines that the cmdlet will include to the backup scope data stored in the Desktop folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Documents**
Defines that the cmdlet will include to the backup scope data stored in the Documents folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Downloads**
Defines that the cmdlet will include to the backup scope data stored in the Downloads folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeOneDrive**
Excludes data stored in the OneDrive folder from the backup scope.
If you do not provide this parameter, the cmdlet will include data stored in the OneDrive folder to the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeRoamingUsers**
Excludes roaming user profiles from the backup scope.
If you do not provide this parameter, the cmdlet will include roaming user profiles to the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Favorites**
Defines that the cmdlet will include to the backup scope data stored in the Favorites folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Pictures**
Defines that the cmdlet will include to the backup scope data stored in the Pictures folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SelectedPersonalFolders**
Specifies the scope of personal data that you want to modify.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRSelectedPersonalFolders]`|true    |named   |True (ByValue)|

#### **Video**
Defines that the cmdlet will include to the backup scope data stored in the Video folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSelectedPersonalFolders

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSelectedPersonalFolders [-ApplicationData] [-Custom] [-Desktop] [-Documents] [-Downloads] [-ExcludeOneDrive] [-ExcludeRoamingUsers] [-Favorites] [-Pictures] -SelectedPersonalFolders 
```
```PowerShell
<VBRSelectedPersonalFolders> [-Video] [<CommonParameters>]
```
