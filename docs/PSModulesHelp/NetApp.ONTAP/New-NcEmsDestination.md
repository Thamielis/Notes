New-NcEmsDestination
--------------------

### Synopsis
Create an EMS destination.

---

### Description

Create an EMS destination.

---

### Related Links
* [Get-NcEmsDestination](Get-NcEmsDestination)

* [Remove-NcEmsDestination](Remove-NcEmsDestination)

* [Update-NcEmsDestination](Update-NcEmsDestination)

* [Set-NcEmsDestination](Set-NcEmsDestination)

---

### Examples
> Example 1

```PowerShell
New-NcEmsDestination test -Mail admin@test.test
Create a new EMS destination named test with an email.

HideParameters          : False
Mail                    : {admin@test.test}
Name                    : test
Snmp                    :
SnmpCommunity           :
Syslog                  :
SyslogFacility          :

```

---

### Parameters
#### **Name**
The name of the EMS destination.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Mail**
The e-mail address to which events are sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Snmp**
The SNMP addresses to which traps are sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Syslog**
The remote syslog servers to which messages are sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SyslogFacility**
The syslog logging facility.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SnmpCommunity**
The SNMP community name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HideParameters**
If set to true, hide parameter values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.Ems.EmsDestinationInfo

---

### Notes
Category: ems
API: ems-destination-create
Family: cluster

---

### Syntax
```PowerShell
New-NcEmsDestination [-Name] <String> [-Mail <String[]>] [-Snmp <String[]>] [-Syslog <String[]>] [-SyslogFacility <String>] [-SnmpCommunity <String>] [-HideParameters] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
