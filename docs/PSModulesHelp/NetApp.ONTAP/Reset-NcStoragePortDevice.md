Reset-NcStoragePortDevice
-------------------------

### Synopsis
Resets a device behind a storage port

---

### Description

Resets a device behind a storage port

---

### Related Links
* [Reset-NcStoragePort](Reset-NcStoragePort)

---

### Examples
> Example 1

Reset-NcStoragePortDevice -Node f3250-215-73-75-01 -Port 0c
Reset the device behind a port - Need to test this on devN before raising burt

Reset port device
Are you sure you want to reset device behind port f3250-215-73-75-01?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y
2016-02-15 17:46:15,774 DEBUG NetApp.Ontapi.NaServer - <netapp version='1.0' xmlns='http://www.netapp.com/filer/admin'>
 <storage-port-reset-device>
  <node>f3250-215-73-75-01</node>
  <port>0c</port>
 </storage-port-reset-device>
</netapp>

2016-02-15 17:46:15,790 DEBUG NetApp.Ontapi.NaServer - <results reason="Missing value for zapi field: . " status="failed" errno="13001"/>

+ Reset-NcStoragePortDevice -Node f3250-215-73-75-01 -Port 0c
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (10.225.183.84:NcController) [Reset-NcStoragePortDevice], EAPIERROR
    + FullyQualifiedErrorId : ApiException,DataONTAP.C.PowerShell.SDK.Cmdlets.StoragePort.ResetNcStoragePortDevice

---

### Parameters
#### **Node**
Node which owns the port, the devive behind which is to be reset.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Port**
Port, the device behind which is to be reset.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |2       |true (ByPropertyName)|PortName<br/>Name|

#### **BayId**
Bay ID of the devive to reset.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ShelfName**
Shelf Name on which the device to reset is housed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **LoopId**
Loop ID of the devive to reset.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: storage port
API: storage-port-reset-device
Family: cluster

---

### Syntax
```PowerShell
Reset-NcStoragePortDevice [-Node] <String> [-Port] <String> [-BayId <Int64>] [-ShelfName <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Reset-NcStoragePortDevice [-Node] <String> [-Port] <String> -LoopId <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
