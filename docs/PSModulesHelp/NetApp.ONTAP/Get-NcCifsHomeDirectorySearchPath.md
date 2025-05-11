Get-NcCifsHomeDirectorySearchPath
---------------------------------

### Synopsis
Get a list of CIFS Home Directory search paths.

---

### Description

Get a list of CIFS Home Directory search paths. When a CIFS client connects to a home directory share, these paths are searched in the order indicated by the 'Position' field to find the user's home directory.

---

### Related Links
* [Add-NcCifsHomeDirectorySearchPath](Add-NcCifsHomeDirectorySearchPath)

* [Remove-NcCifsHomeDirectorySearchPath](Remove-NcCifsHomeDirectorySearchPath)

* [Set-NcCifsHomeDirectorySearchPath](Set-NcCifsHomeDirectorySearchPath)

---

### Examples
> Example 1

Get-NcCifsHomeDirectorySearchPath
Get all the CIFS home directory search paths for the CIFS server running on the current Vserver.

Position Path
-------- ----
       1 /usr/path1
       2 /usr/path2

---

### Parameters
#### **Position**
The position of the entry in the list of paths that will be searched for finding a CIFS user's home directory.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Path**
The file system path that will be searched for finding a CIFS user's home directory.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsHomeDirectorySearchPath object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsHomeDirectorySearchPath -Template" to get the initially empty CifsHomeDirectorySearchPath object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[CifsHomeDirectorySearchPath]`|false   |named   |false        |

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
Specify to get an empty CifsHomeDirectorySearchPath object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsHomeDirectorySearchPath object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsHomeDirectorySearchPath -Template" to get the initially empty CifsHomeDirectorySearchPath object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[CifsHomeDirectorySearchPath]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsHomeDirectorySearchPath

---

### Notes
Category: cifs
API: cifs-home-directory-search-path-get-iter
Family: vserver

---

### Syntax
```PowerShell
Get-NcCifsHomeDirectorySearchPath [[-Position] <String[]>] [[-Path] <String[]>] [-Attributes <CifsHomeDirectorySearchPath>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsHomeDirectorySearchPath -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsHomeDirectorySearchPath -Query <CifsHomeDirectorySearchPath> [-Attributes <CifsHomeDirectorySearchPath>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
