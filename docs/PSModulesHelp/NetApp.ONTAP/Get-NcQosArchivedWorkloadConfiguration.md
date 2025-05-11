Get-NcQosArchivedWorkloadConfiguration
--------------------------------------

### Synopsis
Get the cluster-wide QoS workload archival settings. This cmdlet is supported only in ONTAP versions below 8.3

---

### Description

Get the cluster-wide QoS workload archival settings. This cmdlet is supported only in ONTAP versions below 8.3

---

### Related Links
* [Set-NcQosArchivedWorkloadConfiguration](Set-NcQosArchivedWorkloadConfiguration)

---

### Examples
> Example 1

Get-NcQosArchivedWorkloadConfiguration
Get the cluster QoS archived workload settings.

MaxWorkloads
------------
        2000

---

### Parameters
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
* DataONTAP.C.Types.Qos.QosSettingsArchivedWorkloadInfo

---

### Notes
Category: qos
API: qos-settings-archived-workload-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosArchivedWorkloadConfiguration [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
