Get-NcQtree
-----------

### Synopsis
List the qtrees in a cluster or vserver.

---

### Description

List the qtrees in a cluster or vserver.

---

### Related Links
* [New-NcQtree](New-NcQtree)

---

### Examples
> Example 1

Get-NcQtree
List all qtrees in all vservers.

Volume                 Qtree  Status SecurityStyle Oplocks Vserver
------                 -----  ------ ------------- ------- -------
Barker01_root_vol             normal unix          enabled Barker01
SharePoint_Fuji02_Data        normal unix          enabled Barker01
Barker03                      normal unix          enabled Barker03
root_vol                      normal mixed         enabled cifs
Knight01_root_vol             normal ntfs          enabled Knight01
test                   qtree3 normal unix          enabled Knight01
test                   qtree2 normal unix          enabled Knight01
test                          normal unix          enabled Knight01
Knight02_root_vol             normal ntfs          enabled Knight02
root_vol                      normal mixed         enabled Krieger01
vol1                          normal mixed         enabled Krieger01
Lionetti01                    normal unix          enabled Lionetti01
SharePointCmode_Vol1          normal ntfs          enabled Lionetti01
VMSet1                        normal mixed         enabled Lionetti01
VMSet2                        normal mixed         enabled Lionetti01
VMSet3                        normal mixed         enabled Lionetti01
VMSet4                        normal mixed         enabled Lionetti01
VMSet5                        normal mixed         enabled Lionetti01
VMSet6                        normal mixed         enabled Lionetti01
mun01_root_vol                normal ntfs          enabled Mun01
exchange_vol_1                normal ntfs          enabled Parker01
parker_vol_root               normal ntfs          enabled Parker01
sqlvoldata1                   normal ntfs          enabled Parker01
sqlvoldata2                   normal ntfs          enabled Parker01
parker02_root_vol             normal ntfs          enabled Parker02
SQL_fuji6_data1               normal ntfs          enabled Parker02
SQL_fuji6_data2               normal ntfs          enabled Parker02

> Example 2

$q = Get-NcQtree -template
$q.SecurityStyle = "mixed"
Get-NcQtree -Query $q
List all qtrees with a mixed security style.  The same result could have been obtained using:

Get-NcQtree | where { $_.SecurityStyle -eq "mixed" }

but the difference is that using the -Query attribute offloads all of the processing to Data ONTAP so that only the objects of interest are returned to PowerShell.

Volume   Qtree Status SecurityStyle Oplocks Vserver
------   ----- ------ ------------- ------- -------
root_vol       normal mixed         enabled cifs
root_vol       normal mixed         enabled Krieger01
vol1           normal mixed         enabled Krieger01
VMSet1         normal mixed         enabled Lionetti01
VMSet2         normal mixed         enabled Lionetti01
VMSet3         normal mixed         enabled Lionetti01
VMSet4         normal mixed         enabled Lionetti01
VMSet5         normal mixed         enabled Lionetti01
VMSet6         normal mixed         enabled Lionetti01

---

### Parameters
#### **Volume**
The volume(s) containing the qtrees to get.  Data ONTAP wildcards are permitted.  This parameter may also be the complete path of the qtree in the format /vol/<volume>/<qtree>, in which case only one path may be specified in this parameter and the Qtree parameter must not be specified.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Path   |

#### **Qtree**
The name of one or more qtrees to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a QtreeInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "GetNcQtree -Template" to get the initially empty QtreeInfo object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[QtreeInfo]`|false   |named   |false        |

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
Specify to get an empty QtreeInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QtreeInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQtree -Template" to get the initially empty QtreeInfo object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[QtreeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qtree.QtreeInfo

---

### Notes
Category: qtree
API: qtree-list-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcQtree [[-Volume] <String[]>] [[-Qtree] <String[]>] [-VserverContext <String>] [-Attributes <QtreeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQtree [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQtree [-VserverContext <String>] -Query <QtreeInfo> [-Attributes <QtreeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
