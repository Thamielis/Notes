Read-NcDirectory
----------------

### Synopsis
List the contents of a directory.

---

### Description

List the contents of a directory.

---

### Related Links
* [New-NcDirectory](New-NcDirectory)

* [Remove-NcDirectory](Remove-NcDirectory)

* [Read-NcFile](Read-NcFile)

---

### Examples
> Example 1

Read-NcDirectory /vol/vol1
List the contents of volume 'vol1'.

Name      Type      Size    Created   Modified Owner Group Perm Empty
----      ----      ----    -------   -------- ----- ----- ---- -----
.         directory 4 KB 11/14/2011 11/14/2011     0     1  700 False
..        directory 4 KB  10/3/2011 11/14/2011     0     1  777 False
.snapshot directory 4 KB 11/14/2011 11/14/2011     0     0  777 False
hosts     file         0 11/14/2011 11/14/2011     0     0  644
users     directory 4 KB 11/14/2011 11/14/2011     0     0  755 False

---

### Parameters
#### **Path**
The path of the directory to query.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Attributes**
For improved scalability in large clusters, provide a FileInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Read-NcDirectory -Template" to get the initially empty FileInfo object.  If not specified, all data is returned for each object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[FileInfo]`|false   |named   |false        |

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
Specify to get an empty FileInfo object for use with advanced queries involving the Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.FileInfo

---

### Notes
Category: file
API: file-list-directory-iter
Family: vserver

---

### Syntax
```PowerShell
Read-NcDirectory [-Path] <String> [-Attributes <FileInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Read-NcDirectory -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
