Get-NcMetroclusterInterconnectIpfo
----------------------------------

### Synopsis
Get details about metrocluster interconnect ipfo

---

### Description

Get details about metrocluster interconnect ipfo.

---

### Related Links
* [Get-NcMetrocluster](Get-NcMetrocluster)

---

### Examples
> Example 1

```PowerShell
Get-NcMetroclusterInterconnectIpfo
Get ipfo objects from the cluster

IsEnabled                        : False
IsTimeoutTriggerEnabled          : False
NcController                     : 10.63.1.234
NodeName                         : aparajir-vsim1
TimeoutTriggerValue              : 0
IsEnabledSpecified               : True
IsTimeoutTriggerEnabledSpecified : True
TimeoutTriggerValueSpecified     : True

IsEnabled                        : False
IsTimeoutTriggerEnabled          : False
NcController                     : 10.63.1.234
NodeName                         : aparajir-vsim2
TimeoutTriggerValue              : 0
IsEnabledSpecified               : True
IsTimeoutTriggerEnabledSpecified : True
TimeoutTriggerValueSpecified     : True

```

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Name<br/>Node|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectIpfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[MetroclusterInterconnectIpfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterInterconnectIpfo

---

### Notes
Category: metrocluster
API: metrocluster-interconnect-ipfo-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterInterconnectIpfo [[-NodeName] <String[]>] [-Attributes <MetroclusterInterconnectIpfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectIpfo -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterInterconnectIpfo -Query <MetroclusterInterconnectIpfo> [-Attributes <MetroclusterInterconnectIpfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
