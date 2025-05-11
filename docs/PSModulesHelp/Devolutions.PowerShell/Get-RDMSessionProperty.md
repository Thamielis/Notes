Get-RDMSessionProperty
----------------------

### Synopsis
Get the value of property given a session ID and path.

---

### Description

Protected values will always return null.

Non value types will always return ".ToString()".

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Set-RDMSessionProperty](Set-RDMSessionProperty)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSessionProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group"
Get the Group value from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMSessionProperty "{00000000-0000-0000-0000-000000000000}" "MetaInformation" "OS"
Get the MetaInformation.OS value from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMSession; Get-RDMSessionProperty -ID $list[1].ID -Path "MetaInformation" -Property "OS"
Retrieves the list of available sessions and then returns MetaInformation.OS value of the the second element in the list.
```

---

### Parameters
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

#### **ID**
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Path**
The path to the property being read (refernce RDM export xml). If top level property do not sepcify parameter or pass empty string [""] or $null

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Property**
Property to read(get).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-RDMSessionProperty -detailed". For technical information, type "Get-Help Get-RDMSessionProperty -full".

---

### Syntax
```PowerShell
Get-RDMSessionProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
