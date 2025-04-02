Set-NcUcmAdapter
----------------

### Synopsis
Modify configuration of an adapter under the Unified Connect Management (UCM) framework.

---

### Description

Modify configuration of an adapter under the Unified Connect Management (UCM) framework, including the mode and/or the FC-4 type.

---

### Related Links
* [Get-NcUcmAdapter](Get-NcUcmAdapter)

---

### Parameters
#### **Name**
Slot name of adapter (e.g 0e).

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|AdapterName|

#### **Node**
The name of the node where the adapter is installed.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |2       |true (ByPropertyName)|NodeName|

#### **Mode**
the mode of the adapter. Possible values:
'fc'     - change mode to 'Fibre Channel'
'cna'    - change mode to 'CNA'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Fc4Type**
the FC-4 type of the adapter. Possible values:
'initiator' - change FC-4 type to Initiator
'target'    - change FC-4 type to Target

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Ucm.UcAdapterInfo

---

### Notes
Category: ucm
API: ucm-adapter-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcUcmAdapter [-Name] <String> [-Node] <String> [-Mode <String>] [-Fc4Type <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
