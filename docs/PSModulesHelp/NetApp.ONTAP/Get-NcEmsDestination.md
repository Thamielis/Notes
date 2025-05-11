Get-NcEmsDestination
--------------------

### Synopsis
Get information on EMS destinations.

---

### Description

Get information on EMS destinations.

---

### Related Links
* [Set-NcEmsDestination](Set-NcEmsDestination)

* [Remove-NcEmsDestination](Remove-NcEmsDestination)

* [Update-NcEmsDestination](Update-NcEmsDestination)

* [New-NcEmsDestination](New-NcEmsDestination)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsDestination asup
Get the EMS destination named asup.

HideParameters          : False
Mail                    :
Name                    : asup
Snmp                    :
SnmpCommunity           :
Syslog                  :
SyslogFacility          :

```

---

### Parameters
#### **Name**
The name of the EMS destination.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Mail**
The e-mail address to which events are sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Snmp**
The SNMP addresses to which traps are sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an EmsDestinationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsDestination -Template" to get the initially empty EmsDestinationInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsDestinationInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty EmsDestinationInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsDestinationInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsDestination -Template" to get the initially empty EmsDestinationInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsDestinationInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsDestinationInfo

---

### Notes
Category: ems
API: ems-destination-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsDestination [[-Name] <String[]>] [[-Mail] <String[]>] [[-Snmp] <String[]>] [-Attributes <EmsDestinationInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsDestination -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsDestination -Query <EmsDestinationInfo> [-Attributes <EmsDestinationInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
