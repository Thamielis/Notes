Get-NcIscsiStatistics
---------------------

### Synopsis
Get a list of iscsi statistics.

---

### Description

Get a list of iscsi statistics.

---

### Examples
> Example 1

Get-NcIscsiStatistics
Get the statistics for all of the iSCSI services running on the current cluster.

Vserver                        IscsiCdbStats          IscsiErrorStats       IscsiReceivedStats    IscsiTransmittedStats
-------                        -------------          ---------------       ------------------    ---------------------
Barker01                            42057120                        0                 42650861                 43969518
Barker03                                   0                        0                        0                        0
Kumar01                               221378                        0                   279207                   299867
Lionetti01                                13                        0                       96                       88

> Example 2

$q = Get-NcIscsiStatistics -Template -Fill
$q.IscsiReceivedStats.Info.Total = ">200000"
Get-NcIscsiStatistics -Query $q
Get iSCSI statistics information for iSCSI services that have received more than 200,000 PDUs.

Vserver                        IscsiCdbStats          IscsiErrorStats       IscsiReceivedStats    IscsiTransmittedStats
-------                        -------------          ---------------       ------------------    ---------------------
Barker01                            42073501                        0                 42667346                 43986577
Kumar01                               221384                        0                   279213                   299879

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide an IscsiStatsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiStatistics -Template" to get the initially empty IscsiStatsInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[IscsiStatsInfo]`|false   |named   |false        |

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

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Template**
Specify to get an empty IscsiStatsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiStatsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiStatistics -Template" to get the initially empty IscsiStatsInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[IscsiStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiStatsInfo

---

### Notes
Category: iscsi
API: iscsi-stats-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiStatistics [-Attributes <IscsiStatsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiStatistics [-Fill] -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiStatistics -Query <IscsiStatsInfo> [-Attributes <IscsiStatsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
