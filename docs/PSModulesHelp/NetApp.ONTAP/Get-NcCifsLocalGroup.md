Get-NcCifsLocalGroup
--------------------

### Synopsis
Get a list of CIFS local groups.

---

### Description

Get a list of CIFS local groups.

---

### Related Links
* [Set-NcCifsLocalGroup](Set-NcCifsLocalGroup)

* [New-NcCifsLocalGroup](New-NcCifsLocalGroup)

* [Rename-NcCifsLocalGroup](Rename-NcCifsLocalGroup)

* [Remove-NcCifsLocalGroup](Remove-NcCifsLocalGroup)

---

### Examples
> Example 1

Get-NcCifsLocalGroup
Get all of the CIFS local groups for the current cluster.

GroupName                           Vserver                  Description
---------                           -------                  -----------
BEAM02\PowerShell Toolkit Users     beam01                   Users that enjoy using the Data ONTAP PowerShell Toolkit
BUILTIN\Administrators              beam01                   Built-in Administrators group
BUILTIN\Backup Operators            beam01                   Backup Operators group
BUILTIN\Power Users                 beam01                   Restricted administrative privileges
BUILTIN\Users                       beam01                   All users

---

### Parameters
#### **Name**
The name of one or more CIFS local groups to get.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|GroupName|

#### **Vserver**
Restrict results to one or more Vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsLocalGroup object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsLocalGroup -Template" to get the initially empty CifsLocalGroup object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CifsLocalGroup]`|false   |named   |false        |

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
Specify to get an empty CifsLocalGroup object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsLocalGroup object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsLocalGroup -Template" to get the initially empty CifsLocalGroup object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CifsLocalGroup]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsLocalGroup

---

### Notes
Category: cifs
API: cifs-local-group-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsLocalGroup [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <CifsLocalGroup>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalGroup -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalGroup -Query <CifsLocalGroup> [-Attributes <CifsLocalGroup>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
