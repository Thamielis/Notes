Set-RDMPlaylistLocal
--------------------

### Synopsis
Save a local playlist

---

### Description

Save a local playlist

---

### Parameters
#### **ImportConnection**
Import the playlist connections to the data source.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |2       |true (ByValue)|

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
Set-RDMPlaylistLocal [-Playlist] <PSPlaylistLocal> [[-ImportConnection]] [<CommonParameters>]
```
