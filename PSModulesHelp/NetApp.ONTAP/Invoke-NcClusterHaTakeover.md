Invoke-NcClusterHaTakeover
--------------------------

### Synopsis
Initiate a takeover of the storage partner.

---

### Description

Initiate a takeover of the storage partner. Takeover is done asynchronously; status may be monitored by calling the Get-NcClusterHa and examining the state field. If automatic giveback is enabled then control will be returned to storage partner once it boots up.

---

### Related Links
* [Invoke-NcClusterHaGiveback](Invoke-NcClusterHaGiveback)

---

### Examples
> Example 1

```PowerShell
Invoke-NcClusterHaTakeover fas2070cluster01-01
Start takeover of partner storage resources of node fas2070cluster01-01.
```

---

### Parameters
#### **Node**
The name of the node which is doing a takeover of its partner.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
If specified, force a node to take over its storage partner even though the node detects an error that would otherwise prevent a takeover. For example, normally, if a detached or faulty interconnect cable between the nodes (ha pair) causes the nodes NVRAM contents to be unsynchronized, takeover is disabled. However, this will allow the node to take over its storage partner despite the unsynchronized NVRAM contents. This is dangerous and can lead to data corruption; in almost all cases, do not use this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Immediate**
If specified, cause the takeover to be initiated immediately.  The taken over node, if up, does not get to shut things down in an orderly manner so the takeover of the resources takes longer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowVersionMismatch**
If specified, allow takeover if the partner was running an incompatible operating system version and was cleanly halted.  This option is used for non-disruptive upgrade (NDU).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowDiskInventoryMismatch**
If specified, allow takeover if disk inventory information is mismatched for non root volume disks. If mismatched, local node performance could degrade as what appears to be missing disks are rebuilt. NOTE:: When using this option and if some of partner's file system disks are not visible to local node, then after giveback those missing disks can create new failed aggregate with same name. So, if any aggregate is offline after giveback with same name then using "Remove-NcAggr", you have to destroy that offline aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BypassOptimization**
The bypass-optimization option determines whether or not an optimized negotiated takeover is run. Optimized negotiated takeover refers to the serial relocation of SFO aggregates to the taking over node, prior to a negotiated takeover. This is an optimization because it reduces per-aggregate client outage times. If the bypass-optimization option is set to true, then the takeover optimization is bypassed, and the normal takeover code path is executed. The default value for this option is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipLifMigration**
This option results in migration of LIFs to be skipped prior to a takeover. However if LIFs on this node are configured for failover, those LIFs may still failover after the reboot has occurred. The default value is `false` and hence the default behavior is to synchronously migrate data and cluster management LIFs away from the node prior to its takeover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideVetoes**
The override-vetoes option ignores any vetoes occuring as part of a negotiated takeover and allows the takeover operation to continue. The default value is `false` which means the operation fails by default if a veto is encountered.
This parameter is available in ONTAP 9.5 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cf
API: cf-takeover
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcClusterHaTakeover [-Node] <String> [-Force] [-Immediate] [-AllowVersionMismatch] [-AllowDiskInventoryMismatch] [-BypassOptimization] [-SkipLifMigration] [-OverrideVetoes <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
