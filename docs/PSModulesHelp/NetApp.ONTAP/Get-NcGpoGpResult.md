Get-NcGpoGpResult
-----------------

### Synopsis
Get a list of entries of the GPO RSoP(Resultant Set of Policy) data.

---

### Description

Get a list of entries of the GPO RSoP(Resultant Set of Policy) data.

---

### Related Links
* [Get-NcGpoApplied](Get-NcGpoApplied)

---

### Examples
> Example 1

Get-NcGpoGpResult
Get all of the entries of the GPO RSoP(Resultant Set of Policy) for the current cluster.

Dspath                               : CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=rtprre,DC=tes
                                       tdomain
Extension                            : {registry, security}
Filesyspath                          : \\rtprre.testdomain\sysvol\rtprre.testdomain\Policies\{31B2F340-016D-11D2-945F-0
                                       0C04FB984F9}
GpoIndex                             : 0
GpoName                              : Default Domain Policy
GpoStatus                            : enabled
GpoUuid                              : 31b2f340-016d-11d2-945f-00c04fb984f9
Link                                 : domain
NcController                         : 10.60.189.172
RegistryRefreshInterval              :
RegistryRefreshRandomOffset          :
SecurityKerberosClockSkew            : 5
SecurityKerberosRenewalAge           : 7
SecurityKerberosTicketAge            : 10
SecurityPrivilegeTakeOwnership       :
Version                              : 65540
Vserver                              : dlamotta01
GpoIndexSpecified                    : True
RegistryRefreshIntervalSpecified     : False
RegistryRefreshRandomOffsetSpecified : False
SecurityKerberosClockSkewSpecified   : True
SecurityKerberosRenewalAgeSpecified  : True
SecurityKerberosTicketAgeSpecified   : True
VersionSpecified                     : True

> Example 2

```PowerShell
$q = Get-NcGpoGpResult -Template
$q.GpoStatus = "disabled"
Get-NcGpoGpResult -Query $q
Get all of the GPO RSoP(Resultant Set of Policy) entries that are currently disabled.

Dspath                               :
Extension                            :
Filesyspath                          :
GpoIndex                             : 1
GpoName                              : Resultant Set of Policy
GpoStatus                            : disabled
GpoUuid                              :
Link                                 :
NcController                         : 10.60.189.172
RegistryRefreshInterval              :
RegistryRefreshRandomOffset          :
SecurityKerberosClockSkew            : 5
SecurityKerberosRenewalAge           : 7
SecurityKerberosTicketAge            : 10
SecurityPrivilegeTakeOwnership       :
Version                              :
Vserver                              : dlamotta01
GpoIndexSpecified                    : True
RegistryRefreshIntervalSpecified     : False
RegistryRefreshRandomOffsetSpecified : False
SecurityKerberosClockSkewSpecified   : True
SecurityKerberosRenewalAgeSpecified  : True
SecurityKerberosTicketAgeSpecified   : True
VersionSpecified                     : False

```

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
For improved scalability in large clusters, provide an GpoGpresultInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcGpoGpResult -Template" to get the initially empty GpoGpresultInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[GpoGpresultInfo]`|false   |named   |false        |

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
Specify to get an empty GpoGpresultInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an GpoGpresultInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcGpoGpResult -Template" to get the initially empty GpoGpresultInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[GpoGpresultInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Gpo.GpoGpresultInfo

---

### Notes
Category: gpo
API: gpo-gpresult-info-get-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcGpoGpResult [[-Vserver] <String[]>] [[-Index] <String[]>] [[-Name] <String[]>] [-Attributes <GpoGpresultInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoGpResult -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoGpResult -Query <GpoGpresultInfo> [-Attributes <GpoGpresultInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
