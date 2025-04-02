Get-NcStorageShelfAcp
---------------------

### Synopsis
Return the connectivity of the node.

---

### Description

Return the connectivity of the node. 

A return status of Full-Connectivity means, that the connection is properly configured and fully working. Any other status means that an error is seen.

---

### Related Links
* [Get-NcStorageShelfAcpModule](Get-NcStorageShelfAcpModule)

* [Set-NcStorageShelfStorageAcp](Set-NcStorageShelfStorageAcp)

---

### Examples
> Example 1

```PowerShell
Get-NcStorageShelfAcp -Node aparajir-vsim1
Get information on one node

Address          : 0.0.0.0
ConnectionStatus : no_connectivity
CorrectiveAction : Wait 1-2 minutes. If error still seen, check cable connection
ErrorId          : 2
ErrorSeverity    : error
ErrorText        : No Full Connectivity
ErrorType        : connection_issue
IsEnabled        : False
NcController     : 10.238.49.117
Netmask          : 0.0.0.0
NodeName         : aparajir-vsim1
Port             : N/A
Status           : inactive
Subnet           : 0.0.0.0
ErrorIdSpecified : True

```

---

### Parameters
#### **NodeName**
The node that has alternate control path configured.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                         |Required|Position|PipelineInput        |Aliases          |
|-----------------------------|--------|--------|---------------------|-----------------|
|`[StorageShelfAcpConnection]`|false   |2       |true (ByPropertyName)|DesiredAttributes|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageShelf.StorageShelfAcpConnection

---

### Notes
Category: ses
API: storage-shelf-acp-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelfAcp [-NodeName] <String> [[-Attributes] <StorageShelfAcpConnection>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfAcp -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
