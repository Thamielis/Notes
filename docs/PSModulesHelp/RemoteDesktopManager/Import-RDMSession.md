Import-RDMSession
-----------------

### Synopsis
Import RDM sessions from a file

---

### Description

Import RDM sessions from a file. This cmdlet does not save the sessions in the data source. To do so, the result must be passed to Set-RDMSession.

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
|`[String]`|false   |3       |false        |

#### **Group**
The group where the sessions will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Password**
Password to access a password protected file.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |3       |false        |

#### **Path**
Path where the file is loaded. Must be finish:
"RDM: .rdm", "XML: .xml"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

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
Import-RDMSession [-Path] <String> [[-Group] <String>] [[-DuplicateAction] <String>] [[-Password] <SecureString>] [<CommonParameters>]
```
