New-NcVMProviderProxy
---------------------

### Synopsis
Add a proxy server for the virtual-machine provider.

---

### Description

Add a proxy server for the virtual-machine provider. If the node already has a proxy server defined, this will return an error. Please use Update-NcVMProviderProxy instead.

---

### Related Links
* [Update-NcVMProviderProxy](Update-NcVMProviderProxy)

* [Remove-NcVMProviderProxy](Remove-NcVMProviderProxy)

* [Get-NcVMProviderProxy](Get-NcVMProviderProxy)

---

### Parameters
#### **Node**
The name of the node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ProxyServer**
A proxy server that can reach the provider.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Proxy<br/>ServerName|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.VirtualMachine.VmProviderProxy

---

### Notes
Category: virtual machine
API: virtual-machine-provider-proxy-create
Family: cluster

---

### Syntax
```PowerShell
New-NcVMProviderProxy [-Node] <String> [-ProxyServer] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
