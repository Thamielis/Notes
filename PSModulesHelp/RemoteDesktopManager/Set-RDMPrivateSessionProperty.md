Set-RDMPrivateSessionProperty
-----------------------------

### Synopsis
Set the value of property given a session ID and path.

---

### Description

Protected values will always return null.

Non value types will always return ".ToString()".

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionProperty](Get-RDMSessionProperty)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMUserVaultSessionProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group" -Value "My New Group Name"
Set the Group value from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-RDMUserVaultSessionProperty "{00000000-0000-0000-0000-000000000000}" "MetaInformation" "OS" "Windows Server 2008 R2"
Set the MetaInformation.OS value from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMUserVaultSessionProperty -ID $list[1].ID -Path "MetaInformation" -Property "OS" -Value "Windows Server 2008 R2"
Retrieves the list of available sessions and then sets the MetaInformation.OS value of the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Path**
The path to the property being read (reference RDM export xml). In the case of top level property do not specify parameter or pass empty string [""] or $null.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |5       |false        |

#### **Value**
New value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionProperty -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionProperty -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String> [-Value] <Object> [[-Refresh]] [<CommonParameters>]
```
