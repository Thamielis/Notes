New-NcFlexcache
---------------

### Synopsis
Create cluster-wide caching for a given volume.

---

### Description

Create cluster-wide caching for a given volume.

Flexcache feature is not supported in ONTAP 8.3, so this cmdlet works in ONTAP 8.2 or lower only.

---

### Related Links
* [Get-NcFlexcache](Get-NcFlexcache)

* [Remove-NcFlexcache](Remove-NcFlexcache)

---

### Examples
> Example 1

New-NcFlexcache -Vserver lemon -OriginVolume vol1
Create a new FlexCache for volume vol1 on vserver lemon.

CacheVolume              CacheState          CacheSize   CachePercentUsed  ConnectionStatus  Vserver
-----------              ----------          ---------   ----------------  ----------------  -------
vol1_cache_aggr1         online                30.4 MB                 0%         ok         lemon

---

### Parameters
#### **Vserver**
Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **OriginVolume**
Origin volume name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Flexcache.FlexcacheInfo

---

### Notes
Category: flexcache
API: flexcache-create
Family: vserver,cluster

---

### Syntax
```PowerShell
New-NcFlexcache [-Vserver] <String> [-OriginVolume] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
