Get-NcCifsHomeDirectoryConfig
-----------------------------

### Synopsis
Get CIFS home directory configurations.

---

### Description

Get CIFS home directory configurations.

---

### Related Links
* [Set-NcCifsHomeDirectoryConfig](Set-NcCifsHomeDirectoryConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsHomeDirectoryConfig
Get the CIFS home directory configuration for the current Vserver.

IsHomeDirsAccessForAdminEnabled           : True
IsHomeDirsAccessForPublicEnabled          : False
NcController                              : 10.63.10.33
Vserver                                   : beam01

```
> Example 2

```PowerShell
Get-NcCifsHomeDirectoryConfig -Vserver beam01
Get the CIFS home directory configuration for the given Vserver.

IsHomeDirsAccessForAdminEnabled           : True
IsHomeDirsAccessForPublicEnabled          : False
NcController                              : 10.63.10.33
Vserver                                   : beam01

```

---

### Parameters
#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsHomeDirectory object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsHomeDirectoryConfig -Template" to get the initially empty CifsHomeDirectory object.  If not specified, all data is returned for each object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CifsHomeDirectory]`|false   |named   |false        |

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
Specify to get an empty CifsHomeDirectory object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsHomeDirectory object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsHomeDirectoryConfig -Template" to get the initially empty CifsHomeDirectory object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CifsHomeDirectory]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsHomeDirectory

---

### Notes
Category: cifs
API: cifs-home-directory-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsHomeDirectoryConfig [[-Vserver] <String[]>] [-Attributes <CifsHomeDirectory>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsHomeDirectoryConfig -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsHomeDirectoryConfig -Query <CifsHomeDirectory> [-Attributes <CifsHomeDirectory>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
