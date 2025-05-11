Open-RDMSession
---------------

### Synopsis
Open the specified session.

---

### Description

Open the specified session.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Open-RDMSession -ID "{00000000-0000-0000-0000-000000000000}"
Open the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; Open-RDMSession -ID $list[1].ID
Retrieves the list of available sessions and opens the second element in the list.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMSession; Open-RDMSession -ID $list[1].ID -TicketID 123 -Comment "A comment"
Retrieves the list of available sessions and opens the second element in the list while filling the prompt, if required, with the the ticket id and a comment.
```

---

### Parameters
#### **Comment**
Comment for the opening log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ForceExternal**
Open the session external

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **ID**
Specifies the ID of the session to open.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Silent**
Silent

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **TicketID**
Ticket ID for the opening log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Open-RDMSession -detailed". For technical information, type "Get-Help Open-RDMSession -full".

---

### Syntax
```PowerShell
Open-RDMSession [-ID] <Guid> [[-Silent]] [[-ForceExternal]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
