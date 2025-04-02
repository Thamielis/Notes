Set-NcGroupMapping
------------------

### Synopsis
Modify an existing group mapping entry.

---

### Description

Modify an existing group mapping entry.

---

### Related Links
* [Get-NcGroupMapping](Get-NcGroupMapping)

* [New-NcGroupMapping](New-NcGroupMapping)

* [Move-NcGroupMapping](Move-NcGroupMapping)

* [Remove-NcGroupMapping](Remove-NcGroupMapping)

---

### Examples
> Example 1

```PowerShell
Set-NcGroupMapping -Direction win_unix -Position 1 -Replacement backup_users
Change the replacement string for the win_unix group mapping at position 1.

Direction         : win_unix
NcController      : 10.63.165.62
Pattern           : EXAMPLE\\Backup Users
Position          : 1
Replacement       : backup_users
Vserver           : repo
PositionSpecified : True

```

---

### Parameters
#### **Direction**
Direction in which the group mapping is applied.
Possible values: 
"krb_unix"  - Kerberos principal name to UNIX user name mapping
"win_unix"  - Windows user name to UNIX user name mapping
"unix_win"  - UNIX user name to Windows user name mapping
Valid Values:

* krb_unix
* win_unix
* unix_win

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Position**
Position of an existing group mapping in the list of group mappings for this Vserver.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|

#### **Pattern**
Pattern to use to match the group while searching for a group that can be used as a replacement. The pattern is a UNIX-style regular expression. Regular expressions are case-insensitive when mapping from Windows to UNIX, and they are case-sensitive for mappings from Kerberos to UNIX and UNIX to Windows.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Replacement**
The group that is to be used as a replacement if the pattern associated with this entry matches. The replacement is a string containing escape sequences representing subexpressions from the pattern, as in the UNIX 'sed' program.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

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
* DataONTAP.C.Types.GroupMapping.GroupMappingInfo

---

### Notes
Category: group mapping
API: group-mapping-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcGroupMapping [-Direction] <String> [-Position] <Int32> [[-Pattern] <String>] [[-Replacement] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
