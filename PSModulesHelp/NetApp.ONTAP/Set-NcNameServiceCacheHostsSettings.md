Set-NcNameServiceCacheHostsSettings
-----------------------------------

### Synopsis
Modify the name services hosts cache configuration of the specified Vserver. Omitted (optional) fields will not be changed.

---

### Description

Modify the name services hosts cache configuration of the specified Vserver. Omitted (optional) fields will not be changed.DataONTAP.C.Types.Nameservice.NameServiceCacheHostsSettingsInfo

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Set-NcNameServiceCacheHostsSettings -NegativeTtl 2
IsEnabled                       : True
IsNegativeCacheEnabled          : True
NcController                    : 172.20.4.24
NegativeTtl                     : 2
Ttl                             : 0
VserverName                     : vs1
IsEnabledSpecified              : True
IsNegativeCacheEnabledSpecified : True

```

---

### Parameters
#### **IsEnabled**
Is Cache Enabled?

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsNegativeCacheEnabled**
Is Negative Cache Enabled?

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NegativeTtl**
Negative Time to Live

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Ttl**
Time to Live

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **DnsTtlEnabled**
Specifies whether TTL is based on the DNS or host settings. If enabled, TTL from DNS is used. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.Nameservice.NameServiceCacheHostsSettingsInfo

---

### Notes
Category: name service
API: name-service-cache-hosts-settings-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNameServiceCacheHostsSettings [-IsEnabled <Boolean>] [-IsNegativeCacheEnabled <Boolean>] [-NegativeTtl <Int64>] [-Ttl <Int64>] [-VserverContext <String>] [-DnsTtlEnabled <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
