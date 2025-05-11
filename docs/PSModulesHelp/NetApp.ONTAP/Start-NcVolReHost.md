Start-NcVolReHost
-----------------

### Synopsis
Rehosts a volume from one Vserver into another Vserver.

---

### Description

Rehosts a volume from one Vserver into another Vserver. Since  volume rehost is a disruptive operation, administrators must stop all data access on target volume before rehosting. On success, target volume is available for data access under destination Vserver. Upon failure the rehost operation is reverted and target volume is available under source Vserver.

---

### Related Links
* [Start-NcVolMove](Start-NcVolMove)

* [Start-NcVolCopy](Start-NcVolCopy)

---

### Examples
> Example 1

Start-NcVolReHost -Vserver vs1 -Name vol1 -DestinationVserver vs2
Rehosting vol1 from vserver vs1 to vs2

Name        Vserver              State       TotalSize  Used  Available Dedupe Aggregate              

               
----         -------             -----       ---------  ----  --------- ------ ---------              

   
vol1         vs2                online         1.0 GB    5%   972.6 MB False  aggr1

---

### Parameters
#### **Vserver**
The source Vserver name to which target volume belongs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Name**
Name of the volume to be rehosted i.e. targeted volume name.

|Type      |Required|Position|PipelineInput        |Aliases                                     |
|----------|--------|--------|---------------------|--------------------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Volume<br/>SourceVolume<br/>SourceVolumeName|

#### **DestinationVserver**
Destination Vserver name where target volume must reside after successful volume rehost operation.

|Type      |Required|Position|PipelineInput                 |Aliases    |
|----------|--------|--------|------------------------------|-----------|
|`[String]`|true    |3       |true (ByValue, ByPropertyName)|DestVserver|

#### **ForceUnmapLuns**
If specified LUNs will be unmapped automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoRemapLuns**
If specified LUNs will be mapped automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.	In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-rehost
Family: cluster

---

### Syntax
```PowerShell
Start-NcVolReHost [-Vserver] <String> [-Name] <String> [-DestinationVserver] <String> [-ForceUnmapLuns] [-AutoRemapLuns] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
