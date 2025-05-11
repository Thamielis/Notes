Get-NcGpoApplied
----------------

### Synopsis
Get the list of entries of the applied GPO rules.

---

### Description

Get the list of entries of the applied GPO rules.

---

### Related Links
* [Get-NcGpoGpResult](Get-NcGpoGpResult)

---

### Examples
> Example 1

Get-NcGpoApplied -Name "Default Domain Policy"
Get the default applied group policy.

Vserver                              : dlamotta01
GpoIndex                             : 0
NcController                         : 10.60.189.172
Dspath                               : CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=rtprre,DC=tes
                                       tdomain
Extension                            : {registry, security}
Filesyspath                          : \\rtprre.testdomain\sysvol\rtprre.testdomain\Policies\{31B2F340-016D-11D2-945F-0
                                       0C04FB984F9}
GpoName                              : Default Domain Policy
GpoStatus                            : enabled
GpoUuid                              : 31b2f340-016d-11d2-945f-00c04fb984f9
Link                                 : domain
RegistryRefreshInterval              :
RegistryRefreshRandomOffset          :
SecurityKerberosClockSkew            : 5
SecurityKerberosRenewalAge           : 7
SecurityKerberosTicketAge            : 10
SecurityPrivilegeTakeOwnership       :
Version                              :
GpoIndexSpecified                    : True
RegistryRefreshIntervalSpecified     : False
RegistryRefreshRandomOffsetSpecified : False
SecurityKerberosClockSkewSpecified   : True
SecurityKerberosRenewalAgeSpecified  : True
SecurityKerberosTicketAgeSpecified   : True
VersionSpecified                     : False

> Example 2

$q = Get-NcGpoApplied -Template
$q.GpoStatus = "enabled"
Get-NcGpoApplied -Query $q
Get the applied group policies that are enabled.

Vserver                              : dlamotta01
GpoIndex                             : 0
NcController                         : 10.60.189.172
Dspath                               : CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=rtprre,DC=tes
                                       tdomain
Extension                            : {registry, security}
Filesyspath                          : \\rtprre.testdomain\sysvol\rtprre.testdomain\Policies\{31B2F340-016D-11D2-945F-0
                                       0C04FB984F9}
GpoName                              : Default Domain Policy
GpoStatus                            : enabled
GpoUuid                              : 31b2f340-016d-11d2-945f-00c04fb984f9
Link                                 : domain
RegistryRefreshInterval              :
RegistryRefreshRandomOffset          :
SecurityKerberosClockSkew            : 5
SecurityKerberosRenewalAge           : 7
SecurityKerberosTicketAge            : 10
SecurityPrivilegeTakeOwnership       :
Version                              :
GpoIndexSpecified                    : True
RegistryRefreshIntervalSpecified     : False
RegistryRefreshRandomOffsetSpecified : False
SecurityKerberosClockSkewSpecified   : True
SecurityKerberosRenewalAgeSpecified  : True
SecurityKerberosTicketAgeSpecified   : True
VersionSpecified                     : False

---

### Parameters
#### **Vserver**
One or more Vserver display names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Index**
The index of the GPO in the GPO list of a Vserver.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|GpoIndex|

#### **Name**
GPO name in text format.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |3       |true (ByPropertyName)|GpoName|

#### **Attributes**
For improved scalability in large clusters, provide an GpoAppliedInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcGpoApplied -Template" to get the initially empty GpoAppliedInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[GpoAppliedInfo]`|false   |named   |false        |

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
Specify to get an empty GpoAppliedInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an GpoAppliedInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcGpoApplied -Template" to get the initially empty GpoAppliedInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[GpoAppliedInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Gpo.GpoAppliedInfo

---

### Notes
Category: gpo
API: gpo-applied-info-get-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcGpoApplied [[-Vserver] <String[]>] [[-Index] <String[]>] [[-Name] <String[]>] [-Attributes <GpoAppliedInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoApplied -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoApplied -Query <GpoAppliedInfo> [-Attributes <GpoAppliedInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
