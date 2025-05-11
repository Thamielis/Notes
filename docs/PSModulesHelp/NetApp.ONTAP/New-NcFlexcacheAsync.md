New-NcFlexcacheAsync
--------------------

### Synopsis
Create a cache relationship. This must be run at the cache cluster.

---

### Description

Create a cache relationship. This must be run at the cache cluster.

---

### Examples
> Example 1

```PowerShell
New-NcFlexcacheAsync -OriginVolume vol1 -Volume flecxcache_vol -VserverContext vs0 -OriginVserver vs0
NcController : 172.21.170.35
ErrorCode    :
ErrorMessage :
JobId        :
JobVserver   : vs0
Status       : running
Uuid         : 031ed5aa-c495-11ed-b76a-005056ac4ee3
Message      : Creating FlexCache volume

```

---

### Parameters
#### **OriginVolume**
The name of the origin volume for the cache volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
The name of the cache volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AggrList**
The array of aggregates which are used for FlexGroup constituents. Each aggregate in the array will host at least one FlexGroup constituent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **AggrListMultiplier**
Aggregate list repeat count.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AutoProvisionAs**
Automatically provision as volume of type.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **JunctionPath**
Junction path of the cache volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OriginVserver**
The name of origin Vserver where the origin volume resides. This Parameter is Mandatory in Rest Call while It is Optional in Zapi call

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Size**
Size of cache volume

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **SpaceGuarantee**
The type of space guarantee of this volume in the aggregate. This Parameter is Supported with Rest Only

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UseTieredAggregate**
Specifies whether or not a Fabricpool-enabled aggregate can be used in FlexCache creation. This Parameter is Supported with Rest Only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flexcache.FlexCreateAsyncinfo

---

### Notes
Category: flexcache
API: flexcache-create-async
Family:  vserver

---

### Syntax
```PowerShell
New-NcFlexcacheAsync [-OriginVolume] <String> [-Volume] <String> [-AggrList <String[]>] [-AggrListMultiplier <Int64>] [-AutoProvisionAs <String>] [-JunctionPath <String>] -OriginVserver 
```
```PowerShell
<String> [-Size <Int64>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
