Get-NcCifsUserAndGroupMember
----------------------------

### Synopsis
Get the list of local group members from the CIFS vserver.

---

### Description

Get the list of local group members from the CIFS vserver.

---

### Related Links
* [Get-NcCifsUserAndUserMembership](Get-NcCifsUserAndUserMembership)

---

### Examples
> Example 1

Get-NcCifsUserAndGroupMember
Get membership of all local groups.

GroupName                     Member                        NcController                  Vserver
---------                     ------                        ------------                  -------
BUILTIN\Users                 {NASLAB\Domain Users}         10.63.1.234                   secondary1
BUILTIN\Guests                {NASLAB\Domain Guests}        10.63.1.234                   secondary1
BUILTIN\Administrators        {APARA1\Administrator, NAS... 10.63.1.234                   secondary1

---

### Parameters
#### **Vserver**
Restrict the results to one or more Vservers. Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
The name of the local group. Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |2       |true (ByPropertyName)|GroupName|

#### **Attributes**
For improved scalability in large clusters, provide a CifsUsersAndGroupLocalGroupMembers object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[CifsUsersAndGroupLocalGroupMembers]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty CifsServerConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsServerConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsServer -Template" to get the initially empty CifsServerConfig object.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[CifsUsersAndGroupLocalGroupMembers]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsUsersAndGroupLocalGroupMembers

---

### Notes
Category: cifs
API: cifs-users-and-group-local-group-members-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsUserAndGroupMember [[-Vserver] <String[]>] [[-Name] <String[]>] [-Attributes <CifsUsersAndGroupLocalGroupMembers>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsUserAndGroupMember -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsUserAndGroupMember -Query <CifsUsersAndGroupLocalGroupMembers> [-Attributes <CifsUsersAndGroupLocalGroupMembers>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
