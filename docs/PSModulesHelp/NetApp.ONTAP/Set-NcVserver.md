Set-NcVserver
-------------

### Synopsis
Modify the attributes of vserver.

---

### Description

Modify the attributes of vserver.

---

### Related Links
* [Update-NcVserver](Update-NcVserver)

---

### Examples
> Example 1

Set-NcVserver vserver3 -AllowedProtocols iscsi,fcp -Comment "Exchange LUNs"
Configure vserver 'vserver3'.

Name                      State      VserverType   Comment
----                      -----      -----------   -------
vserver3                  running    cluster       Exchange LUNs

---

### Parameters
#### **Name**
Name of the vserver to modify.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|VserverName|

#### **Aggregates**
The list of aggregates assigned for volume operations.  These aggregates could be shared for use with other vservers.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **AllowedProtocols**
Allowed protocols.  If conflicting entries are provided as input to AllowedProtocols and DisallowedProtocols list, then those entries will become part of the DisallowedProtocols list.  Possible values: 'nfs', 'cifs', 'fcp', 'iscsi'. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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

#### **DisallowedProtocols**
Disallowed protocols.  If conflicting entries are provided as input to AllowedProtocols and DisallowedProtocols list, then those entries will become part of the DisallowedProtocols list.  Possible values: 'nfs', 'cifs', 'fcp', 'iscsi'. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **MaxVolumes**
The maximum number of volumes that can be created on the vserver, or 'unlimited'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NameMappingSwitch**
Name mapping switch configuration details for the vserver.  Possible values: 'file', 'ldap'.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **NameServerSwitch**
Name server switch configuration details for the vserver.  Possible values: 'nis', 'file', 'ldap'.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **QuotaPolicy**
The name of the quota policy.  The default policy name is 'default'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapshotPolicy**
Snapshot policy setting.  Default is 'default'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **QosPolicyGroup**
Specifies which QoS policy group to apply to the Vserver. The policy group defines measurable service level objectives (SLOs) that apply to the storage objects with which the policy group is associated. If you do not assign a policy group to a Vserver, the system will not monitor and control traffic to it. This parameter is not supported on a Vserver with Infinite Volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Language**
Language to use for the Vserver. Default: C.UTF-8.
Available language codes are:
'c' .............. POSIX
'ar' ............. Arabic
'cs' ............. Czech
'da' ............. Danish
'de' ............. German
'en' ............. English
'en_us' .......... English (US)
'es' ............. Spanish
'fi' ............. Finnish
'fr' ............. French
'he' ............. Hebrew
'hr' ............. Croatian
'hu' ............. Hungarian
'it' ............. Italian
'ja' ............. Japanese euc-j*
'ja_v1' .......... Japanese euc-j
'ja_jp.pck' ...... Japanese PCK (sjis)*
'ja_jp.932' ...... Japanese cp932*
'ja_jp.pck_v2' ... Japanese PCK (sjis)
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
'zh.gbk' ......... Simplified Chinese (GBK)
'zh_tw' .......... Traditional Chinese euc-tw
'zh_tw.big5' ..... Traditional Chinese Big 5

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VolumeDeleteRetentionHours**
The number of hours that a deleted volume should be retained before the delete is completed. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Specifies the default anti_ransomware state of the volumes in the SVM. Possible values: 'disabled', 'enabled', 'dry_run'. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Certificate**
Specifies certificate for incoming TLS connection requests. To create object use New-Object DataONTAP.C.Types.Vserver.Certificate. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.Certificate]`|false   |named   |false        |

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

#### **QosPolicy**
Specifies which QoS policy group to apply to the Vserver. To create object use New-Object DataONTAP.C.Types.Vserver.QosPolicy. This parameter is supported with Rest only.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.QosPolicy]`|false   |named   |false        |

#### **SvmSnapshotPolicy**
Specifies a reference to the Snapshot copy policy. To create object use New-Object DataONTAP.C.Types.Vserver.SnapshotPolicy. This parameter is supported with Rest only.

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.SnapshotPolicy]`|false   |named   |false        |

#### **State**
Specifies SVM State. Possible values: 'starting', 'running', 'stopping', 'stopped', 'deleting'.. This parameter is supported with Rest only.

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
The number of times to retry commands that return with errors that may succeed after a retry

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
API: vserver-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcVserver [-Name] <String> [-Aggregates <String[]>] [-AllowedProtocols <String[]>] [-AntivirusOnAccessPolicy <String>] [-Comment <String>] [-DisallowedProtocols <String[]>] [-MaxVolumes 
```
```PowerShell
<String>] [-NameMappingSwitch <String[]>] [-NameServerSwitch <String[]>] [-QuotaPolicy <String>] [-SnapshotPolicy <String>] [-QosPolicyGroup <String>] [-Language <String>] 
```
```PowerShell
[-VolumeDeleteRetentionHours <Int32>] [-CachingPolicy <String>] [-IsSpaceReportingLogical <Boolean>] [-IsSpaceEnforcementLogical <Boolean>] [-SvmAggregates 
```
```PowerShell
<DataONTAP.C.Types.Vserver.Aggregate[]>] [-AntiRansomwareDefaultVolumeState <String>] [-Certificate <DataONTAP.C.Types.Vserver.Certificate>] [-Cifs <DataONTAP.C.Types.Vserver.Cifs>] [-Fcp 
```
```PowerShell
<DataONTAP.C.Types.Vserver.Fcp>] [-Iscsi <DataONTAP.C.Types.Vserver.Iscsi>] [-Nfs <DataONTAP.C.Types.Vserver.Nfs>] [-Nsswitch <DataONTAP.C.Types.Vserver.Nsswitch>] [-Nvme 
```
```PowerShell
<DataONTAP.C.Types.Vserver.Nvme>] [-QosPolicy <DataONTAP.C.Types.Vserver.QosPolicy>] [-SvmSnapshotPolicy <DataONTAP.C.Types.Vserver.SnapshotPolicy>] [-State <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-AntiRansomwareDefaultVolumeState <String>] 
```
```PowerShell
[<CommonParameters>]
```
