Get-NcVol
---------

### Synopsis
Get a list of volumes.

---

### Description

Get a list of volumes.

---

### Related Links
* [New-NcVol](New-NcVol)

---

### Examples
> Example 1

Get-NcVol
Get all volumes on the currently connected controller (which may be a cluster or a vserver).

Name         State  TotalSize Used Available Dedupe Aggregate                   Vserver
----         -----  --------- ---- --------- ------ ---------                   -------
georgeVol1   online   20.0 MB  55%    8.8 MB False  aggr1                       vserver1
vol0         online  113.3 GB   8%  104.0 GB False  aggr0                       fas3070cluster01-01
vol0         online  113.3 GB   8%  104.0 GB False  aggr0_fas3070cluster01_02_0 fas3070cluster01-02
vol1         online   20.0 GB   5%   19.0 GB False  aggr1                       vserver1
vserver1vol0 online   20.0 MB   5%   18.9 MB False  aggr1                       vserver1
vserver2vol0 online   20.0 MB   5%   18.9 MB False  aggr1                       vserver2

> Example 2

Get-NcVol vol0
Get all volumes named 'node0'.

Name State  TotalSize Used Available Dedupe Aggregate                   Vserver
---- -----  --------- ---- --------- ------ ---------                   -------
vol0 online  113.3 GB   8%  104.0 GB False  aggr0_fas3070cluster01_02_0 fas3070cluster01-02
vol0 online  113.3 GB   8%  104.0 GB False  aggr0                       fas3070cluster01-01

> Example 3

$v = Get-NcVol -Template
Initialize-NcObjectProperty $v VolumeStateAttributes
$v.VolumeStateAttributes.IsVserverRoot = $true
Get-NcVol -Query $v | select Name, Vserver | ft -AutoSize
Use an advanced query to list the vserver root volumes.

Name         Vserver
----         -------
vserver1vol0 vserver1
vserver2vol0 vserver2

---

### Parameters
#### **Name**
The name of one or more volumes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Volume |

#### **Aggregate**
Restrict results to the specified aggregates.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                     |
|------------|--------|--------|---------------------|----------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|ContainingAggregate<br/>Aggr|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a VolumeAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVol -Template" to get the initially empty VolumeAttributes object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VolumeAttributes]`|false   |named   |false        |

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
Specify to get an empty VolumeAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a VolumeAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVol -Template" to get the initially empty VolumeAttributes object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VolumeAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVol [[-Name] <String[]>] [-Aggregate <String[]>] [-Vserver <String[]>] [-Attributes <VolumeAttributes>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVol -Template [-Fill] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVol -Query <VolumeAttributes> [-Attributes <VolumeAttributes>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
