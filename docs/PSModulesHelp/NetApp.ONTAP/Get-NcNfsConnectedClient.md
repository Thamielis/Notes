Get-NcNfsConnectedClient
------------------------

### Synopsis
Retrieves NFS clients information.

---

### Description

Retrieves NFS clients information.This cmdlet is supported with Rest.

---

### Examples
> Example 1

Get-NcNfsConnectedClientMap
Retrieves NFS clients information.

ClientIps        Node                       ServerIp      Svm
---------        ----                       --------      ---
{10.236.174.185} DataONTAP.C.Types.Nfs.Node 10.236.154.54 DataONTAP.C.Types.Nfs.Svm

---

### Parameters
#### **ServerIp**
Specifies the IP address of the server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **ClientIp**
Specifies the IP address of the client

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **VserverId**
The unique identifier of the SVM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **NodeId**
The unique identifier of the SVM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Node**
The name of the SVM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsConnectedClientMapInfo

---

### Notes
Category: protocols
API: protocols/nfs/connected-client-maps
Family: protocols

---

### Syntax
```PowerShell
Get-NcNfsConnectedClient [[-ServerIp] <String>] [[-ClientIp] <String>] [[-VserverId] <String>] [[-Vserver] <String>] [[-NodeId] <String>] [[-Node] <String>] [<CommonParameters>]
```
