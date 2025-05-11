Get-RDMSessionDocumentation
---------------------------

### Synopsis
Get documentation from a session.

---

### Description

Must have the right to export. All information of the documentation pages are accessible.

---

### Related Links
* [Get-RDMRootSession](Get-RDMRootSession)

* [Get-RDMSession](Get-RDMSession)

* [Set-RDMSessionDocumentation](Set-RDMSessionDocumentation)

* [Remove-RDMSessionDocumentation](Remove-RDMSessionDocumentation)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMRootSession | Get-RDMSessionDocumentation
Get the documentation of the root session in the current data source.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMSession -Name "ASession" | Get-RDMSessionDocumentation -Name "APage"
Get the documentation page "APage" of the session ASession.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMSessionDocumentation -ID "{00000000-0000-0000-0000-000000000000}" -Name "APage"
Get the documentation page "APage" of the session with ID = "{00000000-0000-0000-0000-000000000000}" of the current data source.
```

---

### Parameters
#### **Filter**
Filter the pages by looking for the value in the page's name and content. The value of the filter is case insensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ID**
Current data source session`s ID from which to extract the documentation.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Name**
Current data source session`s name from which to extract the documentation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Page**
Filter the handbook pages by the name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Session**
Session from which to extract the documentation.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbook

---

### Notes
For more information, type "Get-Help Get-RDMSessionDocumentation -detailed". For technical information, type "Get-Help Get-RDMSessionDocumentation -full".

---

### Syntax
```PowerShell
Get-RDMSessionDocumentation [-ID] <Guid> [[-Page] <String>] [[-Filter] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionDocumentation [-Name] <String> [[-Page] <String>] [[-Filter] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionDocumentation [-Session] <PSConnection> [[-Page] <String>] [[-Filter] <String>] [<CommonParameters>]
```
