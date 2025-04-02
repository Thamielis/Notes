New-NcVserver
-------------

### Synopsis
Create a new vserver.

---

### Description

Create a new vserver.

---

### Related Links
* [Get-NcVserver](Get-NcVserver)

---

### Examples
> Example 1

New-NcVserver vserver4 vserver4vol0 aggr1 -NameServerSwitch ldap -RootVolumeSecurityStyle ntfs -Language en_US.UTF-8
Create a new vserver 'vserver4'.

Name                      State      VserverType   Comment
----                      -----      -----------   -------
vserver4                  running    cluster

---

### Parameters
#### **Name**
The name of the new vserver.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|VserverName|

#### **RootVolume**
Root volume of the vserver.  This volume will be created automatically. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|Root   |

#### **RootVolumeAggregate**
The aggregate on which the root volume will be created. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |3       |true (ByPropertyName)|Aggregate|

#### **NameServerSwitch**
Name server switch configuration details for the vserver.  Possible values for ONTAPI are : 'nis', 'file', 'ldap', Possible values for Rest are : 'nis', 'files', 'ldap', 'Dns'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **RootVolumeSecurityStyle**
Security style of the root volume.  Possible values: 'unix', 'ntfs', 'mixed'.  This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **AntivirusOnAccessPolicy**
Antivirus policy.  Default: default. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
Comment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Language**
Specifies the language to use for the vserver.  Default: C.
Available language codes are: 
'C' .............. POSIX 
'ar' ............. Arabic 
'cs' ............. Czech 
'da' ............. Danish 
'de' ............. German 
'en' ............. English 
'en_US' .......... English (US) 
'es' ............. Spanish 
'fi' ............. Finnish 
'fr' ............. French 
'he' ............. Hebrew 
'hr' ............. Croatian 
'hu' ............. Hungarian 
'it' ............. Italian 
'ja' ............. Japanese euc-j* 
'ja_v1' .......... Japanese euc-j 
'ja_JP.PCK' ...... Japanese PCK (sjis)* 
'ja_JP.932' ...... Japanese cp932* 
'ja_JP.PCK_v2' ... Japanese PCK (sjis) 
'ko' ............. Korean 
'no' ............. Norwegian 
'nl' ............. Dutch 
'pl' ............. Polish 
'pt' ............. Portuguese 
'ro' ............. Romanian 
'ru' ............. Russian 
'sk' ............. Slovak 
'sl' ............. Slovenian 
'sv' ............. Swedish 
'tr' ............. Turkish 
'zh' ............. Simplified Chinese 
'zh.GBK' ......... Simplified Chinese (GBK) 
'zh_TW' .......... Traditional Chinese euc-tw 
'zh_TW.BIG5' ..... Traditional Chinese Big 5
To use UTF-8 as the NFS character set, append '.UTF-8'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NameMappingSwitch**
Name mapping switch configuration details for the vserver.  Possible values: 'file', 'ldap'.  Default: file

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **QuotaPolicy**
Quota policy.  Default: default.  This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapshotPolicy**
Snapshot policy setting.  Default: default.  This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RepositoryVserver**
If specified, create a repository Vserver. A repository Vserver contains a single InfiniteVol. Once a repository Vserver is created in a cluster,  additional  Vservers cannot be created. Conversely, a repository   Vserver cannot be created if non-repository Vservers already exist in a cluster.
This option parameter is available in ONTAP 8.1.1 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Ipspace**
Ipspace name.  Default is 'Default'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Subtype**
Vserver Subtype. This option allows the admin to specify the sub-type of Vserver being created.
The possible options for this value are: default, dp-destination, sync-source, sync-destination
If a Vserver is an MCC destination, then it would have the sub-type sync-source. Vserver of sub-type sync-destination cannot be explicitly created by the admin. When a Vserver of sub-type dp-destination is created, most of the management activities are not allowed. Default value is default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CachingPolicy**
The caching policy associated with the vserver, used to make caching decisions. If a caching policy is not assigned to this Vserver, the default cluster-wide policy is used.
Accepted values are -
 'none' - Does not cache any user data or metadata blocks
 'auto' - Read caches all metadata blocks and randomly read user data blocks; write caches all randomly overwritten user data blocks
 'meta' - Read caches only metadata blocks.
 'random_read' - Read caches all metadata and randomly read user data blocks.
 'random_read_write' -  Read caches all metadata, randomly read and randomly written user data blocks.
 'all_read' - Read caches all metadata, randomly read and sequentially read user data blocks.
 'all_read_random_write' - Read caches all metadata, randomly read, sequentially read and randomly written user data.
 'all' - Read caches all data blocks read and written. It does not do any write caching.
  This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Async**
Specify to perform vserver creation asynchronously.
This operation is supported only in ONTAP 8.4 and later. If this parameter is specified against an unsupported controller, the cmdlet will throw an 'Invalid Argument' error.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsSpaceReportingLogical**
Whether to report space logically on new volume create. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSpaceEnforcementLogical**
Whether to perform logical space accounting on new volume create. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SvmAggregates**
Specifies list of allowed aggregates for SVM volumes. To create object use New-Object DataONTAP.C.Types.Vserver.Aggregate. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Aggregate[]]`|false   |named   |false        |

#### **AntiRansomwareDefaultVolumeState**
Specifies the default anti_ransomware state of the volumes in the SVM. Possible values: 'disabled', 'enabled', 'dry_run'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Cifs**
Specifies Cifs. To create object use New-Object DataONTAP.C.Types.Vserver.Cifs. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Cifs]`|false   |named   |false        |

#### **Fcp**
Specifies Fcp. To create object use New-Object DataONTAP.C.Types.Vserver.Fcp. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Fcp]`|false   |named   |false        |

#### **Iscsi**
Specifies Iscsi. To create object use New-Object DataONTAP.C.Types.Vserver.Iscsi. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Iscsi]`|false   |named   |false        |

#### **Nfs**
Specifies Nfs. To create object use New-Object DataONTAP.C.Types.Vserver.Nfs. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Nfs]`|false   |named   |false        |

#### **Nsswitch**
Specifies Name service switch configuration. To create object use New-Object DataONTAP.C.Types.Vserver.Nsswitch. This parameter is supported with Rest only.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Nsswitch]`|false   |named   |false        |

#### **Nvme**
Specifies Nvme. To create object use New-Object DataONTAP.C.Types.Vserver.Nvme. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Nvme]`|false   |named   |false        |

#### **SvmSnapshotPolicy**
Specifies a reference to the Snapshot copy policy. To create object use New-Object DataONTAP.C.Types.Vserver.SnapshotPolicy. This parameter is supported with Rest only.

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.SnapshotPolicy]`|false   |named   |false        |

#### **SvmIpspace**
Specifies Ipspace. To create object use New-Object DataONTAP.C.Types.Vserver.Ipspace. This parameter is supported with Rest only.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Ipspace]`|false   |named   |false        |

#### **MaxVolumes**
Specifies the limit on maximum number of volumes allowed in the SVM. The value can be either the string 'unlimited' or a number. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Dns**
Specifies Dns. To create object use New-Object DataONTAP.C.Types.Vserver.Dns. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Dns]`|false   |named   |false        |

#### **FcInterface**
Specifies FC Interface for the SVM. To create object use New-Object DataONTAP.C.Types.Vserver.FcInterface. This parameter is supported with Rest only.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.FcInterface[]]`|false   |named   |false        |

#### **IpInterfaces**
Specifies IP interfaces for the SVM. To create object use New-Object DataONTAP.C.Types.Vserver.IpInterfaces. This parameter is supported with Rest only.

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.IpInterfaces[]]`|false   |named   |false        |

#### **Ldap**
Specifies Ldap. To create object use New-Object DataONTAP.C.Types.Vserver.Ldap. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Ldap]`|false   |named   |false        |

#### **Nis**
Specifies Nis. To create object use New-Object DataONTAP.C.Types.Vserver.Nis. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Nis]`|false   |named   |false        |

#### **S3**
Specifies S3. To create object use New-Object DataONTAP.C.Types.Vserver.S3. This parameter is supported with Rest only.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.S3]`|false   |named   |false        |

#### **Ndmp**
Specifies Ndmp. To create object use New-Object DataONTAP.C.Types.Vserver.Ndmp. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Ndmp]`|false   |named   |false        |

#### **Route**
Specifies routes for the SVM. To create object use New-Object DataONTAP.C.Types.Vserver.Route. This parameter is supported with Rest only.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Route[]]`|false   |named   |false        |

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

#### **AntiRansomwareDefaultVolumeState**
The default anti_ransomware state on new volume create. Possible values: 'disabled', 'enabled', 'dry_run'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AntiRansomewareAutoSwitchDurationWithoutNewFileExtension**
This parameter optionally specifies the recent time duration (in days) to be considered during which no new file-extension should be observed in a given volume to automatically switch the anti-ransomware state from learning to enabled. This Parameter is supported in Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |named   |false        |

#### **AntiRansomewareAutoSwitchFromLearingToEnabled**
This property specifies whether anti-ransomware state of the volumes in this SVM are automatically switched by the system. This Parameter is supported in Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **AntiRansomewareAutoSwitchMinimumFileCount**
This parameter optionally specifies the minimum number of newly created files. This Parameter is supported in Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |named   |false        |

#### **AntiRansomewareAutoSwitchMinimumFileExtension**
This parameter optionally specifies the minimum number of new file extensions. This Parameter is supported in Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |named   |false        |

#### **AntiRansomewareAutoSwitchMinimumLearningPeriod**
This parameter optionally specifies the minimum number of days a given volume. This Parameter is supported in Rest Only

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |named   |false        |

#### **AntiRansomwareIncomingWriteThreshold**
This parameter optionally specifies the minimum amount of data (in GB) to be written to a given volume during the learning period to automatically switch the anti-ransomware state. This Parameter is supported in Rest Only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **AntiRansomewareIncomingWriteThrsholdPercent**
This parameter optionally specifies the minimum amount of data (in GB) to be written to a given volume during the learning period to automatically switch the anti-ransomware state. This Parameter is supported in Rest Only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverInfo

---

### Notes
Category: vserver
API: vserver-create
Family: cluster

---

### Syntax
```PowerShell
New-NcVserver [-Name] <String> [[-RootVolume] <String>] [[-RootVolumeAggregate] <String>] [[-NameServerSwitch] <String[]>] [[-RootVolumeSecurityStyle] <String>] [-AntivirusOnAccessPolicy 
```
```PowerShell
<String>] [-Comment <String>] [-Language <String>] [-NameMappingSwitch <String[]>] [-QuotaPolicy <String>] [-SnapshotPolicy <String>] [-RepositoryVserver] [-Ipspace <String>] [-Subtype 
```
```PowerShell
<String>] [-CachingPolicy <String>] [-Async] [-IsSpaceReportingLogical <Boolean>] [-IsSpaceEnforcementLogical <Boolean>] [-SvmAggregates <DataONTAP.C.Types.Vserver.Aggregate[]>] 
```
```PowerShell
[-AntiRansomwareDefaultVolumeState <String>] [-Cifs <DataONTAP.C.Types.Vserver.Cifs>] [-Fcp <DataONTAP.C.Types.Vserver.Fcp>] [-Iscsi <DataONTAP.C.Types.Vserver.Iscsi>] [-Nfs 
```
```PowerShell
<DataONTAP.C.Types.Vserver.Nfs>] [-Nsswitch <DataONTAP.C.Types.Vserver.Nsswitch>] [-Nvme <DataONTAP.C.Types.Vserver.Nvme>] [-SvmSnapshotPolicy <DataONTAP.C.Types.Vserver.SnapshotPolicy>] 
```
```PowerShell
[-SvmIpspace <DataONTAP.C.Types.Vserver.Ipspace>] [-MaxVolumes <String>] [-Dns <DataONTAP.C.Types.Vserver.Dns>] [-FcInterface <DataONTAP.C.Types.Vserver.FcInterface[]>] [-IpInterfaces 
```
```PowerShell
<DataONTAP.C.Types.Vserver.IpInterfaces[]>] [-Ldap <DataONTAP.C.Types.Vserver.Ldap>] [-Nis <DataONTAP.C.Types.Vserver.Nis>] [-S3 <DataONTAP.C.Types.Vserver.S3>] [-Ndmp 
```
```PowerShell
<DataONTAP.C.Types.Vserver.Ndmp>] [-Route <DataONTAP.C.Types.Vserver.Route[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-AntiRansomwareDefaultVolumeState <String>] [<CommonParameters>]
```
