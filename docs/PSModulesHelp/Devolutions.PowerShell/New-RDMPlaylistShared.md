New-RDMPlaylistShared
---------------------

### Synopsis
Create a new shared playlist

---

### Description

Create a new shared playlist

---

### Parameters
#### **ConnectionPlayList**
Connections in the new playlist.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[ConnectionPlayList]`|true    |2       |false        |

#### **ExportConnections**
Export the playlist connections.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |3       |true (ByValue)|

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
New shared playlist name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMPlaylistShared -detailed". For technical information, type "Get-Help New-RDMPlaylistShared -full".

---

### Syntax
```PowerShell
New-RDMPlaylistShared [-ConnectionPlayList] <ConnectionPlayList> [[-ExportConnections]] [-Name] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
