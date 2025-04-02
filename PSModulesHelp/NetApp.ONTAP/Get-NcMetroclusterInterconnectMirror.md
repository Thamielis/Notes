Get-NcMetroclusterInterconnectMirror
------------------------------------

### Synopsis
Iterate over a list of metrocluster-interconnect-mirror objects.

---

### Description

Iterate over a list of metrocluster-interconnect-mirror objects.

---

### Related Links
* [Get-NcMetroclusterInterconnectMirrorMultipath](Get-NcMetroclusterInterconnectMirrorMultipath)

* [Get-NcMetroclusterInterconnectAdapter](Get-NcMetroclusterInterconnectAdapter)

---

### Parameters
#### **Node**
Restrict results to one or more nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **PartnerName**
Restrict results to one or more partners.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Partner|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterInterconnectMirror object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcMetroclusterInterconnectMirror -Template" to get the initially empty MetroclusterInterconnectMirror object.  If not specified, all data is returned for each object.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectMirror]`|false   |named   |false        |

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
Specify to get an empty MetroclusterInterconnectMirror object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterInterconnectMirror object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterInterconnectMirror -Template" to get the initially empty MetroclusterInterconnectMirrorobject.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectMirror]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterInterconnectMirror

---

### Notes
Category: metrocluster
API: metrocluster-interconnect-mirror-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterInterconnectMirror [-Node <String[]>] [-PartnerName <String[]>] [-Attributes <MetroclusterInterconnectMirror>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectMirror -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectMirror -Query <MetroclusterInterconnectMirror> [-Attributes <MetroclusterInterconnectMirror>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
