New-RDMPlaylistLocal
--------------------

### Synopsis
Create a new local playlist

---

### Description

Create a new local playlist

---

### Parameters
#### **Connections**
Connections in the new playlist.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Connection[]]`|true    |3       |false        |

#### **Description**
New local playlist description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ExportConnection**
Export the playlist connections.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

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

#### **Name**
New local playlist name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **WaitTime**
New local playlist wait time.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |4       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMPlaylistLocal -detailed". For technical information, type "Get-Help New-RDMPlaylistLocal -full".

---

### Syntax
```PowerShell
New-RDMPlaylistLocal [-Connections] <Connection[]> [-Description] <String> [-Name] <String> [-WaitTime] <Int32> [-ExportConnection] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
