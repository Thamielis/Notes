Remove-NcSnmpCommunity
----------------------

### Synopsis
Deletes a community from the list of communities.

---

### Description

Deletes a community from the list of communities.

Remove-NcSnmpCommunity must be executed on the Cluster LIF.  To add an SNMP community to a Vserver, Vserver tunneling must be used.

---

### Related Links
* [Get-NcSnmp](Get-NcSnmp)

* [Add-NcSnmpCommunity](Add-NcSnmpCommunity)

---

### Examples
> Example 1

```PowerShell
Remove-NcSnmpCommunity private
Remove SNMP community 'private'.

NcController  : cerebus
Communities   : {public}
Contact       : Chris Lionetti
IsTrapEnabled : True
Location      : SeaLab-A7
Traphosts     : {10.61.172.22, 10.61.172.23}

```

---

### Parameters
#### **Community**
An SNMP community to delete.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **EngineId**
Engine ID of owning SVM or remote switch. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **All**
Specify to remove all SNMP communities.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snmp.SnmpStatusInfo

---

### Notes
Category: snmp
API: snmp-community-delete, snmp-community-delete-all
Family: cluster,vserver

---

### Syntax
```PowerShell
Remove-NcSnmpCommunity [-Community] <String> [-VserverContext <String>] [-EngineId <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcSnmpCommunity -All [-VserverContext <String>] [-EngineId <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
