Get-NcFcportLinkState
---------------------

### Synopsis
Get the link state of a specific adapter on this system.

---

### Description

Get the link state of a specific adapter on this system.

---

### Examples
> Example 1

```PowerShell
Get-NcFcportLinkState -Node fas3070cluster01-01 -Adapter 0a
Get the link state of adapter 0a on node fas3070cluster01-01.

AdapterName  : 0a
FcPortInfo   : DataONTAP.C.Types.Fcport.FcPorts
LinkState    : up
NcController : 10.61.172.155
NodeName     : fas3070cluster01-01

```

---

### Parameters
#### **Node**
The storage system name the command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Adapter**
The adapter name is either a slot number, or, if a port letter is also presented, a slot number and port letter concatenated into a single name -- for example, "8a" or "11b".

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |2       |true (ByPropertyName)|AdapterName|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcport.LinkStateInfo

---

### Notes
Category: fcport
API: fcport-get-link-state
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcportLinkState [-Node] <String> [-Adapter] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
