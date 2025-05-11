Get-NcVolLimit
--------------

### Synopsis
Return calculated volume limits, which are based on the current configuration of the vserver.

---

### Description

Return calculated volume limits, which are based on the current configuration of the vserver.  This cmdlet is not supported for Flexible volumes.

---

### Examples
> Example 1

Get-NcVolLimit
Get the calculated volume limits of the current Vserver.

MinInfiniteVolSize             MaxInfiniteVolSize
------------------             ------------------
              2.7G                           5.2G

---

### Parameters
#### **SpaceGuarantee**
Identifies the guarantee type for which the volume limits are calculated. If this argument is not provided, the default space guarantee option is 'volume'. Possible values: 'none', 'volume'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **NamespaceAggregate**
The name of the aggregate in which the namespace constituent would be created. If not provided, ONTAP will pick the best available aggregate assigned to the Vserver.  This parameter is not supported if an Infinite Volume already exists on the Vserver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxNamespaceConstituentSize**
The maximum size of the namespace constituent in bytes.  The default value is 10TB.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxDataConstituentSize**
The maximum size of each data constituent in bytes.  The default value is determined by checking the maximum FlexVol size setting on all nodes used by the Infinite Volume. The smallest value found is chosen as the default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataAggregate**
Specifies an array of names of aggregates that would be used for Infinite Volume data constituents. If this input is not specified all the aggregates assigned to the Vserver are used.  This parameter is not supported if an Infinite Volume already exists on the Vserver.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **EnableSnapdiff**
If specified, the namespace mirrors will be calculated for Snapdiff use.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NamespaceMirrorAggregate**
Specifies an array of names of aggregates that would be used for Infinite Volume namespace mirror constituents. If this parameter is not specified all the aggregates assigned to the Vserver are used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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
* DataONTAP.C.Types.Volume.LimitInfo

---

### Notes
Category: volume
API: volume-get-limits
Family: vserver

---

### Syntax
```PowerShell
Get-NcVolLimit [[-SpaceGuarantee] <String>] [-NamespaceAggregate <String>] [-MaxNamespaceConstituentSize <String>] [-MaxDataConstituentSize <String>] [-DataAggregate <String[]>] 
```
```PowerShell
[-EnableSnapdiff] [-NamespaceMirrorAggregate <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
