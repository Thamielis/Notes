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
New-RDMLogComment [[-Comment] <String>] [[-EndDateTime] <DateTime>] [-Notes] <String> [-Session] <PSConnection> [-StartDateTime] <DateTime> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
