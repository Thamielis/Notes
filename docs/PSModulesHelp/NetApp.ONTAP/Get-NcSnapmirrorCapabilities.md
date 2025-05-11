Get-NcSnapmirrorCapabilities
----------------------------

### Synopsis
The snapmirror-capabilities-get API returns capabilities information for an endpoint type. It is only supported for the FlexVol endpoint type. It is not supported for FlexGroup, Infinite Volume, or non-Data ONTAP endpoint types. This API is  available in ONTAP 9.3 and later.

---

### Description

The snapmirror-capabilities-get API returns capabilities information for an endpoint type. It is only supported for the FlexVol endpoint type. It is not supported for FlexGroup, Infinite Volume, or non-Data ONTAP endpoint types. This API is  available in ONTAP 9.3 and later.

---

### Examples
> Example 1

PS C:> Get-NcSnapmirrorCapabilities
EndpointType                     : flexvol
IsDpoDestinationEnabled          : False
IsDpoSourceEnabled               : True
IsSnaplockLicensed               : True
NcController                     : 172.26.80.23
SnapmirrorPolicyTypes            : {DataONTAP.C.Types.Snapmirror.SnapmirrorPolicyCapInfo,
                                   DataONTAP.C.Types.Snapmirror.SnapmirrorPolicyCapInfo,
                                   DataONTAP.C.Types.Snapmirror.SnapmirrorPolicyCapInfo}
IsDpoDestinationEnabledSpecified : True
IsDpoSourceEnabledSpecified      : True
IsSnaplockLicensedSpecified      : True

---

### Parameters
#### **EndpointType**
Endpoint type. The only supported value is flexvol. Possible values "flexvol"

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
The attributes of the snapmirror.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[SnapmirrorCapabilitiesInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Specify to get an empty snapmirror-capabilities-info object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a snapmirror-capabilities-info object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapmirrorCapabilities -Template" to get the initially empty snapmirror-capabilities-info object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[SnapmirrorCapabilitiesInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorCapabilitiesInfo

---

### Notes
Category: snapmirror
API: snapmirror-capabilities-get
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorCapabilities [[-EndpointType] <String[]>] [-Attributes <SnapmirrorCapabilitiesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCapabilities -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCapabilities -Query <SnapmirrorCapabilitiesInfo> [-Attributes <SnapmirrorCapabilitiesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
