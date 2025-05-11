New-NcVolClone
--------------

### Synopsis
Create a flexible volume that is a clone of a "backing" or "parent" flexible volume.

---

### Description

Create a flexible volume that is a clone of a "backing" or "parent" flexible volume.  A clone is a volume that is a writable snapshot of another volume.  Initially, the clone and its parent share the same storage; more storage space is consumed only as one volume or the other changes.  If a specific snapshot name within the parent volume is provided, it is chosen as the parent snapshot.  Otherwise, the filer will create a new, distinctively- named snapshot in the parent volume for that purpose. The parent snapshot is locked in the parent volume, preventing its deletion until the clone is either destroyed or split from the parent using the Start-NcVolCloneSplit command.  This command fails if the chosen parent volume is currently involved in a split operation.

---

### Related Links
* [Start-NcVolCloneSplit](Start-NcVolCloneSplit)

---

### Examples
> Example 1

New-NcVolClone vol2clone vol2
Create a clone 'vol2clone' of volume 'vol2'.

Name      State  TotalSize Used Available Dedupe Aggregate Vserver
----      -----  --------- ---- --------- ------ --------- -------
vol2clone online   11.0 GB   5%   10.4 GB False  aggr1     vserver1

---

### Parameters
#### **CloneVolume**
Desired name of the clone.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|NewName<br/>Clone|

#### **ParentVolume**
Name of the parent flexible volume for the clone.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |2       |true (ByPropertyName)|Name<br/>Parent|

#### **SpaceReserve**
Specifies the type of volume guarantee for the clone.  Possible values: none, file, volume.  If this argument is not provided, then guarantee type is inherited from parent volume.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Reserve|

#### **JunctionPath**
The Junction Path at which this volume is to be mounted.  The fully-qualified pathname in the owning vserver's namespace at which a volume is mounted.  Note that this pathname may itself contain junctions, one for each volume (other than the namespace root volume) that provides storage along the pathname's length.  As with all fully-qualified pathnames, this string must begin with '/'.  In addition, it must not end with '/'.  An example of a valid junction path is: '/user/my_volume'.  Only one volume can be mounted at any given junction path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **JunctionActive**
This field indicates whether the mounted volume is accessible.  The default is true.  If the mounted junction path is not accessible, the volume does not appear in the owning virtual server's namespace.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **VolumeType**
The type of the volume to be created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **QosPolicyGroup**
The QoS Policy Group Name that is to be associated with this FlexClone volume in order to enforce Service Level Objectives (SLO).

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|QosPolicyGroupName|

#### **CachingPolicy**
The caching policy that is to be associated with this volume.
This policy is used to make caching decisions for this volume. If a caching policy is not assigned to this volume, the system uses the caching policy that is assigned to the containing Vserver. If a caching policy is not assigned to the containing Vserver, the system uses the default cluster-wide policy.
The possible options for this value are:
uncached                - Caches nothing.
metadata                - Caches indirect blocks and system metafiles.
random-read             - Caches indrect blocks, system metafiles, and randomly read user data.
random-read-write       - Caches normal data blocks and any blocks read as a result of random writes.
all-read                - Caches normal data blocks and any sequentially read user data blocks.
all-read-random-write   - Caches normal data blocks and any blocks read as a result of random writes or sequential reads.
all                     - Caches everything.
default                 - The default cluster-wide policy, which is random-read by default.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Option**
The caching policy that is to be associated with this volume.
This policy is used to make caching decisions for this volume. If a caching policy is not assigned to this volume, the system uses the caching policy that is assigned to the containing Vserver. If a caching policy is not assigned to the containing Vserver, the system uses the default cluster-wide policy.
The possible options for this value are:
uncached                - Caches nothing.
metadata                - Caches indirect blocks and system metafiles.
random-read             - Caches indrect blocks, system metafiles, and randomly read user data.
random-read-write       - Caches normal data blocks and any blocks read as a result of random writes.
all-read                - Caches normal data blocks and any sequentially read user data blocks.
all-read-random-write   - Caches normal data blocks and any blocks read as a result of random writes or sequential reads.
all                     - Caches everything.
default                 - The default cluster-wide policy, which is random-read by default.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Comment**
A description for the clone volume being created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Name of the Vserver in which the clone will be created.
This parameter is available in ONTAP 8.4 and later. This can not be used in conjunction with the UID or GID parameters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentVserver**
Parent flexible volume's Vserver.
This parameter is available in ONTAP 8.4 and later. This can not be used in conjunction with the UID or GID parameters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VserverDrProtection**
Specifies the protection type for the volume in a Vserver DR setup.
There are two supported values:
'protected' - Volume will be replicated to the destination,
'unprotected' - Volume will not be replicated to the destination.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uid**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Gid**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Style**
The style of the volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ParentSnapshot**
Name of the snapshot within the parent volume that is to serve as the parent snapshot for the clone.  If not provided, the filer will create a new snapshot named 'clone_parent_<UUID>' (using a freshy-generated UUID) in the parent volume for this purpose.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |3       |true (ByPropertyName)|Snapshot|

#### **SnaplockType**
Specifies the type of Snaplock volume to be created.Possible values - 'compliance' 'non-snaplock' or 'enterprise'. This Parameter is supported in Rest Only.
Valid Values:

* compliance
* enterprise
* non-snaplock

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MatchParentStorageTier**
Specifies whether the FlexClone volume splits the data blocks by matching its parent storage tier. This option is applicable only if the tiering policy and the tiering minimum cooling days of the parent volume and the FlexClone volume are the same.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-clone-create
Family: vserver

---

### Syntax
```PowerShell
New-NcVolClone [-CloneVolume] <String> [-ParentVolume] <String> [-SpaceReserve <String>] [-JunctionPath <String>] [-JunctionActive <Boolean>] [-VolumeType <String>] [-QosPolicyGroup <String>] 
```
```PowerShell
[-CachingPolicy <String>] [-Option <String[]>] [-Comment <String>] [-Vserver <String>] [-ParentVserver <String>] [-VserverDrProtection <String>] [-Uid <Int64>] [-Gid <Int64>] [-VserverContext 
```
```PowerShell
<String>] [-Style <String>] [-Controller <NcController[]>] [[-ParentSnapshot] <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [-MatchParentStorageTier <Boolean>] [<CommonParameters>]
```
