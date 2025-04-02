Get-NcCifsUserAndUserMembership
-------------------------------

### Synopsis
Retrieve a local users' membership information from the CIFS server.

---

### Description

Retrieve a local users' membership information from the CIFS server.

---

### Related Links
* [Get-NcCifsUserAndGroupMember](Get-NcCifsUserAndGroupMember)

---

### Examples
> Example 1

Get-NcCifsUserAndUserMembership
Get group membership information for all local users.

Membership                    NcController                  UserName                      Vserver
----------                    ------------                  --------                      -------
{BUILTIN\Administrators}      10.63.1.234                   APARA1\Administrator          secondary1

---

### Parameters
#### **Vserver**
Restrict the results to one or more Vservers. Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
The name of the local user. Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|UserName|

#### **Attributes**
For improved scalability in large clusters, provide a CifsUsersAndGroupLocalUserMembership object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[CifsUsersAndGroupLocalUserMembership]`|false   |named   |false        |

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

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[CifsUsersAndGroupLocalUserMembership]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsUsersAndGroupLocalUserMembership

---

### Notes
Category: cifs
API: cifs-users-and-group-local-user-membership-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsUserAndUserMembership [[-Vserver] <String[]>] [[-Name] <String[]>] [-Attributes <CifsUsersAndGroupLocalUserMembership>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsUserAndUserMembership -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsUserAndUserMembership -Query <CifsUsersAndGroupLocalUserMembership> [-Attributes <CifsUsersAndGroupLocalUserMembership>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
