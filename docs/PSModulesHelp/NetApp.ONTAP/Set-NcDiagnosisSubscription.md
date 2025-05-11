Set-NcDiagnosisSubscription
---------------------------

### Synopsis
Modify system health subscription.

---

### Description

Modify system health subscription.

---

### Related Links
* [New-NcDiagnosisSubscription](New-NcDiagnosisSubscription)

* [Get-NcDiagnosisSubscription](Get-NcDiagnosisSubscription)

---

### Examples
> Example 1

```PowerShell
Get-NcDiagnosisSubscription -SubscriptionId Test | Set-NcDiagnosisSubscription -PscOption $false
Set the PscOption to false for the subscription with the ID Test.

Node                     : vsim_cluster-01
SubscriptionId           : Test
NcController             : 192.168.182.144
ClassName                : nschm_shelf_info
CreationTime             : 1339512591
EventType                : rm_add
FailThresh               : 1
InstanceName             :
MaxNotifyPeriod          : 1
Monitor                  : node_connect
NotifyDestHm             : node_connect
NotifyDestNode           : vsim_cluster-01
NotifyFptr               :
NotifyTable              :
NotifyType               : dsmf_type
PscOption                : False
TimeGapNotify            : 2
FailThreshSpecified      : True
MaxNotifyPeriodSpecified : True
NotifyFptrSpecified      : False
PscOptionSpecified       : True
TimeGapNotifySpecified   : True

```

---

### Parameters
#### **Node**
Node hosting this health monitor and sends out notifications.

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
Health monitor subscribing for notification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ClassName**
Class name of changed resource.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **EventType**
Type of event for which notification is to be generated.  Possible values: rm-add, rm-del, rm-mod

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
API: diagnosis-subscriptions-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiagnosisSubscription -Node <String> -SubscriptionId <String> -Monitor <String> -NotifyDestNode <String> -NotifyDestHm <String> -ClassName <String> -EventType <String> [-InstanceName 
```
```PowerShell
<String>] [-NotifyTable <String>] [-FailThreshold <Int64>] [-PscOption <Boolean>] [-TimeGapNotify <Int32>] [-MaxNotifyPeriod <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
