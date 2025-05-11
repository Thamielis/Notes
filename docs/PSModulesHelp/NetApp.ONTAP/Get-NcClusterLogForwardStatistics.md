Get-NcClusterLogForwardStatistics
---------------------------------

### Synopsis
Get information about log forwarding statistics

---

### Description

Get information about log forwarding statistics

---

### Related Links
* [Get-NcClusterLogForward](Get-NcClusterLogForward)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterLogForwardStatistics
Get forwarding statistics from the cluster

Destination           : 10.72.211.105
Facility              : local1
NcController          : 10.238.49.117
FailureCount          : 0
Log                   : command-history
Node                  : aparajir-vsim2
Port                  : 16640
SuccessCount          : 0
FailureCountSpecified : True
SuccessCountSpecified : True

Destination           : 10.72.211.105
Facility              : local1
NcController          : 10.238.49.117
FailureCount          : 0
Log                   : command-history
Node                  : aparajir-vsim1
Port                  : 16640
SuccessCount          : 0
FailureCountSpecified : True
SuccessCountSpecified : True

```

---

### Parameters
#### **Destination**
Name/IP Address of one or more destination(s) for which you want to retrieve information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more node(s) for which you want to retrieve information.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

#### **Port**
Specify one or more ports to restrict results.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[UInt64[]]`|false   |2       |true (ByPropertyName)|Ports  |

#### **Facility**
Specify one or more facilities to restrict results

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Log**
Specify one or more log(s) to restrict results

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[ClusterLogForwardStatistics]`|false   |named   |false        |

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

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[ClusterLogForwardStatistics]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterLogForwardStatistics

---

### Notes
Category: Cluster
API: cluster-log-forward-statistics-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterLogForwardStatistics [[-Destination] <String[]>] [[-Node] <String[]>] [[-Port] <UInt64[]>] [-Facility <String[]>] [-Log <String[]>] [-Attributes <ClusterLogForwardStatistics>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterLogForwardStatistics -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterLogForwardStatistics -Query <ClusterLogForwardStatistics> [-Attributes <ClusterLogForwardStatistics>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
