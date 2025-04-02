Update-NcVMProviderProxy
------------------------

### Synopsis
Modify the virtual-machine provider's proxy server.

---

### Description

Modify the virtual-machine provider's proxy server. Modifying a node with no proxy will succeed in configuring a proxy for the node.

---

### Related Links
* [Remove-NcVMProviderProxy](Remove-NcVMProviderProxy)

* [Get-NcVMProviderProxy](Get-NcVMProviderProxy)

* [New-NcVMProviderProxy](New-NcVMProviderProxy)

---

### Parameters
#### **Node**
Specify to filter by Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
Specify to continue attempting the operation on other instances, even if it fails on one instance

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure, this can be specified to stop the operation after n number of failures

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type               |Required|Position|PipelineInput        |Aliases          |
|-------------------|--------|--------|---------------------|-----------------|
|`[VmProviderProxy]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[VmProviderProxy]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: virtual machine
API: virtual-machine-provider-proxy-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcVMProviderProxy [-Node] <String[]> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <VmProviderProxy>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcVMProviderProxy [-Query] <VmProviderProxy> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <VmProviderProxy>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcVMProviderProxy [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
