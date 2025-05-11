Stop-NcNdmpNodeSession
----------------------

### Synopsis
Kill a NDMP session on a node

---

### Description

Kill node-scoped  NDMP sessions. You may either specify a particular session ID to kill, or kill all sessions running on a particular node.

---

### Related Links
* [Enable-NcNdmp](Enable-NcNdmp)

---

### Examples
> Example 1

Stop-NcNdmpNodeSession -NodeName aparajir-vsim1 -SessionId 1
Kill a particular node-scoped NDMP session on aparajir-vsim1

Kill all NDMP sessions
Are you sure you wish to kill all NDMP sessions on node aparajir-vsim1.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

> Example 2

Stop-NcNdmpNodeSession -NodeName aparajir-vsim1 -All
Kill all NDMP sessions running on aparajir-vsim1

Kill all NDMP sessions
Are you sure you wish to kill all NDMP sessions on node aparajir-vsim1.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

---

### Parameters
#### **NodeName**
Name of the Node on which NDMP session was started.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|Node<br/>Name|

#### **SessionId**
Session Identifier to uniquely identify a session to kill

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |2       |true (ByPropertyName)|

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

#### **All**
Specify to kill all NDMP sessions on this node. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: ndmp
API: ndmp-node-session-kill, ndmp-node-session-kill-all
Family: cluster

---

### Syntax
```PowerShell
Stop-NcNdmpNodeSession [-NodeName] <String> [-SessionId] <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Stop-NcNdmpNodeSession [-NodeName] <String> -All [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
