Get-NcCifsPrivilege
-------------------

### Synopsis
Retrieve the list of local groups.

---

### Description

Retrieve the list of local groups.

---

### Related Links
* [Add-NcCifsPrivilege](Add-NcCifsPrivilege)

* [Remove-NcCifsPrivilege](Remove-NcCifsPrivilege)

* [Reset-NcCifsPrivilege](Reset-NcCifsPrivilege)

---

### Examples
> Example 1

Get-NcCifsPrivilege
Get CIFS privileges for all users and groups for the current cluster.

Privileges                    UserOrGroupName               Vserver
----------                    ---------------               -------
{sebackupprivilege, serest... BEAM02\bort                   beam01

> Example 2

$q = Get-NcCifsPrivilege -Template
$q.Privileges = @("serestoreprivilege")
Get-NcCifsPrivilege -Query $q
Get all of the CIFS privileges with the "serestoreprivilege".

Privileges                    UserOrGroupName               Vserver
----------                    ---------------               -------
{sebackupprivilege, serest... BEAM02\bort                   beam01

---

### Parameters
#### **Name**
The name of one or more local or Active Directory users or groups.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|UserOrGroupName|

#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsPrivilege object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsPrivilege -Template" to get the initially empty CifsPrivilege object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsPrivilege]`|false   |named   |false        |

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
Specify to get an empty CifsPrivilege object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsPrivilege object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsPrivilege -Template" to get the initially empty CifsPrivilege object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsPrivilege]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsPrivilege

---

### Notes
Category: cifs
API: cifs-privilege-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcCifsPrivilege [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <CifsPrivilege>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPrivilege -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPrivilege -Query <CifsPrivilege> [-Attributes <CifsPrivilege>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
