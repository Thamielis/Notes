Add-NcSnmpTrapHost
------------------

### Synopsis
Adds a host to the list of trap hosts.

---

### Description

Adds a host to the list of trap hosts.

---

### Related Links
* [Get-NcSnmp](Get-NcSnmp)

* [Remove-NcSnmpTrapHost](Remove-NcSnmpTrapHost)

---

### Examples
> Example 1

```PowerShell
Add-NcSnmpTrapHost 10.61.172.22,10.61.172.23
Add two SNMP trap hosts.

NcController  : cerebus
Communities   : {public}
Contact       : Chris Lionetti
IsTrapEnabled : True
Location      : SeaLab-A7
Traphosts     : {10.61.172.22, 10.61.172.23}

```

---

### Parameters
#### **Hosts**
One or more trap hosts to add.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Host<br/>Name|

#### **Username**
Specify the USM user name to indicate SNMPv3 traphost.
This parameter is available in ONTAP 9.1 and later.

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snmp.SnmpStatusInfo

---

### Notes
Category: snmp
API: snmp-traphost-add
Family: cluster

---

### Syntax
```PowerShell
Add-NcSnmpTrapHost [-Hosts] <String[]> [-Username <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
