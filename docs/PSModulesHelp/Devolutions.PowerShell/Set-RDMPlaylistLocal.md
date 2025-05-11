Set-RDMPlaylistLocal
--------------------

### Synopsis
Save a local playlist

---

### Description

Save a local playlist

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

#### **ImportConnection**
Import the playlist connections to the data source.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

#### **Playlist**
Specifies the the local playlist to set/save.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[PSPlaylistLocal]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPlaylistLocal -detailed". For technical information, type "Get-Help Set-RDMPlaylistLocal -full".

---

### Syntax
```PowerShell
Set-RDMPlaylistLocal [-ImportConnection] [-Playlist] <PSPlaylistLocal> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
