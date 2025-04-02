New-VsphereNetappVolume
-----------------------

### Synopsis

---

### Description

Creates a new a NetApp Volume and mounts it to ESXi Hosts.

---

### Related Links
* [https://mycloudrevolution.com/](https://mycloudrevolution.com/)

---

### Examples
> BEISPIEL 1

```PowerShell
New-VsphereNetappVolume -VolName vol_vmware_11 -VolSize 1 -vSphereCluster Cluster01 -NetAppAggregate aggr_data -NetAppVserver svm-esxi -NetAppInterface svm-nfs_data -NetAppSnapshotPolicy default-1weekly
```

---

### Parameters
#### **VolName**
Name of the new Volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **VolSize**
Size of the new Volume in GB

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |2       |false        |

---

### Notes
File Name  : New-VsphereNetappVolume.psm1
Author     : Markus Kraus
Version    : 1.1
State      : Ready

---

### Syntax
```PowerShell
New-VsphereNetappVolume [-VolName] <String> [-VolSize] <Int32> [<CommonParameters>]
```
