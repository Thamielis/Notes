Set-NcFlexcachePolicy
---------------------

### Synopsis
Modify the attributes of FlexCache cache policy object.

---

### Description

Modify the attributes of FlexCache cache policy object.

The cmdlet works in the vserver context in ONTAP versions prior to 8.2.  in ONTAP 8.2 and later, the cmdlet works in the cluster context.
Flexcache feature is not supported in ONTAP 8.3, so this cmdlet works in ONTAP 8.2 or lower only.

---

### Related Links
* [Get-NcFlexcachePolicy](Get-NcFlexcachePolicy)

* [Remove-NcFlexcachePolicy](Remove-NcFlexcachePolicy)

---

### Examples
> Example 1

Set-NcFlexcachePolicy -Name test -FileTimeToLive 10
Set the FlexCache cache policy file time to live.

CachePolicyName                 TimeToLiveFilesTS  TimeToLiveDirectoriesTS Vserver
---------------                 -----------------  ----------------------- -------
test                                     00:00:10                 00:00:30 lemon

---

### Parameters
#### **Name**
The name of the FlexCache Cache Policy to modify. The maximum length is 255 characters.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|CachePolicyName|

#### **FileTimeToLive**
The time, in seconds, that attributes and data of a file are fetched from the Cache volume.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TimeToLiveFiles|

#### **DirTimeToLive**
The time, in seconds, that attributes and data of a directory are fetched from the Cache volume.

|Type     |Required|Position|PipelineInput        |Aliases              |
|---------|--------|--------|---------------------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TimeToLiveDirectories|

#### **MetafilesTimeToLive**
The time, in seconds, that attributes and data of an ONTAP Metafile are served from the Cache volume.

|Type     |Required|Position|PipelineInput        |Aliases            |
|---------|--------|--------|---------------------|-------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TimeToLiveMetafiles|

#### **SymbolicTimeToLive**
The time, in seconds, that attributes and data of a Symbolic Link are served from the Cache volume.

|Type     |Required|Position|PipelineInput        |Aliases           |
|---------|--------|--------|---------------------|------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TimeToLiveSymbolic|

#### **OtherTimeToLive**
The time, in seconds, that attributes and data of that file are served from the Cache volume.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|TimeToLiveOther|

#### **DelegationLruTimeout**
The time in seconds since the last use of the delegation.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|DelegLruTimeout|

#### **PreferLocalCache**
If true, data is served from the local cache.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Vserver owning the Flexcache policy.  in ONTAP 8.2 and later this parameter is required.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flexcache.FlexcacheCachePolicyInfo

---

### Notes
Category: flexcache
API: flexcache-cache-policy-modify
Family: vserver, cluster

---

### Syntax
```PowerShell
Set-NcFlexcachePolicy [-Name] <String> [-FileTimeToLive <Int64>] [-DirTimeToLive <Int64>] [-MetafilesTimeToLive <Int64>] [-SymbolicTimeToLive <Int64>] [-OtherTimeToLive <Int64>] 
```
```PowerShell
[-DelegationLruTimeout <Int64>] [-PreferLocalCache <Boolean>] [-Vserver <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
