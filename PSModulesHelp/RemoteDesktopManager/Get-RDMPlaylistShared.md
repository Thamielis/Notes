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
|`[Switch]`|false   |1       |true (ByValue)|

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
Get-RDMPlaylistShared [[-ExportConnections]] [<CommonParameters>]
```
