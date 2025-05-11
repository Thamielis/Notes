Start-NcVolAutobalance
----------------------

### Synopsis
Start Auto Balance Volume for an Infinite Volume

---

### Description

Start Auto Balance Volume for an Infinite Volume and rebalance the used data capacity in an Infinite Volume after files are  created. 

Auto Balance Volume moves data between data constituents  of an Infinite Volume. If the Infinite Volume uses storage  services, Auto Balance Volume moves data between data constituents of a storage service in an Infinite Volume. Auto Balance Volume ensures that all data constituents in an Infinite Volume or all data constituents in a storage service of an nfinite Volume have similar amounts of used data capacity.

This API is not supported for Flexible volumes.

---

### Related Links
* [Get-NcAggrAutobalanceVolumeState](Get-NcAggrAutobalanceVolumeState)

* [Get-NcVolAutobalance](Get-NcVolAutobalance)

---

### Examples
> Example 1

```PowerShell
Start-NcVolAutobalance vol1
Start auto-balancing of vol1

NcController                : 10.63.1.234
Progress                    :
State                       : stopped
StorageService              : -
TargetBytes                 : 0
TransferredBytes            : 0
TransferredPercent          : 0
VolumeName                  : vol1
VserverName                 : vs_inf
TransferredPercentSpecified : True

```

---

### Parameters
#### **VolumeName**
Infinite Volume to be rebalanced

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Volume<br/>Name|

#### **StorageService**
The storage service to be rebalanced.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Timeout**
The maximum number of seconds Auto Balance Volume will permit an operation to continue without moving files, before moving the operation to the 'complete' state.
Available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAutobalanceInfo

---

### Notes
Category: volume
API: volume-autobalance-start
Family: vserver

---

### Syntax
```PowerShell
Start-NcVolAutobalance [-VolumeName] <String> [[-StorageService] <String>] [-Timeout <Int64>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
