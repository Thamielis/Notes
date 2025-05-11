New-NcSecurityTraceFilter
-------------------------

### Synopsis
Create a new Security trace entry.

---

### Description

Create a new Security trace entry.

---

### Related Links
* [Get-NcSecurityTraceFilter](Get-NcSecurityTraceFilter)

* [Set-NcSecurityTraceFilter](Set-NcSecurityTraceFilter)

* [Remove-NcSecurityTraceFilter](Remove-NcSecurityTraceFilter)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityTraceFilter -Index 2 -ClientIp 10.61.169.73 -Path /powershell/cifs
Create a new security trace filter.

ClientIp             : 10.61.169.73
Enabled              : enabled
Index                : 2
NcController         : 10.63.165.62
Path                 : /powershell/cifs
TimeEnabled          : 60
TraceAllow           : False
UnixName             :
Vserver              : beam01
WindowsName          :
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
The deny events are traced by default. If specified, record trace results for allow events as well.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Enable**
If specified, the filter is enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, the filter is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: security-trace-filter-create
Family: vserver

---

### Syntax
```PowerShell
New-NcSecurityTraceFilter [-Index] <Int64> [-ClientIp <String>] [-Path <String>] [-WindowsName <String>] [-UnixName <String>] [-TraceAllow] [-Enable] [-Disable] [-TimeEnabled <Int64>] 
```
```PowerShell
[-Protocols <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
