Get-NcClusterfirmwarehistory
----------------------------

### Synopsis
Retrieves a  history of firmware update requests.

---

### Description

Retrieves a history of firmware update requests. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> 

---

### Parameters
#### **FileName**
Specify the name of firmware file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **NodeName**
Specify the name of Node

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcClusterfirmwarehistory -Template, to get an empty firmware history object for use with advanced queries involving the Attributes like $b = Get-NcClusterfirmwarehistory -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcClusterfirmwarehistory -Template, to get an empty firmware history object for use with advanced queries involving the Attributes like $b = Get-NcClusterfirmwarehistory -Query $a.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterFirmwareHistoryOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Cluster.ClusterFirmwareHistoryOutput, to get an empty firmware history object for use with advanced queries involving the Attributes like $b = Get-NcClusterfirmwarehistory -Attributes $a.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterFirmwareHistoryOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterFirmwareHistoryOutput

---

### Notes
Category: Cluster
Api: api/cluster/firmware/history
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterfirmwarehistory [[-FileName] <String>] [[-NodeName] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterfirmwarehistory -Template <DataONTAP.C.Types.Cluster.ClusterFirmwareHistoryOutput> [<CommonParameters>]
```
```PowerShell
Get-NcClusterfirmwarehistory -Query <ClusterFirmwareHistoryOutput> [-Attributes <ClusterFirmwareHistoryOutput>] [<CommonParameters>]
```
