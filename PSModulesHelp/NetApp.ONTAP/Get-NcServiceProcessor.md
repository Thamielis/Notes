Get-NcServiceProcessor
----------------------

### Synopsis
Get service processor information.

---

### Description

Get service processor information.

---

### Related Links
* [Get-NcServiceProcessorImage](Get-NcServiceProcessorImage)

* [Get-NcServiceProcessorNetwork](Get-NcServiceProcessorNetwork)

* [Restart-NcServiceProcessor](Restart-NcServiceProcessor)

---

### Examples
> Example 1

```PowerShell
Get-NcServiceProcessor -Node sfp-cmode-02-01
Get the service processor on node sfp-cmode-02-01.

DeviceRevision               : Not Applicable
FirmwareVersion              : 2.2
IpAddress                    : {10.63.165.55}
IpmiVersion                  : 2.0
IsAutoupdateEnabled          : True
IsIpConfigured               : True
MacAddress                   : 00:a0:98:1d:3c:a4
NcController                 : 10.63.165.62
Node                         : sfp-cmode-02-01
PartNum                      : Not Applicable
SerialNum                    : Not Applicable
Status                       : online
Type                         : sp
IsAutoupdateEnabledSpecified : True
IsIpConfiguredSpecified      : True

```
> Example 2

Get-NcServiceProcessor
Get information on multiple nodes (Works only in ONTAP 8.3 and later)

Node                                Status             Type   IpAddress                     IsAutoupdateEnabled  
----                                ------             ----   ---------                     -------------------  
f3250-215-73-75-01                  online             sp                                           True         
f3250-215-73-75-02                  online             sp                                           True

---

### Parameters
#### **Node**
Node on which the device is located.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Type**
Restrict results to one (or more) type of devices -rlm, sp or none.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Status**
Restrict results to devices in one (or more) state(s) only.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|State  |

#### **IsIPConfigured**
Restrict results to devices which have at least one public IP Address configured.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ServiceProcessorInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcServiceProcessor -Template" to get the initially empty ServiceProcessorInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput        |Aliases          |
|------------------------|--------|--------|---------------------|-----------------|
|`[ServiceProcessorInfo]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ServiceProcessorInfo]`|true    |named   |false        |

#### **Template**
Specify to get an empty ServiceProcessorInfo object for use with advanced queries involving the Attributes attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorInfo

---

### Notes
Category: service processor
API: service-processor-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessor [[-Node] <String[]>] [[-Type] <String[]>] [-Status <String[]>] [-IsIPConfigured] [-Attributes <ServiceProcessorInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessor [-Attributes <ServiceProcessorInfo>] -Query <ServiceProcessorInfo> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessor [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
