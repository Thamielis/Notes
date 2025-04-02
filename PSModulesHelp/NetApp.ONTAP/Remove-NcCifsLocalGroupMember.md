Remove-NcCifsLocalGroupMember
-----------------------------

### Synopsis
Remove local users or Active Directory users or groups from a local group.

---

### Description

Remove local users or Active Directory users or groups from a local group.

---

### Related Links
* [Add-NcCifsLocalGroupMember](Add-NcCifsLocalGroupMember)

* [Get-NcCifsLocalGroupMember](Get-NcCifsLocalGroupMember)

---

### Examples
> Example 1

```PowerShell
Remove-NcCifsLocalGroupMember -Name 'PowerShell Users' -Member bort
Remove bort from the 'PowerShell Users' local group.
```

---

### Parameters
#### **Name**
The name of the local group.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|GroupName|

#### **Member**
Names of Users or Active Directory groups to be removed.

|Type        |Required|Position|PipelineInput        |Aliases                             |
|------------|--------|--------|---------------------|------------------------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|UserName<br/>Members<br/>MemberNames|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cifs
API: cifs-local-group-members-remove-members
Family: vserver

---

### Syntax
```PowerShell
Remove-NcCifsLocalGroupMember [-Name] <String> [-Member] <String[]> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
