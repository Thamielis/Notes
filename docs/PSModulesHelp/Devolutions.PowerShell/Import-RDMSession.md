Import-RDMSession
-----------------

### Synopsis
Import RDM sessions from a file

---

### Description

Import RDM sessions from a file. To save the sessions in the data source, the parameter SetSession must be used. The supported files are '.rdm' and '.json'.

---

### Related Links
* [Set-RDMSession](Set-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $sessions = Import-RDMSession -Path "C:\MyFile.rdm" -Group "DestinationGroup" -DuplicateAction "Add"
Obtain all sessions in the file "MyFile.rdm" and prepend their group with DestinationGroup. In case a session already existed, a new ID will be assigned to it.
```
> EXAMPLE 2

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString "myPassword" -AsPlainText; $sessions = Import-RDMSession -Path "C:\MyFile.rdm" -Password $pwd | Set-RDMSession
Obtain all sessions in the password protected file "MyFile.rdm". In case a session already existed, it will be ignored. All sessions are saved in the current data source.
```

---

### Parameters
#### **DuplicateAction**
Action when a duplicate is found. Must be one of the following:
"Add", "Overwrite", "Ignore"
Valid Values:

* Add
* Overwrite
* Ignore

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

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

#### **Group**
The group where the sessions will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **KeepID**
Keep the entries' ID. Unwanted behaviors, such as moving an entry if imported in the same database, might occurs if this option is present.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Password to access a password protected file.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |3       |false        |

#### **Path**
Path where the file is loaded. Must be finish:
"RDM: .rdm", "XML: .xml", "JSON: .json"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetSession**
Save all imported sessions. Required to import the documents and attachments included in sessions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Import-RDMSession -detailed". For technical information, type "Get-Help Import-RDMSession -full".

---

### Syntax
```PowerShell
Import-RDMSession [[-DuplicateAction] <Add | Overwrite | Ignore>] [[-Group] <String>] [-Path] <String> [[-Password] <SecureString>] [-KeepID] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
