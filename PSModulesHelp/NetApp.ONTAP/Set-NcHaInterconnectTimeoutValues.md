Set-NcHaInterconnectTimeoutValues
---------------------------------

### Synopsis
Change high-availability interconnect software timeout values of the selected node

---

### Description

Change high-availability interconnect software timeout values of the selected node

---

### Related Links
* [Get-NcHaInterconnectTimeoutValues](Get-NcHaInterconnectTimeoutValues)

---

### Examples
> Example 1

```PowerShell
Set-NcHaInterconnectTimeoutValues -IcTimeout 3100 -OfwTimeout 1100 -UlpTimeout 255 -NodeName sapanj-vsim3
Setting the IcTimeout, OfwTimeout values, UplTimeout values for the node sapanj-vsim3

cmdlet Set-NcHaInterconnectTimeoutValues at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
NodeName: sapanj-vsim3

IcTimeout           : 3100
NcController        : 10.238.73.251
NodeName            : sapanj-vsim3
OfwTimeout          : 1100
UlpTimeout          : 255
IcTimeoutSpecified  : True
OfwTimeoutSpecified : True
UlpTimeoutSpecified : True

```

---

### Parameters
#### **IcTimeout**
Interconnect Read/write Timeout (msecs)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **NodeName**
The node to which these timeout values belongs.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **OfwTimeout**
Firmware Read Timeout (msecs).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **IcMviaTimeout**
Interconnect Read/write Timeout For Virtual Platforms(msecs)
This parameter is available in ONTAP 9.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **OfwMviaTimeout**
Firmware Read Timeout (msecs)
This parameter is available in ONTAP 9.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.HaInterconnect.HaInterconnectTimeout

---

### Notes
Category: ha interconnect
API: ha-interconnect-modify-timeout-values
Family: cluster

---

### Syntax
```PowerShell
Set-NcHaInterconnectTimeoutValues [-IcTimeout <Int64>] [-NodeName] <String> [-OfwTimeout <Int64>] [-IcMviaTimeout <Int64>] [-OfwMviaTimeout <Int64>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
