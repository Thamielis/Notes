New-NcCifsLocalGroup
--------------------

### Synopsis
Create a CIFS local group.

---

### Description

Create a CIFS local group.

---

### Related Links
* [Get-NcCifsLocalGroup](Get-NcCifsLocalGroup)

* [Set-NcCifsLocalGroup](Set-NcCifsLocalGroup)

* [Rename-NcCifsLocalGroup](Rename-NcCifsLocalGroup)

* [Remove-NcCifsLocalGroup](Remove-NcCifsLocalGroup)

---

### Examples
> Example 1

New-NcCifsLocalGroup -Name 'PowerShell Users' -Description 'Users of the Data ONTAP PowerShell Toolkit'
Create a CIFS local group for PowerShell users.

GroupName                           Vserver                  Description
---------                           -------                  -----------
BEAM02\PowerShell Users             beam01                   Users of the Data ONTAP PowerShell Toolkit

---

### Parameters
#### **Name**
Name to give the created CIFS local group.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|GroupName|

#### **Description**
The description of the CIFS local group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cifs.CifsLocalGroup

---

### Notes
Category: cifs
API: cifs-local-group-create
Family: vserver

---

### Syntax
```PowerShell
New-NcCifsLocalGroup [-Name] <String> [-Description <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
