Set-NcSecurityTraceFilter
-------------------------

### Synopsis
Modify settings of a Security trace entry.

---

### Description

Modify settings of a Security trace entry.

---

### Related Links
* [Get-NcSecurityTraceFilter](Get-NcSecurityTraceFilter)

* [Remove-NcSecurityTraceFilter](Remove-NcSecurityTraceFilter)

* [New-NcSecurityTraceFilter](New-NcSecurityTraceFilter)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityTraceFilter -Index 1 -WindowsName EXAMPLE\user
Set the Windows user name for the security trace filter.

ClientIp             :
Enabled              : enabled
Index                : 1
NcController         : 10.63.165.62
Path                 :
TimeEnabled          : 60
TraceAllow           : False
UnixName             :
Vserver              : beam01
WindowsName          : EXAMPLE\user
IndexSpecified       : True
TimeEnabledSpecified : True
TraceAllowSpecified  : True

```

---

### Parameters
#### **Index**
Index for the filter.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **ClientIp**
The IP address of the client.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Path**
Path to match.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **WindowsName**
Windows user name to trace.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UnixName**
Unix user name to trace.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TraceAllow**
The deny events are traced by default. If true, record trace results for allow events as well.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Enabled**
If true, the filter is enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **TimeEnabled**
Timeout for this filter after which it would be disabled.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Protocols**
The protocols for which the permission tracing is applicable. Possible values:  "cifs" - CIFS Protocol, "nfs"  - NFS Protocol
This parameter is available in ONTAP 9.3 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sectrace.SecurityTraceFilterAttributes

---

### Notes
Category: sectrace
API: security-trace-filter-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcSecurityTraceFilter [-Index] <Int64> [-ClientIp <String>] [-Path <String>] [-WindowsName <String>] [-UnixName <String>] [-TraceAllow <Boolean>] [-Enabled <Boolean>] [-TimeEnabled 
```
```PowerShell
<Int64>] [-Protocols <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
