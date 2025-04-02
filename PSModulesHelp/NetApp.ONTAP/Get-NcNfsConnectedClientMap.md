Get-NcNfsConnectedClientMap
---------------------------

### Synopsis

Get-NcNfsConnectedClientMap [-ServerIp <string>] [-VserverId <string>] [-Vserver <string>] [-NodeId <string>] [-Node <string>] [-ClientIps <string>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ClientIps**
Specifies the IP address of the client.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Node**
Specifies the Node Name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **NodeId**
Specifies the Node Id.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **ServerIp**
Specifies the IP address of the server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **VserverId**
The unique identifier of the SVM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **ZapiCall**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Benannt |false        |ONTAPI |

#### **ZapiRetryCount**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Benannt |false        |

---

### Inputs
NetApp.Ontapi.Filer.C.NcController[]

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsConnectedClientMapInfo

---

### Syntax
```PowerShell
syntaxItem                                                                                                             
```
```PowerShell
----------                                                                                                             
```
```PowerShell
{@{name=Get-NcNfsConnectedClientMap; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
