Remove-NcNameServiceNsSwitch
----------------------------

### Synopsis
Destroy an existing Name Service Switch Configuration.

---

### Description

Destroy an existing Name Service Switch Configuration.

---

### Related Links
* [Get-NcNameServiceNsSwitch](Get-NcNameServiceNsSwitch)

* [New-NcNameServiceNsSwitch](New-NcNameServiceNsSwitch)

* [Set-NcNameServiceNsSwitchSources](Set-NcNameServiceNsSwitchSources)

---

### Examples
> Example 1

Remove-NcNameServiceNsSwitch -NameserviceDatabase group
Destroy the ns-switch database "group"

Removing NsSwitch Database
Are you sure you want to remove NsSwitch Database group.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

NameserviceDatabase           NameserviceSources            NcController                  VserverName
-------------------           ------------------            ------------                  -----------
hosts                         {files, dns}                  10.238.49.117                 pstk
passwd                        {files}                       10.238.49.117                 pstk
netgroup                      {files}                       10.238.49.117                 pstk
namemap                       {files}                       10.238.49.117                 pstk

---

### Parameters
#### **NameserviceDatabase**
Name of the ns-switch database to be deleted. Possible values are hosts, group, passwd, netgroup or name-map

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|NameserviceDB<br/>Database|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceNsswitchConfigInfo

---

### Notes
Category: nameservice
API: nameservice-nsswitch-destroy
Family: vserver

---

### Syntax
```PowerShell
Remove-NcNameServiceNsSwitch [-NameserviceDatabase] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
