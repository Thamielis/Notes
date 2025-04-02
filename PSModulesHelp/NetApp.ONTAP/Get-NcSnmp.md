Get-NcSnmp
----------

### Synopsis
Returns configuration information of the SNMP agent daemon.

---

### Description

Returns configuration information of the SNMP agent daemon.

---

### Related Links
* [Enable-NcSnmp](Enable-NcSnmp)

* [Disable-NcSnmp](Disable-NcSnmp)

---

### Examples
> Example 1

```PowerShell
Get-NcSnmp
Get SNMP settings.

NcController  : cerebus
Communities   : {public}
Contact       : Chris Lionetti
IsTrapEnabled : True
Location      : SeaLab-A7
Traphosts     : {10.61.172.22, 10.61.172.23}

```

---

### Parameters
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
API: snmp-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnmp [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
