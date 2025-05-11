Get-NcCifsBranchCache
---------------------

### Synopsis
Get CIFS BranchCache configurations.

---

### Description

Get CIFS BranchCache configurations.

---

### Related Links
* [Set-NcCifsBranchCache](Set-NcCifsBranchCache)

* [Remove-NcCifsBranchCache](Remove-NcCifsBranchCache)

* [New-NcCifsBranchCache](New-NcCifsBranchCache)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsBranchCache
Get the CIFS BranchCache configurations for the current cluster.

HashStoreMaxSize : 26843545600
HashStorePath    : /hashes
NcController     : 10.63.165.62
OperatingMode    : per_share
ServerKey        :
Versions         : {enable_all}
Vserver          : beam01

```
> Example 2

```PowerShell
$query = Get-NcCifsBranchCache -Template
$query.HashStoreMaxSize = ">20GB"
Get-NcCifsBranchCache -Query $query
Get all of the CIFS BranchCache configurations in the cluster with a HashStoreMaxSize greater than 20GB.

HashStoreMaxSize : 26843545600
HashStorePath    : /hashes
NcController     : 10.63.165.62
OperatingMode    : per_share
ServerKey        :
Versions         : {enable_all}
Vserver          : beam01

```

---

### Parameters
#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsBranchcache object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsBranchCache -Template" to get the initially empty CifsBranchcache object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CifsBranchcache]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty CifsBranchcache object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsBranchcache object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsBranchCache -Template" to get the initially empty CifsBranchcache object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CifsBranchcache]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsBranchcache

---

### Notes
Category: cifs
API: cifs-branchcache-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsBranchCache [[-Vserver] <String[]>] [-Attributes <CifsBranchcache>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsBranchCache -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsBranchCache -Query <CifsBranchcache> [-Attributes <CifsBranchcache>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
