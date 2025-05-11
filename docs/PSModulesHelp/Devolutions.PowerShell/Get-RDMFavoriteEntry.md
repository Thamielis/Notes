Get-RDMFavoriteEntry
--------------------

### Synopsis
Get the entries marked as favorites

---

### Description

Get the entries marked as favorites.

---

### Related Links
* [Add-RDMFavoriteEntry](Add-RDMFavoriteEntry)

* [Remove-RDMFavoriteEntry](Remove-RDMFavoriteEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMFavoriteEntry | Select ID, Name
List all the IDs and names of the favorites
```

---

### Parameters
#### **CaseSensitive**
Filtering by name and group name will be case sensitive.

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

#### **LiteralName**
Filter the entries by their name. No wildcard supports.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Name**
Filter the entries by their name. Support wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Get-RDMFavoriteEntry -detailed". For technical information, type "Get-Help Get-RDMFavoriteEntry -full".

---

### Syntax
```PowerShell
Get-RDMFavoriteEntry [[-Name] <String[]>] [-CaseSensitive] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMFavoriteEntry [[-LiteralName] <String[]>] [-CaseSensitive] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
