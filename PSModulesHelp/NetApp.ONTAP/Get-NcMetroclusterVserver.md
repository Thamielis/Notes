Get-NcMetroclusterVserver
-------------------------

### Synopsis
Get a list of MetroCluster vserver info objects.

---

### Description

Get a list of MetroCluster vserver info objects.

---

### Related Links
* [Get-NcMetroclusterNode](Get-NcMetroclusterNode)

* [Get-NcMetrocluster](Get-NcMetrocluster)

---

### Examples
> Example 1

Get-NcMetroclusterVserver
Get all of the Vservers in the MetroCluster configuration.

Vserver                    PartnerVserver             ConfigurationState
-------                    --------------             ------------------
beam01                     beam01-mc                  healthy           
beam-mcc-01                beam-mcc-02                healthy           
beam-mcc-02                beam-mcc-01                healthy

> Example 2

Get-NcMetroclusterVserver -Query @{ConfigurationState="healthy"}
Get all of the "healthy" Vservers in the MetroCluster configuration.

Vserver                    PartnerVserver             ConfigurationState
-------                    --------------             ------------------
beam01                     beam01-mc                  healthy           
beam-mcc-01                beam-mcc-02                healthy           
beam-mcc-02                beam-mcc-01                healthy

---

### Parameters
#### **Cluster**
One or more cluster names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
One or more vserver names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterVserverInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterVserver -Template" to get the initially empty MetroclusterVserverInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[MetroclusterVserverInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterVserverInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterVserverInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterVserver -Template" to get the initially empty MetroclusterVserverInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[MetroclusterVserverInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterVserverInfo

---

### Notes
Category: metrocluster
API: metrocluster-vserver-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterVserver [[-Cluster] <String[]>] [[-Vserver] <String[]>] [-Attributes <MetroclusterVserverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterVserver -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterVserver -Query <MetroclusterVserverInfo> [-Attributes <MetroclusterVserverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
