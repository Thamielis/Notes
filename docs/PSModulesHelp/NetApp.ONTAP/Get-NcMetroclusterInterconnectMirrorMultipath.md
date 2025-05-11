Get-NcMetroclusterInterconnectMirrorMultipath
---------------------------------------------

### Synopsis
Iterate over a list of metrocluster-interconnect-mirror-multipath objects.

---

### Description

Iterate over a list of metrocluster-interconnect-mirror-multipath objects.

---

### Related Links
* [Get-NcMetroclusterInterconnectMirror](Get-NcMetroclusterInterconnectMirror)

* [Get-NcMetroclusterInterconnectAdapter](Get-NcMetroclusterInterconnectAdapter)

---

### Parameters
#### **Node**
Restrict results to one or more nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **MultipathPolicy**
Restrict results to configurations with specific multipath policies : no_mp, static_mp, dynamic_mp, round_robin

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Partner|

#### **Attributes**
For improved scalability in large clusters, provide MetroclusterInterconnectMirrorMultipath object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcMetroclusterInterconnectMirrorMultipath -Template" to get the initially empty MetroclusterInterconnectMirrorMultipath object.  If not specified, all data is returned for each object.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectMirrorMultipath]`|false   |named   |false        |

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
Specify to get an empty MetroclusterInterconnectMirrorMultipath  object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterInterconnectMirrorMultipath object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterInterconnectMirrorMultipath -Template" to get the initially empty MetroclusterInterconnectMirrorMultipath object.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectMirrorMultipath]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterInterconnectMirrorMultipath

---

### Notes
Category: metrocluster
API: metrocluster-interconnect-mirror-multipath-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterInterconnectMirrorMultipath [-Node <String[]>] [-MultipathPolicy <String[]>] [-Attributes <MetroclusterInterconnectMirrorMultipath>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectMirrorMultipath -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectMirrorMultipath -Query <MetroclusterInterconnectMirrorMultipath> [-Attributes <MetroclusterInterconnectMirrorMultipath>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
