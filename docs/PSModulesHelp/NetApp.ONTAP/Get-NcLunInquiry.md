Get-NcLunInquiry
----------------

### Synopsis
Get the SCSI INQUIRY response data for vendor id (vid), product id (pid), and firmware revision (rev) based on the igroup that the LUN in question is mapped to.

---

### Description

Get the SCSI INQUIRY response data for vendor id (vid), product id (pid), and firmware revision (rev) based on the igroup that the LUN in question is mapped to.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

```PowerShell
Get-NcLunInquiry x3550rre7
Get LUN inquiry info for igroup 'x3550rre7'.

NcController     : costea01
VendorId         : NETAPP
ProductId        : LUN C-Mode
FirmwareRevision : 8100

```

---

### Parameters
#### **Igroup**
The initiator group for which the vid/pid/rev information is to be returned.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |1       |true (ByPropertyName)|InitiatorGroupName|

#### **DeleteOnUnmap**
An option that causes the initiator group to be deleted when the last LUN map associated with it is deleted. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **ConnectivityTracking**
An overview of the connections to ONTAP by the initiators in this group. This parameter is supported with Rest only.

|Type                                                   |Required|Position|PipelineInput|
|-------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Igroup.RecordConnectivityTracking]`|false   |named   |false        |

#### **Portset**
The portset to which the initiator group is bound. This parameter is supported with Rest only.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Igroup.Portset]`|false   |named   |false        |

#### **OsType**
The host operating system of the initiator group. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
A comment available for use by the administrator. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Protocol**
The protocols supported by the initiator group. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uuid**
The unique identifier of the initiator group. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SupportsIgroup**
An initiator group may contain either initiators or other initiator groups, but not both simultaneously. This property is true when initiator groups can be added to this initiator group. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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
* DataONTAP.C.Types.Lun.LunInquiry

---

### Notes
Category: lun
API: lun-get-inquiry-info
Family: vserver

---

### Syntax
```PowerShell
Get-NcLunInquiry [-Igroup] <String> [-DeleteOnUnmap <Boolean>] [-ConnectivityTracking <DataONTAP.C.Types.Igroup.RecordConnectivityTracking>] [-Portset <DataONTAP.C.Types.Igroup.Portset>] 
```
```PowerShell
[-OsType <String>] [-Comment <String>] [-Protocol <String>] [-Uuid <String>] [-SupportsIgroup <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
