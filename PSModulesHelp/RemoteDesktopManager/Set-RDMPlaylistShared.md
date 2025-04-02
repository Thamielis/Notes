Set-RDMPlaylistShared
---------------------

### Synopsis
Save a shared playlist in the current data source

---

### Description

Save a shared playlist in the current data source

---

### Parameters
#### **ImportConnection**
Import the playlist connections to the data source.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |2       |true (ByValue)|

#### **Playlist**
Specifies the the shared playlist to set/save.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[PSPlaylistShared]`|true    |1       |true (ByValue)|

#### **PrivateVault**
Save the shared playlist in the private vault.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |3       |true (ByValue)|

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
Set-RDMPlaylistShared [-Playlist] <PSPlaylistShared> [[-ImportConnection]] [[-PrivateVault]] [<CommonParameters>]
```
