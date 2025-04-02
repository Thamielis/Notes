Get-NcMetrocluster
------------------

### Synopsis
Get MetroCluster configuration information.

---

### Description

Get MetroCluster configuration information.

---

### Related Links
* [Register-NcMetrocluster](Register-NcMetrocluster)

* [Unregister-NcMetrocluster](Unregister-NcMetrocluster)

* [Test-NcMetrocluster](Test-NcMetrocluster)

---

### Examples
> Example 1

```PowerShell
Get-NcMetrocluster
Get the metrocluster status before it is configured.

LocalClusterName         : beam-mcc-01
LocalConfigurationState  : not_configured
LocalMode                : 
NcController             : 10.63.10.33
RemoteClusterName        : beam-mcc-02
RemoteConfigurationState : not_configured
RemoteMode               :

```
> Example 2

```PowerShell
Get-NcMetrocluster
Get the MetroCluster status after it has been configured.

LocalClusterName         : beam-mcc-01
LocalConfigurationState  : configured
LocalMode                : normal
NcController             : 10.63.10.33
RemoteClusterName        : beam-mcc-02
RemoteConfigurationState : configured
RemoteMode               : normal

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetrocluster -Template" to get the initially empty MetroclusterInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[MetroclusterInfo]`|false   |named   |false        |

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
* DataONTAP.C.Types.Metrocluster.MetroclusterInfo

---

### Notes
Category: metrocluster
API: metrocluster-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetrocluster [-Attributes <MetroclusterInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
