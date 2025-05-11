Get-NcStorageAdapter
--------------------

### Synopsis
Get the list of adapters present on this system.

---

### Description

Get the list of adapters present on this system.

---

### Related Links
* [Get-NcStorageAdapterInfo](Get-NcStorageAdapterInfo)

* [Enable-NcStorageAdapter](Enable-NcStorageAdapter)

---

### Examples
> Example 1

Get-NcStorageAdapter
Get the list of adapters present on this system.

NodeName     AdapterName NcController
--------     ----------- ------------
VxeRubble-01 0b          VxeRubble
VxeRubble-01 0c          VxeRubble
VxeRubble-01 0d          VxeRubble
VxeRubble-01 1a          VxeRubble
VxeRubble-01 1b          VxeRubble
VxeRubble-01 1c          VxeRubble
VxeRubble-01 1d          VxeRubble
VxeRubble-01 3a          VxeRubble
VxeRubble-01 3b          VxeRubble
VxeRubble-01 3c          VxeRubble
VxeRubble-01 3d          VxeRubble
VxeRubble-02 0b          VxeRubble
VxeRubble-02 0c          VxeRubble
VxeRubble-02 0d          VxeRubble
VxeRubble-02 1a          VxeRubble
VxeRubble-02 1b          VxeRubble
VxeRubble-02 1c          VxeRubble
VxeRubble-02 1d          VxeRubble

---

### Parameters
#### **Node**
The node this command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName|

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
* DataONTAP.C.Types.StorageAdapter.AdapterNameElem

---

### Notes
Category: storage adapter
API: storage-adapter-get-adapter-list
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageAdapter [[-Node] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
