Get-NcNis
---------

### Synopsis
Get a list of NIS configurations.

---

### Description

Get a list of NIS configurations.

---

### Related Links
* [New-NcNis](New-NcNis)

* [Remove-NcNis](Remove-NcNis)

* [Set-NcNis](Set-NcNis)

---

### Examples
> Example 1

```PowerShell
Get-NcNis example.com
Get the NIS domain configuration example.com.

NcController      : 192.168.182.144
Vserver           : lemon
IsActive          : True
NisDomain         : example.com
NisServers        : {192.168.182.150, 192.168.192.151}
IsActiveSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcNis -Template
$q.NisServers = @("192.168.182.100")
Get-NcNis -Query $q
Get all of the NIS domain configurations with the NIS server 192.168.182.100.

NcController      : 192.168.182.144
Vserver           : lemon
IsActive          : False
NisDomain         : nis2
NisServers        : {192.168.182.100, 192.168.182.101}
IsActiveSpecified : True

```

---

### Parameters
#### **NisDomain**
One or more NIS domains.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Specifies the Vserver for the NIS domain configuration.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NisDomainConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "GetNcNis -Template" to get the initially empty NisDomainConfigInfo object.  If not specified, all data is returned for each object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NisDomainConfigInfo]`|false   |named   |false        |

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
Specify to get an empty NisDomainConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NisDomainConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNis -Template" to get the initially empty NisDomainConfigInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NisDomainConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nis.NisDomainConfigInfo

---

### Notes
Category: nis
API: nis-get-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcNis [[-NisDomain] <String[]>] [[-Vserver] <String[]>] [-Attributes <NisDomainConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNis -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNis -Query <NisDomainConfigInfo> [-Attributes <NisDomainConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
