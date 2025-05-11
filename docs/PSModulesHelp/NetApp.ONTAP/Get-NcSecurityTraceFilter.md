Get-NcSecurityTraceFilter
-------------------------

### Synopsis
Get security trace filters.

---

### Description

Get security trace filters.

---

### Related Links
* [Set-NcSecurityTraceFilter](Set-NcSecurityTraceFilter)

* [New-NcSecurityTraceFilter](New-NcSecurityTraceFilter)

* [Remove-NcSecurityTraceFilter](Remove-NcSecurityTraceFilter)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityTraceFilter
Get all of the security trace filters.

IsEnabled            : True
ClientIp             :
Enabled              : enabled
Index                : 1
NcController         : 10.63.165.62
Path                 : hello.txt
TimeEnabled          : 60
TraceAllow           : True
UnixName             :
Vserver              : beam01
WindowsName          :
IndexSpecified       : True
TimeEnabledSpecified : True
TraceAllowSpecified  : True

```
> Example 2

$q = Get-NcSecurityTraceFilter -Template
$q.Enabled = "enabled"
Get-NcSecurityTraceFilter -Query $q
Get all of the enabled security trace filters.

Path                                 Index IsEnabled  ClientIp         WindowsName        UnixName           Vserver
----                                 ----- ---------  --------         -----------        --------           -------
hello.txt                                1    True                                                           beam01

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Index**
Index or indices for the filter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |named   |true (ByPropertyName)|

#### **WindowsName**
One or more Windows user names that are traced.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **UnixName**
One or more Unix user names that are traced.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityTraceFilterAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityTraceFilter -Template" to get the initially empty SecurityTraceFilterAttributes object.  If not specified, all data is returned for each object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[SecurityTraceFilterAttributes]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SecurityTraceFilterAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityTraceFilterAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityTraceFilter -Template" to get the initially empty SecurityTraceFilterAttributes object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[SecurityTraceFilterAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sectrace.SecurityTraceFilterAttributes

---

### Notes
Category: sectrace
API: security-trace-filter-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecurityTraceFilter [-Vserver <String[]>] [-Index <UInt64[]>] [-WindowsName <String[]>] [-UnixName <String[]>] [-Attributes <SecurityTraceFilterAttributes>] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityTraceFilter -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityTraceFilter -Query <SecurityTraceFilterAttributes> [-Attributes <SecurityTraceFilterAttributes>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
