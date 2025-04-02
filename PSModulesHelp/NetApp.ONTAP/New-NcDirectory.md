New-NcDirectory
---------------

### Synopsis
Create a directory.

---

### Description

Create a directory.  The directory path must be in the form of /vol/<volume_name>/<directory_name> and not /<junction_path>/<directory_name>

---

### Related Links
* [Read-NcDirectory](Read-NcDirectory)

* [Remove-NcDirectory](Remove-NcDirectory)

---

### Examples
> Example 1

New-NcDirectory /vol/vol1/users 0755 | ft -AutoSize
Create a new directory 'users' in volume 'vol1'.

Name  Type      Size    Created   Modified Owner Group Perm Empty
----  ----      ----    -------   -------- ----- ----- ---- -----
users directory 4 KB 11/14/2011 11/14/2011     0     0  755 True

---

### Parameters
#### **Path**
Path of the directory to be created. The value is expected to begin with /vol/<volumename>.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Permission**
Permission of the directory to be created.  It's similar to Unix style permission bits: 0755 gives read/write/execute permissions to owner and read/execute to group and other users.  It consists of 4 octal digits derived by adding up bits 4, 2 and 1.  Omitted digits are assumed to be zeros.  First digit selects the set user ID(4), set group ID (2) and sticky (1) attributes.  The second digit selects permission for the owner of the file: read (4), write (2) and execute (1); the third selects permissions for other users in the same group; the fourth for other users not in the group.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|true    |2       |false        |Mode<br/>Perm|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Type**
Type of the file. Examples : file, directory. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.File.FileInfo

---

### Notes
Category: file
API: file-create-directory
Family: vserver

---

### Syntax
```PowerShell
New-NcDirectory [-Path] <String> [-Permission] <String> [-VserverContext <String>] [-Type <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
