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
New-RDMPlaylistShared [-Name] <String> [-ConnectionPlayList] <ConnectionPlayList> [[-ExportConnections]] [<CommonParameters>]
```
