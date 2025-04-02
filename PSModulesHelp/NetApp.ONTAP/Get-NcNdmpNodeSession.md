Get-NcNdmpNodeSession
---------------------

### Synopsis
Get details of all node-scoped NDMP sessions from the cluster

---

### Description

Get details of all node-scoped NDMP sessions from the cluster

---

### Related Links
* [Enable-NcNdmp](Enable-NcNdmp)

* [Stop-NcNdmpNodeSession](Stop-NcNdmpNodeSession)

---

### Examples
> Example 1

```PowerShell
Get-NcNdmpNodeSession
Get details of all Node-scoped Ndmp Sessions running on the cluster
```

---

### Parameters
#### **VserverName**
Specify to filter by Vservers

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Vserver<br/>Vservers|

#### **NodeName**
Specify to filter by Nodes

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Node<br/>Nodes|

#### **SessionId**
Specify to filter by SessionId

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NdmpNodeSessionInfo]`|false   |named   |false        |

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

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NdmpNodeSessionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ndmp.NdmpNodeSessionInfo

---

### Notes
Category: ndmp
API: ndmp-node-session-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNdmpNodeSession [[-VserverName] <String[]>] [[-NodeName] <String[]>] [[-SessionId] <Int64>] [-Attributes <NdmpNodeSessionInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNdmpNodeSession -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNdmpNodeSession -Query <NdmpNodeSessionInfo> [-Attributes <NdmpNodeSessionInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
