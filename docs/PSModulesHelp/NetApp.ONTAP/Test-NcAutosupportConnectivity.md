Test-NcAutosupportConnectivity
------------------------------

### Synopsis
Test connectivity to the Autosupport destinations

---

### Description

Test connectivity to the Autosupport destinations

---

### Examples
> Example 1

```PowerShell
Test-NcAutosupportConnectivity
Test connectivity for all nodes on the cluster.

AodStatus      : Error: Peer certificate cannot be authenticated with given CA certificates
Force          : False
NcController   : 10.225.215.73
NodeName       : f3250-215-73-75-01
PostUrlStatus  : Error: Peer certificate cannot be authenticated with given CA certificates
PutUrlStatus   : Error: Peer certificate cannot be authenticated with given CA certificates
ForceSpecified : True

AodStatus      : Error: Peer certificate cannot be authenticated with given CA certificates
Force          : False
NcController   : 10.225.215.73
NodeName       : f3250-215-73-75-02
PostUrlStatus  : Error: Peer certificate cannot be authenticated with given CA certificates
PutUrlStatus   : Error: Peer certificate cannot be authenticated with given CA certificates

```

---

### Parameters
#### **Node**
The name of a controller on which the AutoSupport tool is running.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[AutosupportConnectivityCheckInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Force**
Specify to force test Current AutoSupport Status

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Can be used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[AutosupportConnectivityCheckInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportConnectivityCheckInfo

---

### Notes
Category: autosupport
API: autosupport-check-connectivity-iter
Family: cluster

---

### Syntax
```PowerShell
Test-NcAutosupportConnectivity [[-Node] <String[]>] [-Attributes <AutosupportConnectivityCheckInfo>] [-Controller <NcController[]>] [-Force] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcAutosupportConnectivity -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcAutosupportConnectivity -Query <AutosupportConnectivityCheckInfo> [-Attributes <AutosupportConnectivityCheckInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
