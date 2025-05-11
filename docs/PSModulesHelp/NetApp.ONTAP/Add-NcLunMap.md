Add-NcLunMap
------------

### Synopsis
Maps a LUN to all the initiators in the specified initiator group.

---

### Description

Maps a LUN to all the initiators in the specified initiator group.

---

### Related Links
* [Get-NcLun](Get-NcLun)

* [Get-NcLunMap](Get-NcLunMap)

---

### Examples
> Example 1

Add-NcLunMap /vol/testvol/testlun x3550rre8
Map LUN 'testlun' to igroup 'x3550rre8'.

Path                    Size Protocol Online Mapped Thin Vserver  Comment
----                    ---- -------- ------ ------ ---- -------  -------
/vol/testvol/testlun 20.0 GB hyper_v   True   True  True costea01

> Example 2

Add-NcLunMap -Path /vol/san_vol/lun0 -InitiatorGroup ig0 -Node aparajir-vsim2
Adds aparajir-vsim2 as reporting node for lun0

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver
----                                           ----   -------- --------     ------ ------  ----  -------
/vol/san_vol/lun0                           39.2 MB          0 windows       True   True  False  pstk_san

#Result
PS C:\Users\aparajir\Perforce\aparajir_BTC_pstk_burt_859321\depot\main> Get-NcLunMap /vol/san_vol/lun0 | select Path, ReportingNodes
Path                                                        ReportingNodes
----                                                        --------------
/vol/san_vol/lun0                                           {aparajir-vsim1, aparajir-vsim2}

---

### Parameters
#### **Path**
Path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **InitiatorGroup**
Initiator group to map to the given LUN.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |2       |true (ByPropertyName)|InitiatorGroupName|

#### **Id**
If the Id is not specified, the smallest number that can be used for the various initiators in the group is automatically picked.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Node**
The newly created LUN map will be reported from this node (and its HA partner) in addition to the current owning nodes of the LUN.
This field is available in ONTAP 8.3 and later. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[String]`|false   |named   |false        |AdditionalReportingNode|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Igroup**
Specifies the initiator group to which the LUN is mapped. To create object use New-Object DataONTAP.C.Types.Lun.IgroupInfo. This parameter is supported with Rest only.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.IgroupInfo]`|false   |named   |false        |

#### **Lun**
Specifies the LUN to which the initiator group is mapped. To create object use New-Object DataONTAP.C.Types.Lun.RestLunMap.Lun. This parameter is supported with Rest only.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.RestLunMap.Lun]`|false   |named   |false        |

#### **Svm**
Specifies the SVM. To create object use New-Object DataONTAP.C.Types.Lun.Svm. This parameter is supported with Rest only.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.Svm]`|false   |named   |false        |

#### **ReportingNode**
Specifies the cluster nodes from which network paths to the mapped LUNs are advertised via the SAN protocols as part of the Selective LUN Map (SLM) feature of ONTAP. To create object use New-Object DataONTAP.C.Types.Lun.ReportingNode. This parameter is supported with Rest only.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.ReportingNode]`|false   |named   |false        |

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
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-map
Family: vserver

---

### Syntax
```PowerShell
Add-NcLunMap [-Path] <String> [-InitiatorGroup] <String> [-Id <Int32>] [-Node <String>] [-VserverContext <String>] [-Igroup <DataONTAP.C.Types.Lun.IgroupInfo>] [-Lun 
```
```PowerShell
<DataONTAP.C.Types.Lun.RestLunMap.Lun>] [-Svm <DataONTAP.C.Types.Lun.Svm>] [-ReportingNode <DataONTAP.C.Types.Lun.ReportingNode>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
