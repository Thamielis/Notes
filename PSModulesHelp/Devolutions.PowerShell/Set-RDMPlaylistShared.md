Set-RDMPlaylistShared
---------------------

### Synopsis
Save a shared playlist in the current data source

---

### Description

Save a shared playlist in the current data source

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
Specifies the the shared playlist to set/save.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[PSPlaylistShared]`|true    |1       |true (ByValue)|

#### **PrivateVault**
Save the shared playlist in the private vault.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPlaylistShared -detailed". For technical information, type "Get-Help Set-RDMPlaylistShared -full".

---

### Syntax
```PowerShell
Set-RDMPlaylistShared [-ImportConnection] [-Playlist] <PSPlaylistShared> [-PrivateVault] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
