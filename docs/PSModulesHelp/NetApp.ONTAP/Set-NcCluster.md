Set-NcCluster
-------------

### Synopsis
Modifies the cluster identity information.

---

### Description

Modifies the cluster identity information.

---

### Related Links
* [Get-NcCluster](Get-NcCluster)

---

### Examples
> Example 1

```PowerShell
Set-NcCluster -Location "Main data center"
Update the location info for the cluster.

NcController        : 10.61.172.155
ClusterContact      : Gil Bryant
ClusterLocation     : Main data center
ClusterName         : fas3070cluster01
ClusterSerialNumber : 1-80-000011
ClusterUuid         : 47abfcef-758f-11e0-999d-123478563412

```

---

### Parameters
#### **Name**
The textual name of the cluster

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |1       |true (ByPropertyName)|ClusterName|

#### **Location**
The location of the cluster

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|false   |2       |true (ByPropertyName)|ClusterLocation|

#### **Contact**
The contact information for the cluster

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |3       |true (ByPropertyName)|ClusterContact|

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
* DataONTAP.C.Types.Cluster.ClusterIdentityInfo

---

### Notes
Category: cluster
API: cluster-identity-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcCluster [[-Name] <String>] [[-Location] <String>] [[-Contact] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
