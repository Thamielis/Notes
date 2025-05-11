Set-NcNameServiceNsSwitchSources
--------------------------------

### Synopsis
Modify the order of look up for name service switch configuration.

---

### Description

Modify the attributes of Name Service Switch Configuration.

---

### Related Links
* [Get-NcNameServiceNsSwitch](Get-NcNameServiceNsSwitch)

* [New-NcNameServiceNsSwitch](New-NcNameServiceNsSwitch)

* [Remove-NcNameServiceNsSwitch](Remove-NcNameServiceNsSwitch)

---

### Examples
> Example 1

Set-NcNameServiceNsSwitchSources -NameserviceDatabase group -NameserviceSources ldap
Change the source lookup of NS Database group to "ldap"

NameserviceDatabase           NameserviceSources            NcController                  VserverName
-------------------           ------------------            ------------                  -----------
group                         {ldap}                        10.238.49.117                 pstk

---

### Parameters
#### **NameserviceDatabase**
Name of the ns-switch database to be modified

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|NameserviceDB<br/>Database|

#### **NameserviceSources**
The order of looking up Name Service Switch Sources, entered as a comma separated list

|Type        |Required|Position|PipelineInput        |Aliases                                 |
|------------|--------|--------|---------------------|----------------------------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|NameserviceSource<br/>Sources<br/>Source|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceNsswitchConfigInfo

---

### Notes
Category: nameservice
API: nameservice-nsswitch-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNameServiceNsSwitchSources [-NameserviceDatabase] <String> [-NameserviceSources] <String[]> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
