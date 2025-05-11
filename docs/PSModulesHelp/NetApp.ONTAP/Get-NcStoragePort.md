Get-NcStoragePort
-----------------

### Synopsis
Get information about one or more storage ports.

---

### Description

Get information about one or more storage ports.

---

### Related Links
* [Enable-NcStoragePort](Enable-NcStoragePort)

* [Reset-NcStoragePort](Reset-NcStoragePort)

* [Invoke-NcStoragePortRescan](Invoke-NcStoragePortRescan)

---

### Examples
> Example 1

Get-NcStoragePort
Get details on all the storage ports of this controller

Node                           Port       Type                      State                Status
----                           ----       ----                      -----                ------
f3250-215-73-75-01             0a         sas                       enabled              online
f3250-215-73-75-01             0b         sas                       enabled              online
f3250-215-73-75-01             0c         fc                        enabled              offline
f3250-215-73-75-01             0d         fc                        enabled              offline
f3250-215-73-75-01             3a         sas                       enabled              offline
f3250-215-73-75-01             3b         sas                       enabled              offline
f3250-215-73-75-01             3c         sas                       enabled              offline
f3250-215-73-75-01             3d         sas                       enabled              offline
f3250-215-73-75-02             0a         sas                       enabled              online
f3250-215-73-75-02             0b         sas                       enabled              online
f3250-215-73-75-02             0c         fc                        enabled              offline
f3250-215-73-75-02             0d         fc                        enabled              offline
f3250-215-73-75-02             3a         sas                       enabled              offline
f3250-215-73-75-02             3b         sas                       enabled              offline
f3250-215-73-75-02             3c         sas                       enabled              offline
f3250-215-73-75-02             3d         sas                       enabled              offline

---

### Parameters
#### **Node**
Specify to filter by Node

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Port**
Specify to filter by Port

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|PortName<br/>Name|

#### **Type**
Specify to filter by type of port - sas/fc

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PortType|

#### **State**
Specify to filter by state of port - enabled/disabled

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PortState|

#### **Status**
Specify to filter by status of port - online/online_degraded/offline/link_down

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PortStatus|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[StoragePortInfo]`|false   |named   |false        |

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
|`[StoragePortInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePort.StoragePortInfo

---

### Notes
Category: storage port
API: storage-port-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStoragePort [[-Node] <String[]>] [[-Port] <String[]>] [-Type <String[]>] [-State <String[]>] [-Status <String[]>] [-Attributes <StoragePortInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStoragePort -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStoragePort -Query <StoragePortInfo> [-Attributes <StoragePortInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
