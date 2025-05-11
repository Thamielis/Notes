Get-NcSisPolicy
---------------

### Synopsis
Get the SIS (dedupe) policies defined on one or more vservers.

---

### Description

Get the SIS (dedupe) policies defined on one or more vservers.

---

### Related Links
* [New-NcSisPolicy](New-NcSisPolicy)

* [Set-NcSisPolicy](Set-NcSisPolicy)

* [Remove-NcSisPolicy](Remove-NcSisPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcSisPolicy
List the dedupe policies that are defined on the current vserver.

NcController     : vxeRubble
Comment          :
Duration         : -
DurationTS       :
Enabled          : False
PolicyName       : dailyDedupe
Schedule         : daily
Vserver          : costea01
EnabledSpecified : True

NcController     : vxeRubble
Comment          :
Duration         : 5
DurationTS       : 05:00:00
Enabled          : True
PolicyName       : hourlyDedupe
Schedule         : hourly
Vserver          : costea01
EnabledSpecified : True

```

---

### Parameters
#### **Name**
The names(s) of the dedupe policy to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases              |
|------------|--------|--------|---------------------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Policy<br/>PolicyName|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a SisPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSisPolicy -Template" to get the initially empty SisPolicyInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SisPolicyInfo]`|false   |named   |false        |

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
Specify to get an empty SisPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SisPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSisPolicy -Template" to get the initially empty SisPolicyInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SisPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sis.SisPolicyInfo

---

### Notes
Category: sis
API: sis-policy-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSisPolicy [[-Name] <String[]>] [-Vserver <String[]>] [-VserverContext <String>] [-Attributes <SisPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSisPolicy [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSisPolicy [-VserverContext <String>] -Query <SisPolicyInfo> [-Attributes <SisPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
