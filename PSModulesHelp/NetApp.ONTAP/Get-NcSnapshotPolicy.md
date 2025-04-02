Get-NcSnapshotPolicy
--------------------

### Synopsis
Get information about snapshot policies.

---

### Description

Get information about snapshot policies.

---

### Related Links
* [New-NcSnapshotPolicy](New-NcSnapshotPolicy)

* [Get-NcJobCronSchedule](Get-NcJobCronSchedule)

---

### Examples
> Example 1

Get-NcSnapshotPolicy
Get all snapshot policies.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
default               True   {hourly (6), daily (2), weekly (2)}
none                  False
testSnapPolicy        True   {8hour (1), 5min (2)}

---

### Parameters
#### **Name**
Restrict results to the specified policies.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Policy |

#### **Attributes**
For improved scalability in large clusters, provide a SnapshotPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapshotPolicy -Template" to get the initially empty SnapshotPolicyInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SnapshotPolicyInfo]`|false   |named   |false        |

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
Specify to get an empty SnapshotPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a SnapshotPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapshotPolicy -Template" to get the initially empty SnapshotPolicyInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SnapshotPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapshot.SnapshotPolicyInfo

---

### Notes
Category: snapshot
API: snapshot-policy-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapshotPolicy [[-Name] <String[]>] [-Attributes <SnapshotPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapshotPolicy -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapshotPolicy -Query <SnapshotPolicyInfo> [-Attributes <SnapshotPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
