Get-NcNfsConnectedClientSetting
-------------------------------

### Synopsis
Retrieves the NFS connected-client cache settings of the cluster. This cmdlet is supported with Rest Only.

---

### Description

Retrieves the NFS connected-client cache settings of the cluster.

---

### Related Links
* [Set-NcNfsConnectedClientSetting](Set-NcNfsConnectedClientSetting)

* 

---

### Examples
> Example 1

Get-NcNfsConnectedClientSetting
ClientRetentionInterval EnableNfsClientsDeletion NcController UpdateInterval
----------------------- ------------------------ ------------ --------------
P7D                                        False 10.234.85.2  PT8H

---

### Parameters
#### **EnableNfsClientsDeletion**
Specifies whether or not NFS Clients deletion is enabled for the connected-clients cache. When set to true, connected-clients entries are deleted when a connection is closed

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |0       |true         |

#### **Template**
Specify $a = Get-NcNfsConnectedClientSetting -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsConnectedClientSetting -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNfsConnectedClientSetting -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsConnectedClientSetting -Query $a.

|Type                                                |Required|Position|PipelineInput|
|----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nfs.NfsConnectedClientSettings]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Nfs.NfsConnectedClientSettings, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsConnectedClientSetting -Attributes $a.

|Type                                                |Required|Position|PipelineInput|
|----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nfs.NfsConnectedClientSettings]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsConnectedClientSettings

---

### Notes
Category: Nfs
Api: protocols/nfs/connected-client-settings
Family: NcController

---

### Syntax
```PowerShell
Get-NcNfsConnectedClientSetting [[-EnableNfsClientsDeletion] <bool?>] [<CommonParameters>]
```
```PowerShell
Get-NcNfsConnectedClientSetting -Template <DataONTAP.C.Types.Nfs.NfsConnectedClientSettings> [<CommonParameters>]
```
```PowerShell
Get-NcNfsConnectedClientSetting -Query <DataONTAP.C.Types.Nfs.NfsConnectedClientSettings> [-Attributes <DataONTAP.C.Types.Nfs.NfsConnectedClientSettings>] [<CommonParameters>]
```
