Test-NcSnapmirrorVolume
-----------------------

### Synopsis
Test the snapmirror status for the given volume.

---

### Description

Test the snapmirror status for the given volume.

The cmdlet checks if the volume is a source or destination volume of snapmirror data_protection relationships.

If the volume is a data_protection source in one or more snapmirror relationships, the IsSource return field is set to true.
If the volume is a data_protection destination in one or more snapmirror relationships, the IsDestination return field is set to true.
If the volume is a source or destination and at least one relationship status is 'transferring', the IsTransferring return field is set to true.
If the volume is a destination and at least one relationship status is 'broken-off', the IsBroken return field is set to true.

---

### Examples
> Example 1

```PowerShell
Test-NcSnapmirrorVolume beam01 luns
Test the snapmirror volume 'luns' on vserver 'beam01'.

Vserver              : beam01
IsSource             : False
IsDestination        : False
IsTransferBroken     : False
IsTransferInProgress : False
Volume               : luns

```

---

### Parameters
#### **Vserver**
The owning Vserver of the volume to test.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
The name of the volume to test.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Name   |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.VolSnapmirrorStatus

---

### Notes
Category: snapmirror
API: snapmirror-get-iter, volume-get-iter, cluster-identity-get
Family: cluster,vserver

---

### Syntax
```PowerShell
Test-NcSnapmirrorVolume [-Vserver] <String> [-Volume] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
