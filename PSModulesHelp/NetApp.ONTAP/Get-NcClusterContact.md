Get-NcClusterContact
--------------------

### Synopsis
Returns the contact information.

---

### Description

Returns the detailed contact information for the cluster.

---

### Related Links
* [Set-NcClusterContact](Set-NcClusterContact)

* [Get-NcCluster](Get-NcCluster)

* [Set-NcCluster](Set-NcCluster)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterContact
Gets the contact information of the current Controller

Address           : Bangalore
BusinessName      : NetApp
City              : 
Country           : 
NcController      : 10.238.49.117
PrimaryAltPhone   : 
PrimaryEmail      : ""
PrimaryName       : Aparajita Raychaudhury
PrimaryPhone      : 
SecondaryAltPhone : 
SecondaryEmail    : 
SecondaryName     : 
SecondaryPhone    : 
State             : 
ZipCode           :

```

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterContact

---

### Notes
Category: cluster
API: cluster-contact-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterContact [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
