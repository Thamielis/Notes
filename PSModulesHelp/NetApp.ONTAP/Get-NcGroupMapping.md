Get-NcGroupMapping
------------------

### Synopsis
Get the list of group mappings in the cluster.

---

### Description

Get the list of group mappings in the cluster.

---

### Related Links
* [New-NcGroupMapping](New-NcGroupMapping)

* [Set-NcGroupMapping](Set-NcGroupMapping)

* [Remove-NcGroupMapping](Remove-NcGroupMapping)

* [Move-NcGroupMapping](Move-NcGroupMapping)

---

### Examples
> Example 1

```PowerShell
Get-NcGroupMapping -Direction unix_win
Get all of the unix_win group mappings.

Direction         : unix_win
NcController      : 10.63.165.62
Pattern           : cifs
Position          : 1
Replacement       : EXAMPLE\\Domain Groups
Vserver           : repo
PositionSpecified : True

Direction         : unix_win
NcController      : 10.63.165.62
Pattern           : root
Position          : 2
Replacement       : EXAMPLE\\Administrators
Vserver           : repo
PositionSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcGroupMapping -Template
$q.Direction = "win_unix"
$q.Replacement = "backup"
Get-NcGroupMapping -Query $q
Get all of the win_unix group mappings that map the unix 'backup' group.

Direction         : win_unix
NcController      : 10.63.165.62
Pattern           : EXAMPLE\\Backup Users
Position          : 1
Replacement       : backup
Vserver           : repo
PositionSpecified : True

```

---

### Parameters
#### **Position**
The position of one or more name mappings in the list of name mappings.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Int16][]]`|false   |1       |true (ByPropertyName)|

#### **Direction**
The direction which the name mapping is applied.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an GroupMappingInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcGroupMapping -Template" to get the initially empty GroupMappingInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[GroupMappingInfo]`|false   |named   |false        |

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
Specify to get an empty GroupMappingInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an GroupMappingInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcGroupMapping -Template" to get the initially empty GroupMappingInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[GroupMappingInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.GroupMapping.GroupMappingInfo

---

### Notes
Category: group mapping
API: group-mapping-get-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcGroupMapping [[-Position] <Int16][]>] [[-Direction] <String[]>] [[-Vserver] <String[]>] [-Attributes <GroupMappingInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGroupMapping -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGroupMapping -Query <GroupMappingInfo> [-Attributes <GroupMappingInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
