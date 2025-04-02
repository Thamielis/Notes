Disable-NcFcAdapter
-------------------

### Synopsis
Call the corresponding adapter driver disable function to bring the adapter offline.

---

### Description

Call the corresponding adapter driver disable function to bring the adapter offline. Under some circumstances an adapter can not be put offline. (e.g. when the adapter is being used by the RAID sub-system to provide disks in a volume). In some cases, manual intervention is required. When this happens, an appropriate error messages is returned.

---

### Related Links
* [Enable-NcFcAdapter](Enable-NcFcAdapter)

---

### Examples
> Example 1

Disable-NcFcAdapter VxeRubble-02 0d
Disable the fc adapter 0d on the node VxeRubble-02.

NodeName                         AdapterName    AdapterType                AdapterState               AdapterStatus
--------                         -----------    -----------                ------------               -------------
VxeRubble-02                     0d             initiator                  CONFIGURED.                offline

---

### Parameters
#### **Node**
The storage system name the command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Adapter**
FC adapter name.

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
* DataONTAP.C.Types.Fc.FcConfig

---

### Notes
Category: fc
API: fc-config-adapter-disable
Family: cluster

---

### Syntax
```PowerShell
Disable-NcFcAdapter [-Node] <String> [-Adapter] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
