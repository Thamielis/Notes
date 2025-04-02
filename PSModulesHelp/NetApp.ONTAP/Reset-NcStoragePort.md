Reset-NcStoragePort
-------------------

### Synopsis
Resets a storage port.

---

### Description

Resets a storage port.

---

### Related Links
* [Reset-NcStoragePortDevice](Reset-NcStoragePortDevice)

* [Get-NcStoragePort](Get-NcStoragePort)

---

### Examples
> Example 1

Reset-NcStoragePort -Node f3250-215-73-75-01 -Port 0c
Reset a port

Reset port.
Are you sure you want to reset port f3250-215-73-75-01:0c?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

Node                           Port       Type                      State                Status
----                           ----       ----                      -----                ------
f3250-215-73-75-01             0c         fc                        enabled              offline

---

### Parameters
#### **Node**
Node which owns the port to be reset.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Port**
Port to be reset.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |2       |true (ByPropertyName)|PortName<br/>Name|

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
* DataONTAP.C.Types.StoragePort.StoragePortInfo

---

### Notes
Category: storage port
API: storage-port-reset
Family: cluster

---

### Syntax
```PowerShell
Reset-NcStoragePort [-Node] <String> [-Port] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
