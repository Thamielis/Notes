Enable-NcFcAdapter
------------------

### Synopsis
Call the corresponding adapter driver enable function to bring the adapter online.

---

### Description

Call the corresponding adapter driver enable function to bring the adapter online. Under some circumstances an adapter can not be brought online. (e.g. when that adapter is in the UNCONFIGURED state, or when there is no cable attached to the adapter port).  When this happens, an appropriate error messages is returned.

---

### Related Links
* [Disable-NcFcAdapter](Disable-NcFcAdapter)

---

### Examples
> Example 1

Enable-NcFcAdapter VxeRubble-01 0d
Enable the fc adapter 0d on node VxeRubble-01.

NodeName                         AdapterName    AdapterType                AdapterState               AdapterStatus
--------                         -----------    -----------                ------------               -------------
VxeRubble-01                     0d             initiator                  CONFIGURED.                online

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
API: fc-config-adapter-enable
Family: cluster

---

### Syntax
```PowerShell
Enable-NcFcAdapter [-Node] <String> [-Adapter] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
