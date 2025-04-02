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
|`[Switch]`|false   |1       |true (ByValue)|

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
Get-RDMPlaylistLocal [[-ExportConnection]] [<CommonParameters>]
```
