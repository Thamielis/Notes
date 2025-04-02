New-NcDiagnosisSubscription
---------------------------

### Synopsis
Create a new subscription for notifications.

---

### Description

Create a new subscription for notifications.

---

### Related Links
* [Set-NcDiagnosisSubscription](Set-NcDiagnosisSubscription)

* [Get-NcDiagnosisSubscription](Get-NcDiagnosisSubscription)

---

### Examples
> Example 1

New-NcDiagnosisSubscription -Node vsim_cluster-01 -SubscriptionId Test2 -Monitor node_connect -NotifyDestNode vsim_cluster-01 -NotifyDestHm system_connect -ClassName nschm_shelf_info -EventType rm_add
Create a new diagnosis subscription.

Monitor          SubscriptionId           ClassName                EventType    NotifyDestHm     Node
-------          --------------           ---------                ---------    ------------     ----
node_connect     Test2                    nschm_shelf_info         rm_add       system_connect   vsim_cluster-01

---

### Parameters
#### **Node**
Node hosting the health monitor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SubscriptionId**
Subscription identifier.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Monitor**
Type of source health monitor (e.g. node_connect, system_connect, system).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **NotifyDestNode**
Node hosting the health monitor that is subscribing for notification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **NotifyDestHm**
Health monitor subsribing for notification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ClassName**
Class name of changed resource.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **EventType**
Type of event for which notification is to be generated.  Possible values:  rm-add, rm-del, rm-mod

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **InstanceName**
Instance name of changed resource.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NotifyTable**
Table name for DSMF notification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FailThreshold**
Failure threshold for notification.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int64]`|false   |named   |true (ByPropertyName)|FailThresh|

#### **PscOption**
If true, enable periodic status confirmation.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **TimeGapNotify**
Time Period between two notifications.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxNotifyPeriod**
Maximum expected time for notification to complete.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisSubscriptionsInfo

---

### Notes
Category: diagnosis
API: diagnosis-subscriptions-create
Family: cluster

---

### Syntax
```PowerShell
New-NcDiagnosisSubscription -Node <String> -SubscriptionId <String> -Monitor <String> -NotifyDestNode <String> -NotifyDestHm <String> -ClassName <String> -EventType <String> [-InstanceName 
```
```PowerShell
<String>] [-NotifyTable <String>] [-FailThreshold <Int64>] [-PscOption <Boolean>] [-TimeGapNotify <Int32>] [-MaxNotifyPeriod <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
