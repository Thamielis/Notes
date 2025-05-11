Get-NcClusterImageUpdateLog
---------------------------

### Synopsis
Get details from the update log

---

### Description

Get details from the update log

---

### Related Links
* [Get-NcClusterImageUpdateHistory](Get-NcClusterImageUpdateHistory)

* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterImageUpdateLog -TransactionId 1
Get details of transaction 1

ComponentId               : f3250-215-73-75-01
DetailedTransactionStatus :
NcController              : 10.225.215.73
StartDateTime             : 1403154462
TransactionId             : 1
TransactionName           : process-package
TransactionPhase          : package-management
TransactionStatus         : completed
TransactionIdSpecified    : True

```

---

### Parameters
#### **ComponentId**
Restrict results to specific components (like a node) by specifying their IDs (node name).

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Name<br/>NodeName|

#### **TransactionId**
Get the log of one specific transaction using the transaction ID

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterUpdateTransactionLogInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcClusterImageUpdateLog -Template" to get the initially empty ClusterUpdateTransactionLogInfo object.  If not specified, all data is returned for each object.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[ClusterUpdateTransactionLogInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty ClusterUpdateTransactionLogInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterUpdateTransactionLogInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterImageUpdateLog -Template" to get the initially empty ClusterUpdateTransactionLogInfo object.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[ClusterUpdateTransactionLogInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterUpdateTransactionLogInfo

---

### Notes
Category: cluster image
API: cluster-image-update-log-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImageUpdateLog [-ComponentId <String[]>] [-TransactionId <Int64>] [-Attributes <ClusterUpdateTransactionLogInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateLog -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateLog -Query <ClusterUpdateTransactionLogInfo> [-Attributes <ClusterUpdateTransactionLogInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
