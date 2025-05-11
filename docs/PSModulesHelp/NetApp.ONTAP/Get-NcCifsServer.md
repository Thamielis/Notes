Get-NcCifsServer
----------------

### Synopsis
Get a list of CIFS Servers.

---

### Description

Get a list of CIFS Servers.

---

### Related Links
* [Add-NcCifsServer](Add-NcCifsServer)

* [Remove-NcCifsServer](Remove-NcCifsServer)

* [Set-NcCifsServer](Set-NcCifsServer)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsServer
Get all of the CIFS servers in the current cluster or vserver.

AuthStyle          : domain
CifsServer         : BARKER01
DefaultSite        :
Domain             : TEST.TestDomain
DomainWorkgroup    : TEST
OrganizationalUnit :

AuthStyle          : domain
CifsServer         : MUN01
DefaultSite        :
Domain             : TEST.TestDomain
DomainWorkgroup    : TEST
OrganizationalUnit :

```
> Example 2

```PowerShell
$query = Get-NcCifsServer -Template
$query.AuthStyle = "domain"
Get-NcCifsServer -Query $query
Get all of the CIFS servers in the current cluster or vserver with an AuthStyle of "domain".

AuthStyle          : domain
CifsServer         : BARKER01
DefaultSite        :
Domain             : TEST.TestDomain
DomainWorkgroup    : TEST
OrganizationalUnit :

AuthStyle          : domain
CifsServer         : MUN01
DefaultSite        :
Domain             : TEST.TestDomain
DomainWorkgroup    : TEST
OrganizationalUnit :

```

---

### Parameters
#### **Name**
The name of one or more CIFS servers to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|CifsServer|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a CifsServerConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsServer -Template" to get the initially empty CifsServerConfig object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CifsServerConfig]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty CifsServerConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsServerConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsServer -Template" to get the initially empty CifsServerConfig object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CifsServerConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsServerConfig

---

### Notes
Category: cifs
API: cifs-server-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsServer [[-Name] <String[]>] [-VserverContext <String>] [-Attributes <CifsServerConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsServer [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsServer [-VserverContext <String>] -Query <CifsServerConfig> [-Attributes <CifsServerConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
