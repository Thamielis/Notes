New-NcVol
---------

### Synopsis
Create a volume.

---

### Description

Create a volume.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcVol](Get-NcVol)

---

### Examples
> Example 1

New-NcVol vol2 aggr1 10g -JunctionPath /vol2
Create a new volume 'vol2'.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   10.0 GB   5%    9.5 GB False  aggr1     vserver1

---

### Parameters
#### **Name**
Name of the volume to create.  The volume name can contain letters, numbers, and the underscore character (_), but the first character must be a letter or an underscore.  The volume names must be unique within a vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Aggregate**
The name of the aggregate in which to create the new flexible volume.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Aggr   |

#### **Size**
The initial size of the new flexible volume.  The format to use is: <number> k|m|g|t where "k" means kilobytes, "m" means megabytes, "g" means gigabytes, and "t" means terabytes.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **JunctionPath**
The Junction Path at which this volume is to be mounted.  The fully-qualified pathname in the owning vserver's namespace at which a volume is mounted.  The pathname is case insensitive and must be unique within a vserver's namespace.  Note that this pathname may itself contain junctions, one for each volume (other than the namespace root volume) that provides storage along the pathname's length.  As with all fully-qualified pathnames, this string must begin with '/'.  In addition, it must not end with '/'.  An example of a valid junction path is: '/user/my_volume'.  Only one volume can be mounted at any given junction path.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |4       |true (ByPropertyName)|Path   |

#### **Comment**
A description for the volume being created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AntivirusOnAccessPolicy**
The name of the Anti-Virus On-Access policy. The default policy name is 'default'.  If not specified when creating a volume, the Anti-Virus On-Access Policy is inherited from the owning vserver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExportPolicy**
The name of the Export Policy to be used by NFS/CIFS protocols.  The default policy name is 'default'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FlexCacheCachePolicy**
The name of the FlexCache cache policy.  The default policy name is 'default'.  This policy applies only to FlexCache volumes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FlexCacheFillPolicy**
The name of the FlexCache prefill policy.  The default policy name is 'default'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FlexCacheOriginVolume**
The name of the origin volume that contains the authoritative data.  This field is valid only for a FlexCache volume. The origin volume must belong to the same vserver that owns this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GroupId**
The UNIX group ID for the volume.  The default value is 0 ('root').

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IndexDirectoryFormat**
If true, index directory format is enabled.  Default: false.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **JunctionActive**
This field indicates whether the mounted volume is accessible.  The default is true.  If the mounted junction path is not accessible, the volume does not appear in the owning virtual server's namespace.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **MaxDirectorySize**
The maximum size (in bytes) to which any directory in this volume can grow.  The default setting is 100 MBytes and it allows the directory to hold up to approximately 3,000,000 files.  The number of files that the directory actually can hold varies depending on such things as the length of the names and whether it needs to use double-byte UNICODE characters.  Most users should not need to change this field's default setting.  It is useful for environments where system users may grow a directory to a size that starts impacting system performance.  When a user tries to create a file in a directory that is at the limit, the system returns an error and fails the create.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Decimal]`|false   |named   |false        |

#### **NvFailEnabled**
If true, the controller performs additional work at boot and takeover times if it finds that there has been any potential data loss in this volume due to an NVRAM failure.  The volume would be put in a special state called 'in-nvfailed-state' such that protocol access is blocked.  This will cause the client applications to crash and thus prevent access to stale data on the volume.  To get out of this situation, the admin needs to manually clear the 'in-nvfailed-state' on the volume.  By default, this value is false.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SecurityStyle**
The security style associated with this volume.  Possible values: 
mixed - Mixed-style security
ntfs  - NTFS/Windows-style security
unix  - Unix-style security (default setting
Security styles don't apply to GX-striped data volumes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapshotPolicy**
The name of the snapshot policy.  The default policy name is 'default'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SpaceReserve**
Specifies the type of volume guarantee the new volume will use.  Possible values: none, file, volume.  If this argument is not provided, the default volume guarantee type is volume.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |false        |Reserve<br/>SpaceGuarantee|

#### **State**
Desired state of the volume after it is created.  Possible values: online, restricted, offline.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
The type of the volume to be created. Possible values:
rw - read-write volume (default setting)
ls - load-sharing volume
dp - data-protection volume
dc - data-cache volume (FlexCache)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UnixPermissions**
Unix permission bits in octal string format.  It's similar to Unix style permission bits: for security style "mixed" or "unix", the default setting of '0700' gives read/write/execute permissions to owner and no permissions to group and other users.  For security style "ntfs", the default setting of '0000' gives no permissions to owner, group and other users.  It consists of 4 octal digits derived by adding up bits 4, 2 and 1.  Omitted digits are assumed to be zeros.  First digit selects the set user ID(4), set group ID (2) and sticky (1) attributes.  The second digit selects permission for the owner of the file: read (4), write (2) and execute (1); the third selects permissions for other users in the same group; the fourth for other users not in the group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserId**
The UNIX user ID for the volume. The default value is 0 ('root').

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **VserverRoot**
If true, this volume is the namespace root volume of the vserver which owns this volume.  The default value is false.  When creating a volume, if this field is set to true, the new volume is to become the new namespace root volume of the vserver.  This field can be used in a recovery scenario in which the namespace root volume of the vserver becomes unrecoverable.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SnapshotReserve**
The percentage of disk space that has to be set aside as reserve for snapshot usage. The default value is 5. Range : [0..90]

|Type     |Required|Position|PipelineInput|Aliases               |
|---------|--------|--------|-------------|----------------------|
|`[Int32]`|false   |named   |false        |PercentSnapshotReserve|

#### **VmAlignSector**
The Virtual Machine alignment 512 byte sector number. All files created with the suffix specified in the VmAlignSuffix parameter will have zero-filled <512 * VmAlignSector> bytes data at the beginning so that it's actual data starts at a different offset instead of zero. This is done so that the read & writes to such files are aligned to WAFL's 4k block boundary.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **VmAlignSuffix**
The Virtual Machine alignment suffix. The suffix such as '.xyz' is used to identify the files which needs to be aligned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **QosPolicyGroup**
The QoS Policy Group Name that is to be associated with this volume in order to enforce Service Level Objectives (SLO).  If you do not assign a QoS policy group to a volume, the system will not monitor and control the traffic to it.  NOTE: "none" is a reserved keyword for deleting the association of the volume with a QoS policy group. Specifying "none" as a the QoS policy group during volume creation will have no effect.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **ExcludedFromAutobalance**
If specified, the volume is excluded from Auto Balance aggregate processing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Language**
Specifies the language to use for the new volume via a language code.   The default language is the one used by
the vserver's root volume.  Available language codes are:
'C'            ... POSIX,
'ar'           ... Arabic,
'cs'           ... Czech,
'da'           ... Danish,
'de'           ... German,
'en'           ... English,
'en_US'        ... English (US),
'es'           ... Spanish,
'fi'           ... Finnish,
'fr'           ... French,
'he'           ... Hebrew,
'hr'           ... Croatian,
'hu'           ... Hungarian,
'it'           ... Italian,
'ja'           ... Japanese euc-j*,
'ja_v1'        ... Japanese euc-j,
'ja_JP.PCK'    ... Japanese PCK (sjis)*,
'ja_JP.932'    ... Japanese cp932*,
'ja_JP.PCK_v2' ... Japanese PCK (sjis),
'ko'           ... Korean,
'no'           ... Norwegian,
'nl'           ... Dutch,
'pl'           ... Polish,
'pt'           ... Portuguese,
'ro'           ... Romanian,
'ru'           ... Russian,
'sk'           ... Slovak,
'sl'           ... Slovenian,
'sv'           ... Swedish,
'tr'           ... Turkish,
'zh'           ... Simplified Chinese,
'zh.GBK'       ... Simplified Chinese (GBK),
'zh_TW'        ... Traditional Chinese euc-tw,
'zh_TW.BIG5'   ... Traditional Chinese Big 5
To use UTF-8 as the NFS character set, append '.UTF-8'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EfficiencyPolicy**
Specifies the efficiency policy to use for this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CacheRetentionPriority**
The cache retention priority that is to be associated with the volume. This policy decides how long blocks of a volume will be cached in flash pool once they become cold.
There are three supported values:
'low' - Cache the cold blocks for the lowest time.
'normal' - Cache the cold blocks for the default time.
'high' - Cache the cold blocks for the highest time.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SpaceSlo**
Specifies the space Service Level Objective for space management for the volume.  The space SLO value is used to enforce existing volume settings so that sufficient space is set aside on the aggregate to meet the space SLO. This parameter is not supported on Infinite Volumes.
The default setting is none.
There are three supported values: 'none', 'thick' and 'semi-thick'.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverDrProtection**
Specifies the protection type for the volume in a Vserver DR setup.
There are two supported values:
'protected' - Volume will be replicated to the destination,
'unprotected' - Volume will not be replicated to the destination.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Encrypt**
Specifies whether a volume is encrypted or not.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ExtentSize**
This field specifies the default extent size for the volume. In case of WAFL volumes, this option would always be set to 4K. For MetaWAFL volumes, the possible values are as follows. Possible values: '4K' ... 4K, '8K' ... 8K, '16K' ... 16K, '32K' ... 32K
This parameter is available in ONTAP 9.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TieringPolicy**
The tiering policy that is to be associated with the volume. This policy decides whether the blocks of a volume will be tiered to the capacity tier. The possible values for this field are: snapshot-only - This policy allows tiering of only the volume snapshot copies not associated with the active file system. none - Volume blocks will not be tiered to the capacity tier backup - On DP volumes this policy allows all transferred user data blocks to start in the capacity tier. Default tiering policy is snapshot-only. This parameter is not supported for Infinite Volumes.
This parameter is available in ONTAP 9.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **QosAdaptivePolicyGroupName**
The QoS Policy Group Name that is to be associated with this volume in order to enforce Service Level Objectives (SLO). If you do not assign a QoS policy group to a volume, the system will not monitor and control the traffic to it.
NOTE: "none" is a reserved keyword for deleting the association of the volume with a QoS policy group. Specifying "none" as a the QoS policy group during volume creation will have no effect. This parameter is not supported on Infinite Volumes.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Analytics**
Use this to set Analytics attributes. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Analytics.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Analytics]`|false   |named   |false        |

#### **Autosize**
Use this to set the autosize attribute of a volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.AutosizeAttribute.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.AutosizeAttribute]`|false   |named   |false        |

#### **Clone**
Use this to set clone property. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Clone.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Clone]`|false   |named   |false        |

#### **Efficiency**
Use it to set efficiency of a volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Efficiency.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Efficiency]`|false   |named   |false        |

#### **Encryption**
Specifies the encryption attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Encryption.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Files**
Specifies the files attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Files.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Files]`|false   |named   |false        |

#### **Guarantee**
Specifies the guarantee attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.RestAttributes.Guarantee.

|Type                                                 |Required|Position|PipelineInput|
|-----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.RestAttributes.Guarantee]`|false   |named   |false        |

#### **Movement**
Specifies the movement attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Movement.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Movement]`|false   |named   |false        |

#### **Nas**
Specifies the nas attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Nas.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Nas]`|false   |named   |false        |

#### **Snaplock**
Specifies the snaplock attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Snaplock.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Snaplock]`|false   |named   |false        |

#### **Snapshot_Policy**
Specifies the snapshot_policy attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.SnapshotPolicy.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.SnapshotPolicy]`|false   |named   |false        |

#### **Space**
Specifies the space attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Space.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Space]`|false   |named   |false        |

#### **Qos**
Specifies the Qos attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.Qos.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.Qos]`|false   |named   |false        |

#### **CloudRetrievalPolicy**
Specifies the cloud retrieval policy attribute to use for this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConsistencyGroup**
Specifies the cloud retrieval policy attribute to use for this volume. To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.ConsistencyGroup.

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.ConsistencyGroup]`|false   |named   |false        |

#### **SnaplockType**
Specifies the type of Snaplock volume to be created.Possible values - 'compliance' or 'enterprise'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

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

#### **StorageService**
Name of the storage service with which to associate the creation of a constituent of an Infinite Volume.  
This parameter is required for the creation of constituents of an Infinite Volume that supports storage services. If the storage service does not exist before creating the constituent, it will be automatically created. Clients can query for the 'IsManagedByService' field to determine if an Infinite Volume supports storage services.
This parameter is not supported for Flexible Volumes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InfiniteVolume**
If specified, an Infinite Volume will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NamespaceAggregate**
The name of the aggregate in which to create the namespace constituent. If not provided, ONTAP will pick the best available aggregate assigned to the Vserver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxNamespaceConstituentSize**
The maximum size of the namespace constituent.  The default value is 10TB.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxDataConstituentSize**
The maximum size of each data constituent in bytes.  The default value is determined by checking the maximum FlexVol size setting on all nodes used by the Infinite Volume. The smallest value found is chosen as the default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NamespaceMirrorAggregate**
Specifies an array of names of aggregates to be used for Infinite Volume namespace mirror constituents. If this input is not specified all the aggregates assigned to the Vserver are used. If the arguments StorageService and EnableSnapdiff are both set, a value must be provided.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DataAggregate**
Specifies an array of names of aggregates to be used for Infinite Volume data constituents. If this input is not specified all the aggregates assigned to the Vserver are used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **EnableSnapdiff**
If specified, the namespace mirrors will be created for Snapdiff use.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ConstituentRole**
This field specifies the role of a constituent within an Infinite Volume. This field is only supported for Infinite Volume constituents and this API will fail if no value is passed for an Infinite Volume constituent.  Possible values: 'namespace', 'data', 'ns_mirror'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AggregateList**
Specifies an array of names of aggregates to be used for FlexGroup constituents. Each entry in the array will create a constituent on the specified aggregate. An aggregate may be specified multiple times to have multiple constituents created on it. This parameter is only supported for FlexGroups.
This parameter is available in ONTAP 9.1 and later.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|true    |2       |true (ByPropertyName)|AggrList|

#### **FlexGroupVolume**
If specified, an FlexGroup Volume will be created.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsFlexGroupVolume|

#### **AggregateMultiplier**
Specifies the number of times to iterate over the aggregates listed with the -aggr-list parameter when creating a FlexGroup. The aggregate list will be repeated the specified number of times. For example, if the aggr-list is "aggr1,aggr2" and the aggr-list-multiplier is 2 four constituents to be created in the order aggr1, aggr2, aggr1, aggr2. The number of constituents created on a node contributes to the maximum volume limit per node, which cannot be exceeded. Default aggr-list-multiplier is 4. This parameter is only supported for FlexGroups.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[UInt64]`|false   |named   |true (ByPropertyName)|AggrListMultiplier|

#### **AutoProvisionAs**
Use this parameter to automatically select existing aggregates for volume provisioning. Note that the fastest aggregate type with at least one aggregate on each node of the cluster will be selected. Possible values: flexgroup' - Provision a FlexGroup.
This parameter is available in ONTAP 9.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Async**

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsAsync|

#### **StorageEfficiencyMode**
This field specifies the storage efficiency mode for the volume. The 'default' mode will set 8k adaptive compression on the volume. The 'efficient' mode will set auto adaptive compression on the volume. The default setting is 'default'. This field is valid only on AFF platforms. Possible values: 'default','efficient'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsynchronousDirectoryDelete**
Configuration for asynchronous directory delete from the client.To instantiate the please create object using New-Object DataONTAP.C.Types.Volume.AsynchronousDirectoryDelete. This Parameter is Supported with Rest Only

|Type                                                    |Required|Position|PipelineInput|
|--------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.AsynchronousDirectoryDelete]`|false   |named   |false        |

#### **AntiRansomwareState**
The Anti-ransomware state of the volume. Possible values: 'enabled','disabled','dry_run'
Valid Values:

* disabled
* enabled
* dry_run

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TieringSupport**
This parameter specifies whether or not FabricPools are selected when provisioning a FlexGroup without specifying Aggregate. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **TieringMinCoolingDays**
This parameter specifies the minimum number of days that user data blocks of the volume must be cooled before they can be considered cold and tiered out to the cloud tier. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **TieringObjectTags**
This parameter specifies the minimum number of days that user data blocks of the volume must be cooled before they can be considered cold and tiered out to the cloud tier. This Parameter is Supported with Rest Only

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |named   |false        |

#### **Style**
The style of the volume. This Parameter is Supported with Rest Only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **ConstituentsPerAggregate**
Specifies the number of times to iterate over the aggregates. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |named   |false        |

#### **UseMiroredAggregate**
Specifies whether mirrored aggregates are selected when provisioning a FlexGroup without specifying  Aggregate. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **AggrssiveReadAheadMode**
Specifies the aggressive readahead mode enabled on the volume. When set to file_prefetch,his feature is only available on FabricPool volumes on FSx for ONTAP and Cloud Volumes ONTAP. Possible values "file_prefetch". This Parameter is Supported with Rest Only
Valid Values:

* file_prefetch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **SnapshotDirectoryAccessEnabled**
This field if true, enables the visible snapshot directory from the client. The snapshot directory will be available in every directory on the volume. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **Tags**
Tags are an optional way to track the uses of a resource. Tag values must be formatted as key:value strings. This Parameter is Supported with Rest Only

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |named   |false        |

#### **OptimizeAggregate**
Specifies whether to create the constituents of the FlexGroup volume on the aggegates specified in the order they are specified. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-create, volume-create-async
Family: vserver

---

### Syntax
```PowerShell
New-NcVol [-Name] <String> [-Aggregate] <String> [[-JunctionPath] <String>] [-Comment <String>] [-AntivirusOnAccessPolicy <String>] [-ExportPolicy <String>] [-FlexCacheCachePolicy <String>] 
```
```PowerShell
[-FlexCacheFillPolicy <String>] [-FlexCacheOriginVolume <String>] [-GroupId <Int32>] [-IndexDirectoryFormat <Boolean>] [-JunctionActive <Boolean>] [-MaxDirectorySize <Decimal>] 
```
```PowerShell
[-NvFailEnabled <Boolean>] [-SecurityStyle <String>] [-SnapshotPolicy <String>] [-SpaceReserve <String>] [-State <String>] [-Type <String>] [-UnixPermissions <String>] [-UserId <Int32>] 
```
```PowerShell
[-VserverRoot <Boolean>] [-SnapshotReserve <Int32>] [-VmAlignSector <Int32>] [-VmAlignSuffix <String>] [-QosPolicyGroup <String>] [-CachingPolicy <String>] [-ExcludedFromAutobalance] 
```
```PowerShell
[-Language <String>] [-EfficiencyPolicy <String>] [-CacheRetentionPriority <String>] [-SpaceSlo <String>] [-VserverDrProtection <String>] [-Encrypt] [-ExtentSize <String>] [-TieringPolicy 
```
```PowerShell
<String>] [-QosAdaptivePolicyGroupName <String>] [-VserverContext <String>] [-Analytics <DataONTAP.C.Types.Volume.Analytics>] [-Autosize <DataONTAP.C.Types.Volume.AutosizeAttribute>] [-Clone 
```
```PowerShell
<DataONTAP.C.Types.Volume.Clone>] [-Efficiency <DataONTAP.C.Types.Volume.Efficiency>] [-Encryption <DataONTAP.C.Types.Volume.Encryption>] [-Files <DataONTAP.C.Types.Volume.Files>] [-Guarantee 
```
```PowerShell
<DataONTAP.C.Types.Volume.RestAttributes.Guarantee>] [-Movement <DataONTAP.C.Types.Volume.Movement>] [-Nas <DataONTAP.C.Types.Volume.Nas>] [-Quota <DataONTAP.C.Types.Volume.Quota>] [-Snaplock 
```
```PowerShell
<DataONTAP.C.Types.Volume.Snaplock>] [-Snapshot_Policy <DataONTAP.C.Types.Volume.SnapshotPolicy>] [-Space <DataONTAP.C.Types.Volume.Space>] [-Tiering <DataONTAP.C.Types.Volume.Tiering>] [-Qos 
```
```PowerShell
<DataONTAP.C.Types.Volume.Qos>] [-CloudRetrievalPolicy <String>] [-ConsistencyGroup <DataONTAP.C.Types.Volume.ConsistencyGroup>] [-SnaplockType <String>] [-Controller <NcController[]>] 
```
```PowerShell
[[-Size] <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-StorageEfficiencyMode <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
New-NcVol [-Name] <String> [-JunctionPath] <String> [-Comment <String>] [-ExportPolicy <String>] [-GroupId <Int32>] [-JunctionActive <Boolean>] [-MaxDirectorySize <Decimal>] [-NvFailEnabled 
```
```PowerShell
<Boolean>] [-SecurityStyle <String>] [-SnapshotPolicy <String>] [-SpaceReserve <String>] [-State <String>] [-Type <String>] [-UnixPermissions <String>] [-UserId <Int32>] [-SnapshotReserve 
```
```PowerShell
<Int32>] [-StorageService <String>] [-InfiniteVolume] [-NamespaceAggregate <String>] [-MaxNamespaceConstituentSize <String>] [-MaxDataConstituentSize <String>] [-NamespaceMirrorAggregate 
```
```PowerShell
<String[]>] [-DataAggregate <String[]>] [-EnableSnapdiff] [-Language <String>] [-VserverContext <String>] [-Analytics <DataONTAP.C.Types.Volume.Analytics>] [-Autosize 
```
```PowerShell
<DataONTAP.C.Types.Volume.AutosizeAttribute>] [-Clone <DataONTAP.C.Types.Volume.Clone>] [-Efficiency <DataONTAP.C.Types.Volume.Efficiency>] [-Encryption <DataONTAP.C.Types.Volume.Encryption>] 
```
```PowerShell
[-Files <DataONTAP.C.Types.Volume.Files>] [-Guarantee <DataONTAP.C.Types.Volume.RestAttributes.Guarantee>] [-Movement <DataONTAP.C.Types.Volume.Movement>] [-Nas 
```
```PowerShell
<DataONTAP.C.Types.Volume.Nas>] [-Quota <DataONTAP.C.Types.Volume.Quota>] [-Snaplock <DataONTAP.C.Types.Volume.Snaplock>] [-Snapshot_Policy <DataONTAP.C.Types.Volume.SnapshotPolicy>] [-Space 
```
```PowerShell
<DataONTAP.C.Types.Volume.Space>] [-Tiering <DataONTAP.C.Types.Volume.Tiering>] [-Qos <DataONTAP.C.Types.Volume.Qos>] [-CloudRetrievalPolicy <String>] [-ConsistencyGroup 
```
```PowerShell
<DataONTAP.C.Types.Volume.ConsistencyGroup>] [-SnaplockType <String>] [-Controller <NcController[]>] [-Size] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-StorageEfficiencyMode <String>] [<CommonParameters>]
```
```PowerShell
New-NcVol [-Name] <String> [-Aggregate] <String> [-JunctionPath] <String> [-Comment <String>] [-AntivirusOnAccessPolicy <String>] [-ExportPolicy <String>] [-FlexCacheCachePolicy <String>] 
```
```PowerShell
[-FlexCacheFillPolicy <String>] [-FlexCacheOriginVolume <String>] [-GroupId <Int32>] [-IndexDirectoryFormat <Boolean>] [-JunctionActive <Boolean>] [-MaxDirectorySize <Decimal>] 
```
```PowerShell
[-NvFailEnabled <Boolean>] [-SecurityStyle <String>] [-SnapshotPolicy <String>] [-SpaceReserve <String>] [-State <String>] [-Type <String>] [-UnixPermissions <String>] [-UserId <Int32>] 
```
```PowerShell
[-VserverRoot <Boolean>] [-SnapshotReserve <Int32>] [-VmAlignSector <Int32>] [-VmAlignSuffix <String>] [-QosPolicyGroup <String>] [-ConstituentRole <String>] [-StorageService <String>] 
```
```PowerShell
[-Language <String>] [-Encrypt] [-ExtentSize <String>] [-TieringPolicy <String>] [-QosAdaptivePolicyGroupName <String>] [-VserverContext <String>] [-Analytics 
```
```PowerShell
<DataONTAP.C.Types.Volume.Analytics>] [-Autosize <DataONTAP.C.Types.Volume.AutosizeAttribute>] [-Clone <DataONTAP.C.Types.Volume.Clone>] [-Efficiency <DataONTAP.C.Types.Volume.Efficiency>] 
```
```PowerShell
[-Encryption <DataONTAP.C.Types.Volume.Encryption>] [-Files <DataONTAP.C.Types.Volume.Files>] [-Guarantee <DataONTAP.C.Types.Volume.RestAttributes.Guarantee>] [-Movement 
```
```PowerShell
<DataONTAP.C.Types.Volume.Movement>] [-Nas <DataONTAP.C.Types.Volume.Nas>] [-Quota <DataONTAP.C.Types.Volume.Quota>] [-Snaplock <DataONTAP.C.Types.Volume.Snaplock>] [-Snapshot_Policy 
```
```PowerShell
<DataONTAP.C.Types.Volume.SnapshotPolicy>] [-Space <DataONTAP.C.Types.Volume.Space>] [-Tiering <DataONTAP.C.Types.Volume.Tiering>] [-Qos <DataONTAP.C.Types.Volume.Qos>] [-CloudRetrievalPolicy 
```
```PowerShell
<String>] [-ConsistencyGroup <DataONTAP.C.Types.Volume.ConsistencyGroup>] [-SnaplockType <String>] [-Controller <NcController[]>] [-Size] <String> [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-StorageEfficiencyMode <String>] [<CommonParameters>]
```
```PowerShell
New-NcVol [-Name] <String> [-AggregateList] <String[]> [-JunctionPath] <String> [-Comment <String>] [-ExportPolicy <String>] [-GroupId <Int32>] [-JunctionActive <Boolean>] [-MaxDirectorySize 
```
```PowerShell
<Decimal>] [-NvFailEnabled <Boolean>] [-SecurityStyle <String>] [-SnapshotPolicy <String>] [-SpaceReserve <String>] [-State <String>] [-Type <String>] [-UnixPermissions <String>] [-UserId 
```
```PowerShell
<Int32>] [-SnapshotReserve <Int32>] [-QosPolicyGroup <String>] [-CachingPolicy <String>] -FlexGroupVolume [-MaxDataConstituentSize <String>] [-Language <String>] [-CacheRetentionPriority 
```
```PowerShell
<String>] [-Encrypt] [-AggregateMultiplier <UInt64>] [-TieringPolicy <String>] [-AutoProvisionAs <String>] [-QosAdaptivePolicyGroupName <String>] [-VserverContext <String>] [-Analytics 
```
```PowerShell
<DataONTAP.C.Types.Volume.Analytics>] [-Autosize <DataONTAP.C.Types.Volume.AutosizeAttribute>] [-Clone <DataONTAP.C.Types.Volume.Clone>] [-Efficiency <DataONTAP.C.Types.Volume.Efficiency>] 
```
```PowerShell
[-Encryption <DataONTAP.C.Types.Volume.Encryption>] [-Files <DataONTAP.C.Types.Volume.Files>] [-Guarantee <DataONTAP.C.Types.Volume.RestAttributes.Guarantee>] [-Movement 
```
```PowerShell
<DataONTAP.C.Types.Volume.Movement>] [-Nas <DataONTAP.C.Types.Volume.Nas>] [-Quota <DataONTAP.C.Types.Volume.Quota>] [-Snaplock <DataONTAP.C.Types.Volume.Snaplock>] [-Snapshot_Policy 
```
```PowerShell
<DataONTAP.C.Types.Volume.SnapshotPolicy>] [-Space <DataONTAP.C.Types.Volume.Space>] [-Tiering <DataONTAP.C.Types.Volume.Tiering>] [-Qos <DataONTAP.C.Types.Volume.Qos>] [-CloudRetrievalPolicy 
```
```PowerShell
<String>] [-ConsistencyGroup <DataONTAP.C.Types.Volume.ConsistencyGroup>] [-Controller <NcController[]>] [-Size] <String> [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-StorageEfficiencyMode <String>] [<CommonParameters>]
```
```PowerShell
New-NcVol [-Name] <String> [-Aggregate] <String> [-JunctionPath] <String> [-Comment <String>] [-ExportPolicy <String>] [-FlexCacheCachePolicy <String>] [-FlexCacheFillPolicy <String>] 
```
```PowerShell
[-FlexCacheOriginVolume <String>] [-GroupId <Int32>] [-JunctionActive <Boolean>] [-MaxDirectorySize <Decimal>] [-NvFailEnabled <Boolean>] [-SecurityStyle <String>] [-SnapshotPolicy <String>] 
```
```PowerShell
[-SpaceReserve <String>] [-State <String>] [-Type <String>] [-UnixPermissions <String>] [-UserId <Int32>] [-SnapshotReserve <Int32>] [-VmAlignSector <Int32>] [-VmAlignSuffix <String>] 
```
```PowerShell
[-QosPolicyGroup <String>] [-CachingPolicy <String>] [-ExcludedFromAutobalance] -Async [-MaxDataConstituentSize <String>] [-Language <String>] [-EfficiencyPolicy <String>] 
```
```PowerShell
[-CacheRetentionPriority <String>] [-SpaceSlo <String>] [-VserverDrProtection <String>] [-Encrypt] [-TieringPolicy <String>] [-QosAdaptivePolicyGroupName <String>] [-VserverContext <String>] 
```
```PowerShell
[-Analytics <DataONTAP.C.Types.Volume.Analytics>] [-Autosize <DataONTAP.C.Types.Volume.AutosizeAttribute>] [-Clone <DataONTAP.C.Types.Volume.Clone>] [-Efficiency 
```
```PowerShell
<DataONTAP.C.Types.Volume.Efficiency>] [-Encryption <DataONTAP.C.Types.Volume.Encryption>] [-Files <DataONTAP.C.Types.Volume.Files>] [-Guarantee 
```
```PowerShell
<DataONTAP.C.Types.Volume.RestAttributes.Guarantee>] [-Movement <DataONTAP.C.Types.Volume.Movement>] [-Nas <DataONTAP.C.Types.Volume.Nas>] [-Quota <DataONTAP.C.Types.Volume.Quota>] [-Snaplock 
```
```PowerShell
<DataONTAP.C.Types.Volume.Snaplock>] [-Snapshot_Policy <DataONTAP.C.Types.Volume.SnapshotPolicy>] [-Space <DataONTAP.C.Types.Volume.Space>] [-Qos <DataONTAP.C.Types.Volume.Qos>] 
```
```PowerShell
[-CloudRetrievalPolicy <String>] [-ConsistencyGroup <DataONTAP.C.Types.Volume.ConsistencyGroup>] [-SnaplockType <String>] [-Controller <NcController[]>] [-Size] <String> [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-StorageEfficiencyMode <String>] [<CommonParameters>]
```
