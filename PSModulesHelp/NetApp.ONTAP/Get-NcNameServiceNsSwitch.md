Get-NcNameServiceNsSwitch
-------------------------

### Synopsis
Get a list of Name Service Switch Configurations.

---

### Description

Get a list of Name Service Switch Configurations.

---

### Related Links
* [Set-NcNameServiceNsSwitchSources](Set-NcNameServiceNsSwitchSources)

* [New-NcNameServiceNsSwitch](New-NcNameServiceNsSwitch)

* [Remove-NcNameServiceNsSwitch](Remove-NcNameServiceNsSwitch)

---

### Examples
> Example 1

$q = Get-NcNameServiceNsSwitch -Template; $q.NameserviceDatabase = "group"; Get-NcNameServiceNsSwitch -Query $q
Get details of NsSwitch Database "group" using a query.

NameserviceDatabase           NameserviceSources            NcController                  VserverName
-------------------           ------------------            ------------                  -----------
group                         {files}                       10.238.49.117                 pstk

---

### Parameters
#### **Vserver**
Name of the vserver

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|VserverName|

#### **NameserviceDatabase**
Name Service Switch Database. Possible values are hosts, group, passwd, netgroup or name-map.

|Type        |Required|Position|PipelineInput        |Aliases                   |
|------------|--------|--------|---------------------|--------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Database<br/>NameServiceDB|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[NameserviceNsswitchConfigInfo]`|false   |named   |false        |

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[NameserviceNsswitchConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceNsswitchConfigInfo

---

### Notes
Category: nameservice
API: nameservice-nsswitch-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameServiceNsSwitch [[-Vserver] <String[]>] [-NameserviceDatabase <String[]>] [-Attributes <NameserviceNsswitchConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNsSwitch -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNsSwitch -Query <NameserviceNsswitchConfigInfo> [-Attributes <NameserviceNsswitchConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
