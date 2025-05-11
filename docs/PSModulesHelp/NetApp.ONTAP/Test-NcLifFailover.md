Test-NcLifFailover
------------------

### Synopsis
Get the list of LIFs at risk.

---

### Description

Get the list of LIFs at risk.

---

### Related Links
* [New-NcNetFailoverGroup](New-NcNetFailoverGroup)

* [Set-NcNetFailoverGroup](Set-NcNetFailoverGroup)

---

### Parameters
#### **SourceNodes**
This is a list of nodes whose LIFs should be checked. LIFs considered at risk will be currently hosted on one of these nodes. This list should contain at most half the nodes in the cluster.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|NodeNames<br/>Names|

#### **DestinationNodes**
Restrict results by specifying the set of nodes a given LIF or LIFs could fail over to

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **VserverName**
Restrict results to one or more owner vservers

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Vservers|

#### **LifName**
Restrict results to one or more lifs

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Lifs   |

#### **FailoverGroups**
Restrict results to one or more failover groups

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **FailoverPolicies**
Restrict results to one or more failover policies

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type               |Required|Position|PipelineInput        |Aliases          |
|-------------------|--------|--------|---------------------|-----------------|
|`[LifCapacityInfo]`|false   |1       |true (ByPropertyName)|DesiredAttributes|

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

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[LifCapacityInfo]`|true    |named   |false        |

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.LifCapacityInfo

---

### Notes
Category: Net
API: net-check-failover
Family: cluster

---

### Syntax
```PowerShell
Test-NcLifFailover [-SourceNodes] <String[]> [-DestinationNodes <String[]>] [-VserverName <String[]>] [-LifName <String[]>] [-FailoverGroups <String[]>] [-FailoverPolicies <String[]>] 
```
```PowerShell
[[-Attributes] <LifCapacityInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Test-NcLifFailover [-SourceNodes] <String[]> -Query <LifCapacityInfo> [[-Attributes] <LifCapacityInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcLifFailover -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
