Start-NcLunCopy
---------------

### Synopsis
Starts copying a group of LUNs from one volume to another.

---

### Description

The destination volume can be located on the same Vserver as the  original volume or on a different Vserver. 
If source-vserver is  not specified, the source Vserver defaults to the target   Vserver, i.e., an intra-Vserver copy. Intra-Vserver copy can be initiated by both cluster and Vserver administrators.  
Inter-Vserver copy can be initiated by cluster administrators

---

### Related Links
* [Stop-NcLunCopy](Stop-NcLunCopy)

* [Get-NcLunCopy](Get-NcLunCopy)

* [Suspend-NcLunCopy](Suspend-NcLunCopy)

---

### Examples
> Example 1

Start-NcLunCopy -DestinationVserver "pstk" -SourceVserver "pstk_san" -Source /vol/move_test_alt/lun0 -Destination  /vol/lun_vol/lun_cc
Inter-Vserver lun copy.

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/lun_vol/lun_cc  data                  100%     0 c0d70c28-cd14-4053-8d32-7474154964be

> Example 2

Start-NcLunCopy /vol/move_test_alt/lun0,/vol/move_test_alt/lun1 /vol/move_test/lun0,/vol/move_test/lun1
Intra-Vserver lun copy with more than one lun.

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lun0  allocation_map        100%     0 205a6f7b-8888-4f41-b1a1-ee9ad507ebbd
/vol/move_test_al... /vol/move_test/lun1  allocation_map        100%     1 205a6f7b-8888-4f41-b1a1-ee9ad507ebbd

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Source**
A String array where each element is the original path of a lun to be copied

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|true    |1       |true (ByPropertyName)|SourcePath|

#### **Destination**
A String array where each element is the destination path of a lun to be copied. The destination paths must correspond with the source paths.

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[String[]]`|true    |2       |false        |DestinationPath|

#### **DestinationVserver**
Specifies the name of the Vserver that will host the new LUNs. 
Note: This can not be specified if you are connected to a vserver, or you have connected to a controller, but have a global VserverContext set.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Vserver|

#### **SourceVserver**
Specifies the name of the Vserver hosting the LUNs to be copied. If not specified, it is assumed to be same as destination vserver.
Note: This can not be specified if you are connected to a vserver, or you have connected to a controller, but have a global VserverContext set.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PromoteEarly**
Specifies that the destination needs to be promoted early, i.e. the new lun will be visible immediately.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxThroughput**
Specifies the maximum amount of data that can be transferred per second in support of this operation. 
Default: zero, indicating no throttling.
Note: Specified value will be rounded up to the nearest megabyte

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReferenceLun**
Data from all other luns to be moved are transferred as difference from this one; may save bandwidth

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Lun.LunCopyInfo

---

### Notes
Category: lun
API: lun-copy-start
Family: cluster, vserver

---

### Syntax
```PowerShell
Start-NcLunCopy [-Controller <NcController[]>] [-Source] <String[]> [-Destination] <String[]> [-DestinationVserver <String>] [-SourceVserver <String>] [-PromoteEarly] [-MaxThroughput 
```
```PowerShell
<String>] [-ReferenceLun <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
