Get-NcCifsLocalGroupMember
--------------------------

### Synopsis
Get the list of local group members.

---

### Description

Get the list of local group members.

---

### Related Links
* [Add-NcCifsLocalGroupMember](Add-NcCifsLocalGroupMember)

* [Remove-NcCifsLocalGroupMember](Remove-NcCifsLocalGroupMember)

---

### Examples
> Example 1

Get-NcCifsLocalGroupMember
Get all of the CIFS local group members.

GroupName                     Member                        NcController                  Vserver
---------                     ------                        ------------                  -------
BEAM02\PowerShell Users       BEAM02\bort                   10.63.165.62                  beam01
BUILTIN\Administrators        BEAM02\Administrator          10.63.165.62                  beam01
BUILTIN\Administrators        RTPRRE\Domain Admins          10.63.165.62                  beam01
BUILTIN\Users                 RTPRRE\Domain Users           10.63.165.62                  beam01

---

### Parameters
#### **Name**
The name of one or more CIFS local groups to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|GroupName|

#### **Member**
The name of one or more members of the CIFS local group.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsLocalGroupMember object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsLocalGroupMember -Template" to get the initially empty CifsLocalGroupMember object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[CifsLocalGroupMembers]`|false   |named   |false        |

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
Specify to get an empty CifsLocalGroupMember object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsLocalGroupMember object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-CifsLocalGroupMember -Template" to get the initially empty CifsLocalGroupMember object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[CifsLocalGroupMembers]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsLocalGroupMembers

---

### Notes
Category: cifs
API: cifs-local-group-members-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsLocalGroupMember [[-Name] <String[]>] [[-Member] <String[]>] [[-Vserver] <String[]>] [-Attributes <CifsLocalGroupMembers>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalGroupMember -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalGroupMember -Query <CifsLocalGroupMembers> [-Attributes <CifsLocalGroupMembers>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
