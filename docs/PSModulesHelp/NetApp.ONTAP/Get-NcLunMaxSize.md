Get-NcLunMaxSize
----------------

### Synopsis
Returns the maximum possible size in bytes of a LUN on a given volume or qtree.

---

### Description

Returns the maximum possible size in bytes of a LUN on a given volume or qtree. The user can pass the path to a volume or qtree in which the LUN is to be created. This returns the maximum size for different types of LUNs and the possible maximum size with or without snapshot reserves.

---

### Related Links
* [Get-NcLunMinSize](Get-NcLunMinSize)

* [New-NcLun](New-NcLun)

---

### Examples
> Example 1

```PowerShell
Get-NcLunMaxSize testvol hyper_v
Get the maximum size of a LUN in volume 'testvol' of type 'hyper_v'.

NcController                : costea01
WithCompleteSnapshotReserve : 50799329280
WithoutSnapshotReserve      : 101598658560
WithSnapshotReserve         : 50799329280

```

---

### Parameters
#### **Path**
Path of the volume or qtree.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Type**
OS type of the LUN.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Lun.LunMaxSize

---

### Notes
Category: lun
API: lun-get-maxsize
Family: vserver

---

### Syntax
```PowerShell
Get-NcLunMaxSize [-Path] <String> [-Type] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
