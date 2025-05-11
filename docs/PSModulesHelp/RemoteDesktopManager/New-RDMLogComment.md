New-RDMLogComment
-----------------

### Synopsis
Create a log comment.

---

### Description

Create and insert a new log comment.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $sessions = Get-RDMSession;$date = Get-Date;New-RDMLogComment -Comment "MyComment" -Notes "MyNotes" -Session $sessions[2] -StartDateTime $date -EndDateTime $date.AddDays(3)
Create & save a new log comment.
```

---

### Parameters
#### **Comment**
Log comment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **EndDateTime**
End date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |5       |false        |

#### **Notes**
Log notes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Session**
Session object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

#### **StartDateTime**
Start date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |4       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMLogComment -detailed". For technical information, type "Get-Help New-RDMLogComment -full".

---

### Syntax
```PowerShell
New-RDMLogComment [-Session] <PSConnection> [[-Comment] <String>] [-Notes] <String> [-StartDateTime] <DateTime> [[-EndDateTime] <DateTime>] [<CommonParameters>]
```
