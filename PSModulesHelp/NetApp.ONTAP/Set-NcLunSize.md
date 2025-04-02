Set-NcLunSize
-------------

### Synopsis
Changes the size of the LUN.

---

### Description

Changes the size of the LUN.  Note that client-side operations may be needed to ensure that client software recognizes the changed size.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

Set-NcLunSize /vol/testvol/exchangeLun 50g
Set the LUN 'exchangeLun' to 50 GB.

Path                        Size Protocol Online Mapped Thin  Vserver  Comment
----                        ---- -------- ------ ------ ----  -------  -------
/vol/testvol/exchangeLun 50.0 GB hyper_v  False   True  False costea01

> Example 2

Set-NcLunSize /vol/testvol/exchangeLun +10g
Increase the size of LUN 'exchangeLun' by 10 GB.

Path                        Size Protocol Online Mapped Thin  Vserver  Comment
----                        ---- -------- ------ ------ ----  -------  -------
/vol/testvol/exchangeLun 60.0 GB hyper_v  False   True  False costea01

> Example 3

Set-NcLunSize /vol/testvol/exchangeLun -10% -Force
Shrink LUN 'exchangeLun' by 10 percent.

Path                        Size Protocol Online Mapped Thin  Vserver  Comment
----                        ---- -------- ------ ------ ----  -------  -------
/vol/testvol/exchangeLun 54.0 GB hyper_v  False   True  False costea01

---

### Parameters
#### **Path**
Path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
Forcibly reduce the size.  This is required for reducing the size of the LUN to avoid accidentally reducing the LUN size. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Clone**
Specifies Clone. To create object use New-Object DataONTAP.C.Types.Lun.Clone. This parameter is supported with Rest only.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.Clone]`|false   |named   |false        |

#### **Location**
Specifies Location. To create object use New-Object DataONTAP.C.Types.Lun.Location. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.Location]`|false   |named   |false        |

#### **QosPolicy**
Specifies Location. To create object use New-Object DataONTAP.C.Types.Lun.QosPolicy. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.QosPolicy]`|false   |named   |false        |

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

#### **NewSize**
The new size of the LUN.
Specify the new size using the following format:
[+|-]<number>[k|m|g|t|%]
If a leading '+' or '-' appears, it indicates that the LUN size is to be increased or decreased (respectively) by the indicated amount, else the amount is the absolute size to set.
The optional trailing '%', which must be accompanied by a leading '+' or '-', indicates that the LUN size is to be increased or decreased in proportion to the current size.
The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |2       |false        |Size   |

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
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-resize
Family: vserver

---

### Syntax
```PowerShell
Set-NcLunSize [-Path] <String> [-Force] [-Clone <DataONTAP.C.Types.Lun.Clone>] [-Location <DataONTAP.C.Types.Lun.Location>] [-QosPolicy <DataONTAP.C.Types.Lun.QosPolicy>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-NewSize] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
