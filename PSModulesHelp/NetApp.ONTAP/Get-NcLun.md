Get-NcLun
---------

### Synopsis
Get LUNs in a cluster or vserver.

---

### Description

Get LUNs in a cluster or vserver.

---

### Related Links
* [New-NcLun](New-NcLun)

* [Remove-NcLun](Remove-NcLun)

---

### Examples
> Example 1

Get-NcLun
List all LUNs.

Path                                           Size Protocol
----                                           ---- --------
/vol/SharePoint_Fuji02_Data/Fuji02_Sh...   647.4 GB windows
/vol/test/lun1                              10.0 MB vmware
/vol/test/lun2                              10.0 MB image
/vol/test/lun3                              10.0 MB image
/vol/test/lun4                              10.0 MB image
/vol/test/lun5                              39.2 MB hyper_v
/vol/SharePointCmode_Vol1/SPCmodeTest       90.0 GB windows_2008
/vol/VMSet1/fulltest                       400.1 GB windows_2008
/vol/VMSet1/VM1                            100.0 GB windows_gpt
/vol/VMSet1/VM2                            100.0 GB windows_gpt
/vol/VMSet2/DataFabricManager              100.0 GB windows_gpt
/vol/VMSet2/SANScreen                      100.0 GB windows_gpt
/vol/VMSet2/SANScreenData                  120.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot1                100.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot4                100.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot5                100.0 GB windows_gpt
/vol/VMSet4/PowerShell1dot2                100.0 GB windows_gpt
/vol/VMSet4/PowerShell1dot3                100.0 GB windows_gpt
/vol/VMSet5/SCOMSCVMM                      100.0 GB windows_gpt
/vol/VMSet5/SCOMSCVMMData                  100.0 GB windows_gpt
/vol/VMSet5/SMISAgent                      100.0 GB windows_gpt
/vol/VMSet6/Powershell1dot6                100.0 GB windows_gpt
/vol/VMSet6/SCOMSCVMM2012                  100.0 GB windows_gpt
/vol/VMSet6/SCOMSCVMM2012Data              100.0 GB windows_gpt
/vol/exchange_vol_1/Exchange01             500.1 GB hyper_v
/vol/sqlvoldata1/SQLData_Lun_1              25.0 GB windows
/vol/sqlvoldata1/SQLData_Lun_2             120.0 GB hyper_v
/vol/sqlvoldata2/SQLData_Lun_3             120.0 GB hyper_v
/vol/SQL_fuji6_data2/SQLData2               50.0 GB hyper_v

> Example 2

Get-NcLun /vol/VMSet*
List all LUNs with the specified name pattern.

Path                                           Size Protocol
----                                           ---- --------
/vol/VMSet1/fulltest                       400.1 GB windows_2008
/vol/VMSet1/VM1                            100.0 GB windows_gpt
/vol/VMSet1/VM2                            100.0 GB windows_gpt
/vol/VMSet2/DataFabricManager              100.0 GB windows_gpt
/vol/VMSet2/SANScreen                      100.0 GB windows_gpt
/vol/VMSet2/SANScreenData                  120.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot1                100.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot4                100.0 GB windows_gpt
/vol/VMSet3/PowerShell1dot5                100.0 GB windows_gpt
/vol/VMSet4/PowerShell1dot2                100.0 GB windows_gpt
/vol/VMSet4/PowerShell1dot3                100.0 GB windows_gpt
/vol/VMSet5/SCOMSCVMM                      100.0 GB windows_gpt
/vol/VMSet5/SCOMSCVMMData                  100.0 GB windows_gpt
/vol/VMSet5/SMISAgent                      100.0 GB windows_gpt
/vol/VMSet6/Powershell1dot6                100.0 GB windows_gpt
/vol/VMSet6/SCOMSCVMM2012                  100.0 GB windows_gpt
/vol/VMSet6/SCOMSCVMM2012Data              100.0 GB windows_gpt

---

### Parameters
#### **Path**
The path of one or more LUNs to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Lun<br/>Name|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Volume**
Restrict results to the specified volume(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Vol    |

#### **Qtree**
Restrict results to the specified qtree(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a LunInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLun -Template" to get the initially empty LunInfo object.  If not specified, all data is returned for each object.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[LunInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty LunInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLun -Template" to get the initially empty LunInfo object.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[LunInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLun [[-Path] <String[]>] [-Vserver <String[]>] [-Volume <String[]>] [-Qtree <String[]>] [-VserverContext <String>] [-Attributes <LunInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLun [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLun [-VserverContext <String>] -Query <LunInfo> [-Attributes <LunInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
