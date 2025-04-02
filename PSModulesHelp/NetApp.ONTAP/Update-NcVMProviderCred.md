Update-NcVMProviderCred
-----------------------

### Synopsis
Modify virtual-machine provider credentials.

---

### Description

Modify virtual-machine provider credentials. Modifying a node with no existing credentials will succeed in adding the credentials to the node.

---

### Related Links
* [Remove-NcVMProviderCred](Remove-NcVMProviderCred)

* [Get-NcVMProviderCred](Get-NcVMProviderCred)

* [New-NcVMProviderCred](New-NcVMProviderCred)

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

|Type                    |Required|Position|PipelineInput        |Aliases          |
|------------------------|--------|--------|---------------------|-----------------|
|`[VmProviderCredential]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[VmProviderCredential]`|true    |1       |true (ByPropertyName)|

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
API: virtual-machine-provider-credential-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcVMProviderCred [-Node] <String[]> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <VmProviderCredential>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcVMProviderCred [-Query] <VmProviderCredential> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <VmProviderCredential>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcVMProviderCred [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
