Get-NcMetroclusterInterconnectAdapter
-------------------------------------

### Synopsis
Get a list of MetroCluster interconnect adapter objects.

---

### Description

Get a list of MetroCluster interconnect adapter objects.

---

### Related Links
* [Get-NcMetroclusterInterconnect](Get-NcMetroclusterInterconnect)

* [Get-NcMetroclusterInterconnectAdapterSwitch](Get-NcMetroclusterInterconnectAdapterSwitch)

---

### Parameters
#### **Node**
One or more metrocluster configured nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Adapter**
One or more metrocluster interconnect adapters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|AdapterName|

#### **Type**
One or more types of interconnect adapters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |3       |true (ByPropertyName)|AdapterType|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterInterconnectAdapter object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterInterconnectAdapter -Template" to get the initially empty MetroclusterInterconnectAdapter object.  If not specified, all data is returned for each object.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectAdapter]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty MetroclusterInterconnectAdapter object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterInterconnectAdapter object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterInterconnectAdapter -Template" to get the initially empty MetroclusterInterconnectAdapter object.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectAdapter]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterInterconnectAdapter

---

### Notes
Category: metrocluster
API: metrocluster-interconnect-adapter-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterInterconnectAdapter [[-Node] <String[]>] [[-Adapter] <String[]>] [[-Type] <String[]>] [-Attributes <MetroclusterInterconnectAdapter>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectAdapter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectAdapter -Query <MetroclusterInterconnectAdapter> [-Attributes <MetroclusterInterconnectAdapter>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
