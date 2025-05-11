Get-RDMPlaylistLocal
--------------------

### Synopsis
Get the local playlists of the current data source

---

### Description

Get the local playlists of the current data source

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $playlists = Get-RDMPlaylistLocal
Get the local playlists of the current data source.
```

---

### Parameters
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

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSPlaylistLocal[]

---

### Notes
For more information, type "Get-Help Get-RDMPlaylistLocal -detailed". For technical information, type "Get-Help Get-RDMPlaylistLocal -full".

---

### Syntax
```PowerShell
Get-RDMPlaylistLocal [-ExportConnection] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
