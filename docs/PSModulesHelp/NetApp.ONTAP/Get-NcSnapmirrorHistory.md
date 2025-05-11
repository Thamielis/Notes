Get-NcSnapmirrorHistory
-----------------------

### Synopsis
Get information for one or several SnapMirror operations.

---

### Description

Get information for one or several SnapMirror operations. 

This cmdlet must be issued on the destination Vserver or the destination cluster of the relationship. This cmdlet can be used only in ONTAP 8.3 (or later). 

It returns all the SnapMirror operations, which have a destination endpoint in that Vserver or cluster, and that match the parameters specified. The Get-NcSnapmirrorHistory does not return information about operations which happened while operating prior to Data ONTAP 8.3. The cmdlet does not return information for relationships using a control plane compatible in ONTAP 8.1.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

Get-NcSnapmirrorHistory
Get the history for all SnapMirror operations.

SourceLocation                   DestinationLocation              OperationType      Result     Start
--------------                   -------------------              -------------      ------     -----
beam02:sm_source                 beam01:sm_dest                   initialize         failure    4/29/2014 1:41:02 PM
beam02:sm_source                 beam01:sm_dest                   initialize         failure    4/29/2014 1:42:03 PM
beam02:sm_source                 beam01:sm_dest                   delete             success    4/29/2014 2:03:15 PM
beam02:sm_source                 beam01:sm_dest                   create             success    4/29/2014 2:05:03 PM
beam02:sm_source                 beam01:sm_dest                   initialize         success    4/29/2014 2:05:36 PM

> Example 2

Get-NcSnapmirrorHistory -Query @{Result="failure"}
Get the history of all failed SnapMirror operations.

SourceLocation                   DestinationLocation              OperationType      Result     Start
--------------                   -------------------              -------------      ------     -----
beam02:sm_source                 beam01:sm_dest                   initialize         failure    4/29/2014 1:41:02 PM
beam02:sm_source                 beam01:sm_dest                   initialize         failure    4/29/2014 1:42:03 PM

> Example 3

```PowerShell
Get-NcSnapmirrorHistory -Query @{Result="failure"} | fl SourceLocation, DestinationLocation, AdditionalInfo
Get the details of an failed SnapMirror operations.

SourceLocation      : beam02:sm_source
DestinationLocation : beam01:sm_dest
AdditionalInfo      : SnapMirror_DP license check failed for cluster [DST Cluster]. Reason: SnapMirror DP License not
                      found.

SourceLocation      : beam02:sm_source
DestinationLocation : beam01:sm_dest
AdditionalInfo      : Destination beam01:sm_dest must be a data-protection volume.

```

---

### Parameters
#### **OperationId**
One or more unique identifiers assigned to a SnapMirror operation.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Destination**
Specifies the destination endpoint of the SnapMirror relationship in the format [vserver:]volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Source**
Specifies the source endpoint of the SnapMirror relationship in the format [vserver:]volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SnapmirrorHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapmirrorHistory -Template" to get the initially empty SnapmirrorHistoryInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SnapmirrorHistoryInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SnapmirrorHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnapmirrorHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapmirrorHistory -Template" to get the initially empty SnapmirrorHistoryInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SnapmirrorHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorHistoryInfo

---

### Notes
Category: snapmirror
API: snapmirror-history-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorHistory [[-OperationId] <String[]>] [-Destination <String[]>] [-Source <String[]>] [-Attributes <SnapmirrorHistoryInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorHistory -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorHistory -Query <SnapmirrorHistoryInfo> [-Attributes <SnapmirrorHistoryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
