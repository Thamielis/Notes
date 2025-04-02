Get-NcNdmpVserverSession
------------------------

### Synopsis
Get details of all vserver-scoped NDMP sessions from the cluster

---

### Description

Get details of all vserver-scoped NDMP sessions from the cluster

---

### Related Links
* [Get-NcNdmpVserverAttr](Get-NcNdmpVserverAttr)

* [Set-NcNdmpVserverAttr](Set-NcNdmpVserverAttr)

* [Enable-NcNdmpVserver](Enable-NcNdmpVserver)

---

### Examples
> Example 1

```PowerShell
Get-NcNdmpVserverSession
Get details of all vserver-scoped NDMP sessions running on this cluster
```

---

### Parameters
#### **VserverName**
Specify to filter by Vservers

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Vserver<br/>Vservers|

#### **SessionId**
Specify to filter by SessionId

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[NdmpVserverSessionInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[NdmpVserverSessionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ndmp.NdmpVserverSessionInfo

---

### Notes
Category: ndmp
API: ndmp-vserver-session-info-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNdmpVserverSession [[-VserverName] <String[]>] [[-SessionId] <String>] [-Attributes <NdmpVserverSessionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNdmpVserverSession -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNdmpVserverSession -Query <NdmpVserverSessionInfo> [-Attributes <NdmpVserverSessionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
