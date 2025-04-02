Get-NcClusterLogForward
-----------------------

### Synopsis
Get information about log forwarding.

---

### Description

Get information about log forwarding

---

### Related Links
* [Set-NcClusterLogForward](Set-NcClusterLogForward)

* [New-NcClusterLogForward](New-NcClusterLogForward)

* [Remove-NcClusterLogForward](Remove-NcClusterLogForward)

* [Get-NcClusterLogForwardStatistics](Get-NcClusterLogForwardStatistics)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterLogForward -Port 16640
Restrict results to cluster log forwarding using Port 16640

Destination    : 10.72.211.105
Facility       : local1
Force          : True
NcController   : 10.238.49.117
Port           : 16640
ForceSpecified : True

```
> Example 2

$q = Get-NcClusterLogForward -Template
Using the Query and Template parameters.

$q.Facility = "kern|user|local1"

Get-NcClusterLogForward -Query $q

Destination    : 10.72.211.100
Facility       : kern
Force          : True
NcController   : 10.238.49.117
Port           : 16745
ForceSpecified : True

Destination    : 10.72.211.105
Facility       : local1
Force          : True
NcController   : 10.238.49.117
Port           : 16640
ForceSpecified : True

---

### Parameters
#### **Destination**
Name/IP Address of one or more destination(s) for which you want to retrieve information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

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

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterLogForwardInfo]`|false   |named   |false        |

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
Specify to query using a object with restricting fields set

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterLogForwardInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterLogForwardInfo

---

### Notes
Category: Cluster
API: cluster-log-forward-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterLogForward [[-Destination] <String[]>] [[-Port] <UInt64[]>] [-Facility <String[]>] [-Attributes <ClusterLogForwardInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterLogForward -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterLogForward -Query <ClusterLogForwardInfo> [-Attributes <ClusterLogForwardInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
