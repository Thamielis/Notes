Set-NcFcAdapterType
-------------------

### Synopsis
Set the adapter driver and/or configuration state.

---

### Description

Sets the adapter driver and/or configuration state.  Each configurable adapter has an adapter type and adapter state.  The adapter type indicates which driver is attached to the adapter, the adapter state indicates what the configuration state of the adapter is. The fc type is used to modify both the adapter type and the adapter state. After setting the adapter fc type a filer reboot is sometimes needed to make the change effective.  Use Get-NcFcAdapter to determine if a filer reboot is needed.

---

### Related Links
* [Get-NcFcAdapter](Get-NcFcAdapter)

---

### Examples
> Example 1

Set-NcFcAdapterType VxeRubble-02 0d target
Setting the adapter 0d on node VxeRubble-02 to type target.

NodeName                         AdapterName    AdapterType                AdapterState               AdapterStatus
--------                         -----------    -----------                ------------               -------------
VxeRubble-02                     0d             target                     CONFIGURED.                offline

---

### Parameters
#### **Node**
The storage system name the command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Adapter**
FC adapter name.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |2       |true (ByPropertyName)|AdapterName|

#### **Type**
Sets the type and state of the adapter.  Possible inputs:
"unconfigured" - set adapter type to "initiator" and adapter state to UNCONFIGURED
"initiator"    - set adapter type to "initiator" and adapter state to CONFIGURED
"target"       - set adapter type to "target" and adapter state to CONFIGURED
"vi"           - set adapter type to "vi" and adapter state to CONFIGURED

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |3       |true (ByPropertyName)|FcType |

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
API: fc-config-set-adapter-fc-type
Family: cluster

---

### Syntax
```PowerShell
Set-NcFcAdapterType [[-Node] <String>] [[-Adapter] <String>] [[-Type] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
