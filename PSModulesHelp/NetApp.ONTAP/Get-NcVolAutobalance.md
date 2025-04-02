Get-NcVolAutobalance
--------------------

### Synopsis
Displays information about Auto Balance Volume operations for an Infinite Volume.

---

### Description

Displays information about Auto Balance Volume operations for an Infinite Volume. this operation is not supported for flexible volumes.

---

### Related Links
* [Start-NcVolAutobalance](Start-NcVolAutobalance)

* [Get-NcAggrAutobalance](Get-NcAggrAutobalance)

---

### Examples
> Example 1

```PowerShell
Get-NcVolAutobalance vol1
Get autobalance information for volume vol1

NcController                : 10.63.1.234
Progress                    :
State                       : completed
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
The name of one or more infinite volumes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Volume<br/>Name|

#### **StorageService**
The storage service of the corresponding volume. Use '-' if no storage service is being used

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                      |
|------------|--------|--------|---------------------|-----------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver<br/>VserverName|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VolumeAutobalanceInfo]`|false   |named   |false        |

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VolumeAutobalanceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAutobalanceInfo

---

### Notes
Category: volume
API: volume-autobalance-get
Family: vserver

---

### Syntax
```PowerShell
Get-NcVolAutobalance [[-VolumeName] <String[]>] [[-StorageService] <String[]>] [-Vserver <String[]>] [-Attributes <VolumeAutobalanceInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolAutobalance -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolAutobalance -Query <VolumeAutobalanceInfo> [-Attributes <VolumeAutobalanceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
