Get-NcDiagnosisSubscription
---------------------------

### Synopsis
Get a list of Subscriptions for Notifications objects.

---

### Description

Get a list of Subscriptions for Notifications objects.

---

### Related Links
* [New-NcDiagnosisSubscription](New-NcDiagnosisSubscription)

* [Set-NcDiagnosisSubscription](Set-NcDiagnosisSubscription)

---

### Examples
> Example 1

```PowerShell
Get-NcDiagnosisSubscription -EventType rm_add
Get all of the diagnosis subscriptions with event type "rm_add".

ClassName                : nschm_shelf_info
CreationTime             : 1339506150
EventType                : rm_add
FailThresh               : 1
InstanceName             :
MaxNotifyPeriod          : 1
Monitor                  : node_connect
NcController             : 192.168.182.144
Node                     : vsim_cluster-01
NotifyDestHm             : system_connect
NotifyDestNode           : vsim_cluster-01
NotifyFptr               :
NotifyTable              : mgwd_schm_helper_view
NotifyType               : dsmf_type
PscOption                : False
SubscriptionId           : SasShelfSubAdd
TimeGapNotify            : 2
FailThreshSpecified      : True
MaxNotifyPeriodSpecified : True
NotifyFptrSpecified      : False
PscOptionSpecified       : True
TimeGapNotifySpecified   : True

```
> Example 2

$q = Get-NcDiagnosisSubscription -Template
$q.NotifyType = "dsmf_type"
Get-NcDiagnosisSubscription -Query $q
Get the diagnosis subscriptions with the specified notify type.

Monitor          SubscriptionId           ClassName                EventType    NotifyDestHm     Node
-------          --------------           ---------                ---------    ------------     ----
node_connect     SasShelfSubAdd           nschm_shelf_info         rm_add       system_connect   vsim_cluster-01
node_connect     SasShelfSubDel           nschm_shelf_info         rm_del       system_connect   vsim_cluster-01
node_connect     SasShelfSubMod           nschm_shelf_info         rm_mod       system_connect   vsim_cluster-01

---

### Parameters
#### **Node**
One or more nodes hosting the health monitor.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SubscriptionId**
One or more subscription ids.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Monitor**
One or more health monitors.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NotifyDestNode**
One or more nodes hosting the health monitor that is subscribing for notification.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NotifyDestHm**
One or more health monitors subscribing for notification.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ClassName**
One or more class names of changed resource.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **EventType**
One or more type of event for which notification is generated.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisSubscriptionsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisSubscription -Template" to get the initially empty DiagnosisSubscriptionsInfo object.  If not specified, all data is returned for each object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DiagnosisSubscriptionsInfo]`|false   |named   |false        |

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
Specify to get an empty DiagnosisSubscriptionsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DiagnosisSubscriptionsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDiagnosisSubscription -Template" to get the initially empty DiagnosisSubscriptionsInfo object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DiagnosisSubscriptionsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisSubscriptionsInfo

---

### Notes
Category: diagnosis
API: diagnosis-subscriptions-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisSubscription [[-Node] <String[]>] [[-SubscriptionId] <String[]>] [-Monitor <String[]>] [-NotifyDestNode <String[]>] [-NotifyDestHm <String[]>] [-ClassName <String[]>] 
```
```PowerShell
[-EventType <String[]>] [-Attributes <DiagnosisSubscriptionsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubscription -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubscription -Query <DiagnosisSubscriptionsInfo> [-Attributes <DiagnosisSubscriptionsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
