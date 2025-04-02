Get-NcPerfArchiveDatastore
--------------------------

### Synopsis
Retrieves information about all the performance archive  datastores in the cluster and their datafiles.

---

### Description

Retrieves information about all the performance archive  datastores in the cluster and their datafiles.

Each performance archive-enabled process in the Data ONTAP cluster will have one  or more datastores in which the archive datafiles are stored. These datastores encapsulate the archived performance data in groupings specified by the Data ONTAP cluster's performance preset configurations.

---

### Related Links
* [Get-NcPerfArchiveConfig](Get-NcPerfArchiveConfig)

---

### Parameters
#### **AgeFilter**
Specify to filter the retrieved information to only include specific datafiles. Possible values : all, newest, oldest

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ExcludePartial**
Specify to exclude partial datafiles

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Node**
Restrict results by specifying one or more owner nodes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **Process**
Restrict results by specifying one or more owner processes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|ProcessName|

#### **Datastore**
Restrict results by specifying one or more datastore names.  Data ONTAP wildcards are permitted

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|DatastoreName<br/>Name|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                        |Required|Position|PipelineInput|Aliases          |
|----------------------------|--------|--------|-------------|-----------------|
|`[PerfArchiveDatastoreInfo]`|false   |named   |false        |DesiredAttributes|

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

#### **Query**
A query that specifies which objects to return.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[PerfArchiveDatastoreInfo]`|true    |named   |false        |

#### **Template**
Can be used to obtain an empty object to use with Attribute or Query

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.PerfArchiveDatastoreInfo

---

### Notes
Category: perf
API: perf-archive-datastore-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcPerfArchiveDatastore [-AgeFilter <String>] [-ExcludePartial] [-Node <String[]>] [-Process <String[]>] [-Datastore <String[]>] [-Attributes <PerfArchiveDatastoreInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfArchiveDatastore [-AgeFilter <String>] [-ExcludePartial] -Query <PerfArchiveDatastoreInfo> [-Attributes <PerfArchiveDatastoreInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfArchiveDatastore -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
