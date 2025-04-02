Get-NcCloneDeletion
-------------------

### Synopsis
List clone deletion information

---

### Description

List clone deletion information

---

### Related Links
* [Add-NcCloneDeletionExtension](Add-NcCloneDeletionExtension)

* [Remove-NcCloneDeletionExtension](Remove-NcCloneDeletionExtension)

---

### Examples
> Example 1

Get-NcCloneDeletion
Get clone deletion information from the entire cluster

Vserver                        Volume                         MinimumSiz Extensions
                                                              e
-------                        ------                         ---------- ----------
pstk_san                       move_test                      1073741... vmdk,vhd,vhdx,vswp,
pstk_san                       pstk_san_root                  0          ,
pstk_san                       san_vol                        0          vmdk,vhd,vhdx,vswp,cl1,
pstk_san                       test_vol                       0          ,

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a CifsServerConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsServer -Template" to get the initially empty CifsServerConfig object.  If not specified, all data is returned for each object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CloneDeletionInfo]`|false   |named   |false        |

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

#### **Vserver**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Volume**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

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

#### **Template**
Specify to get an empty object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CloneDeletionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Clone.CloneDeletionInfo

---

### Notes
Category: clone
API: clone-deletion-get-iter
Family: cluater, vserver

---

### Syntax
```PowerShell
Get-NcCloneDeletion [-Attributes <CloneDeletionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [[-Vserver] <String[]>] [[-Volume] <String[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneDeletion -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneDeletion -Query <CloneDeletionInfo> [-Attributes <CloneDeletionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
