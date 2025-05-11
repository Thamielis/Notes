New-RDMPlaylistLocal
--------------------

### Synopsis
Create a new local playlist

---

### Description

Create a new local playlist

---

### Parameters
#### **Connections**
Connections in the new playlist.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Connection[]]`|true    |4       |false        |

#### **Description**
New local playlist description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ExportConnection**
Export the playlist connections.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |6       |true (ByValue)|

#### **Name**
New local playlist name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **WaitTime**
New local playlist wait time.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMPlaylistLocal -detailed". For technical information, type "Get-Help New-RDMPlaylistLocal -full".

---

### Syntax
```PowerShell
New-RDMPlaylistLocal [-Name] <String> [-Description] <String> [-Connections] <Connection[]> [-WaitTime] <Int32> [[-ExportConnection]] [<CommonParameters>]
```
