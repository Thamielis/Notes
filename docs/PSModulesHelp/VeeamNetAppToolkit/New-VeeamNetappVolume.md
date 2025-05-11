New-VeeamNetappVolume
---------------------

### Synopsis

---

### Description

Creates a new a NetApp Volume and adds it to Veeam Configuration as a NAS Backup Job.

---

### Related Links
* [https://mycloudrevolution.com/](https://mycloudrevolution.com/)

---

### Examples
> BEISPIEL 1

```PowerShell
New-VeeamNetappVolume -NFS -IP 10.0.2.16 -ExportPolicyName veeam -VolName vol_nfs_01 -VolSize 1 -VeeamCacheRepo 'Default Backup Repository' -NetAppAggregate aggr1_data01 -NetAppVserver svm_veeam_nfs -NetAppInterface svm_veeam_nfs_nfs_lif1 -NetAppSnapshotPolicy default
```
> BEISPIEL 2

```PowerShell
New-VeeamNetappVolume -NFS -IP 10.0.2.16 -ExportPolicyName veeam -VolName vol_nfs_01 -VolSize 1 -CreateBackupJob -VeeamBackupRepo 'Default Backup Repository' -VeeamCacheRepo 'Default Backup Repository' -NetAppAggregate aggr1_data01 -NetAppVserver svm_veeam_nfs -NetAppInterface svm_veeam_nfs_nfs_lif1 -NetAppSnapshotPolicy default
```

---

### Parameters
#### **CreateBackupJob**
Create a Backup Job fot the New NAS Server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NFS**
NFS Volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **SMB**
SMB Volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **IP**
IP for the NFS Export

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|true    |named   |false        |

#### **ExportPolicyName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **VolName**
Name of the new Volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **VolSize**
Size of the new Volume in GB

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

---

### Notes
File Name  : New-VeeamNetappVolume.psm1
Author     : Markus Kraus
Version    : 0.3
State      : Dev

---

### Syntax
```PowerShell
New-VeeamNetappVolume [-CreateBackupJob] -NFS -IP <IPAddress> -ExportPolicyName <String> -VolName <String> -VolSize <Int32> [<CommonParameters>]
```
```PowerShell
New-VeeamNetappVolume [-CreateBackupJob] -SMB -VolName <String> -VolSize <Int32> [<CommonParameters>]
```
