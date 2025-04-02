Get-NcCifsLocalUser
-------------------

### Synopsis
Get the list of CIFS local users.

---

### Description

Get the list of CIFS local users.

---

### Related Links
* [New-NcCifsLocalUser](New-NcCifsLocalUser)

* [Set-NcCifsLocalUser](Set-NcCifsLocalUser)

* [Rename-NcCifsLocalUser](Rename-NcCifsLocalUser)

* [Remove-NcCifsLocalUser](Remove-NcCifsLocalUser)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsLocalUser
Get all of the local users for the current cluster.

Description                : Built-in administrator account
FullName                   :
IsAccountDisabled          : True
NcController               : 10.63.165.62
UserName                   : BEAM02\Administrator
Vserver                    : beam01
IsAccountDisabledSpecified : True

Description                :
FullName                   : Bort Samson
IsAccountDisabled          : False
NcController               : 10.63.165.62
UserName                   : BEAM02\bort
Vserver                    : beam01
IsAccountDisabledSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcCifsLocalUser -Template
$q.FullName = "*Samson"
Get-NcCifsLocalUser -Query $q
Get all of the CIFS local users with the given surname.

Description                :
FullName                   : Bort Samson
IsAccountDisabled          : False
NcController               : 10.63.165.62
UserName                   : BEAM02\bort
Vserver                    : beam01
IsAccountDisabledSpecified : True

```

---

### Parameters
#### **UserName**
One of more CIFS local users to get.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Restrict results to one or more Vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsLocalUser object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsLocalUser -Template" to get the initially empty CifsLocalUser object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsLocalUser]`|false   |named   |false        |

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
Specify to get an empty CifsLocalUser object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsLocalUser object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsLocalUser -Template" to get the initially empty CifsLocalUser object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsLocalUser]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsLocalUser

---

### Notes
Category: cifs
API: cifs-local-user-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsLocalUser [[-UserName] <String[]>] [[-Vserver] <String[]>] [-Attributes <CifsLocalUser>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalUser -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsLocalUser -Query <CifsLocalUser> [-Attributes <CifsLocalUser>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
