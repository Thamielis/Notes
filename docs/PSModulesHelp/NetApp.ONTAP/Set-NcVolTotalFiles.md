Set-NcVolTotalFiles
-------------------

### Synopsis
Set a volume's 'files-total' value to the given quantity.

---

### Description

Set a volume's 'files-total' value to the given quantity.  This specifies the maximum number of user-visible files that the given volume can hold.

---

### Related Links
* [Get-NcVol](Get-NcVol)

---

### Examples
> Example 1

Set-NcVolTotalFiles vol2 500000
Set the files-total limit on volume 'vol2' to 500000.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   11.0 GB   5%   10.4 GB False  aggr1     vserver1

---

### Parameters
#### **Name**
The name of the volume whose 'files-total' field we wish to set.  The chosen volume must be online and not read-only for this operation to succeed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **TotalFiles**
Specifies the new value for the volume's 'files-total' field.  This value must be larger than the volume's current 'files-total' value, and can never be larger than the number of 4KB blocks in the volume.  The filer may actually choose a smaller value so as to comply with certain internal accounting and alignment requirements.  Once this value has been increased for a volume, it cannot be reduced below the value of 'inodefile-public-capacity' for that volume.  Range : [0..2^31-1]

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|true    |2       |false        |Files  |

#### **Force**
Indicates whether the filer should reject a legal but "unreasonable" (seemingly too large) value for 'requested-total-files', or accept it without question.  By default, legal but "unreasonable" values are rejected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-set-total-files
Family: vserver

---

### Syntax
```PowerShell
Set-NcVolTotalFiles [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-TotalFiles] <Int32> [-Force] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
