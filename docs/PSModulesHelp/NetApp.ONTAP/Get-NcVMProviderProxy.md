Get-NcVMProviderProxy
---------------------

### Synopsis
Get a list of proxy servers.

---

### Description

Get a list of proxy servers.

---

### Related Links
* [Update-NcVMProviderProxy](Update-NcVMProviderProxy)

* [Remove-NcVMProviderProxy](Remove-NcVMProviderProxy)

* [New-NcVMProviderProxy](New-NcVMProviderProxy)

---

### Parameters
#### **Node**
Specify to filter by Node

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **ProxyServer**
Specify to filter by proxy server that can reach the provider.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ServerName<br/>Proxy|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VmProviderProxy]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VmProviderProxy]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.VirtualMachine.VmProviderProxy

---

### Notes
Category: virtual machine
API: virtual-machine-provider-proxy-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcVMProviderProxy [[-Node] <String[]>] [[-ProxyServer] <String[]>] [-Attributes <VmProviderProxy>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVMProviderProxy -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcVMProviderProxy -Query <VmProviderProxy> [-Attributes <VmProviderProxy>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
