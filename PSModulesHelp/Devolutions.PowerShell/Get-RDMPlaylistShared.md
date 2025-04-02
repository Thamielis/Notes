Get-RDMPlaylistShared
---------------------

### Synopsis
Get the shared playlists of the current data source

---

### Description

Get the shared playlists of the current data source

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $playlists = Get-RDMPlaylistShared
Get the shared playlists of the current data source.
```

---

### Parameters
#### **ExportConnections**
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

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSPlaylistShared[]

---

### Notes
For more information, type "Get-Help Get-RDMPlaylistShared -detailed". For technical information, type "Get-Help Get-RDMPlaylistShared -full".

---

### Syntax
```PowerShell
Get-RDMPlaylistShared [-ExportConnections] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
