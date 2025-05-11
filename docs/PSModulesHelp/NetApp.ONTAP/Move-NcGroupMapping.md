Move-NcGroupMapping
-------------------

### Synopsis
Swap the position of one group mapping with another.

---

### Description

Swap the position of one group mapping with another. The position is the place in the sequence of group mappings in which the mappings are applied.

---

### Related Links
* [Get-NcGroupMapping](Get-NcGroupMapping)

* [New-NcGroupMapping](New-NcGroupMapping)

* [Set-NcGroupMapping](Set-NcGroupMapping)

* [Remove-NcGroupMapping](Remove-NcGroupMapping)

---

### Examples
> Example 1

```PowerShell
Move-NcGroupMapping -Direction unix_win -Position 1 -ToPosition 2
Swap position 1 and 2 of the unix_win group mappings.

Direction         : unix_win
NcController      : 10.63.165.62
Pattern           : cifs
Position          : 2
Replacement       : EXAMPLE\\Domain Groups
Vserver           : repo
PositionSpecified : True

```

---

### Parameters
#### **Direction**
Direction in which the group mapping is applied.
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

#### **ToPosition**
Position of an existing group mapping entry in the list of group mappings for this Vserver. This entry will be swapped with the entry at 'position'.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

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
API: group-mapping-swap
Family: vserver

---

### Syntax
```PowerShell
Move-NcGroupMapping [-Direction] <String> [-Position] <Int32> [-ToPosition] <Int32> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
