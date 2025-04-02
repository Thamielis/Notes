New-NcQtree
-----------

### Synopsis
Create a new qtree.

---

### Description

Create a new qtree.

---

### Related Links
* [Get-NcQtree](Get-NcQtree)

---

### Examples
> Example 1

New-NcQtree /vol/test/qtree1 -SecurityStyle ntfs
Create a new qtree.

Volume Qtree  Status SecurityStyle Oplocks Vserver
------ -----  ------ ------------- ------- -------
test   qtree1 normal ntfs          enabled Knight01

---

### Parameters
#### **Volume**
Name of the volume on which to create the qtree.  This parameter may also be the complete path of the new qtree in the format /vol/<volume>/<qtree>, in which case the Qtree parameter should not be specified.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Path   |

#### **Qtree**
The path of the qtree, relative to the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Mode**
The file permission bits of the qtree.  Similar to UNIX permission bits: 0755 gives read/write/execute permissions to owner and read/execute to group and other users.  It consists of 4 octal digits derived by adding up bits 4, 2, and 1.  Omitted digits are assumed to be zeros.  First digit selects the set user ID (4), set group ID (2), and sticky (1) attributes.  The second digit selects permissions for the owner of the file: read (4), write (2), and execute (1); the third selects permissions for other users in the same group; the fourth for other users not in the group.  If this argument is missing, the permissions of the volume are used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SecurityStyle**
Security style of the qtree.  Possible values: "unix", "ntfs", or "mixed".  Default value is the security style of the volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Oplocks**
Opportunistic locks mode of the qtree.  Possible values: "enabled", "disabled".  Default value is the oplock mode of the volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExportPolicy**
Export policy of the qtree.
If not specified, the qtree will inherit the export policy of the parent volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Tags**
Tags are an optional way to track the uses of a resource. 
        Tag values must be formatted as key:value strings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Qtree.QtreeInfo

---

### Notes
Category: qtree
API: qtree-create
Family: vserver

---

### Syntax
```PowerShell
New-NcQtree [-Volume] <String> [[-Qtree] <String>] [-Mode <String>] [-SecurityStyle <String>] [-Oplocks <String>] [-Tags <String[]>] [-ExportPolicy <String>] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
