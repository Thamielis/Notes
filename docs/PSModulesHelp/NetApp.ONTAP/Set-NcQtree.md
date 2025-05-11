Set-NcQtree
-----------

### Synopsis
Modify the attributes of a qtree.

---

### Description

Modify the attributes of a qtree.

---

### Related Links
* [New-NcQtree](New-NcQtree)

* [Get-NcQtree](Get-NcQtree)

* [Remove-NcQtree](Remove-NcQtree)

* [Rename-NcQtree](Rename-NcQtree)

---

### Examples
> Example 1

Set-NcQtree /vol/vol1/qtree1 -SecurityStyle ntfs -EnableOplocks -VserverContext vserver_1
Change the security style and enable oplocks for the given qtree.

Volume                         Qtree                     Status          SecurityStyle Oplocks    Vserver
------                         -----                     ------          ------------- -------    -------
vol1                           qtree1                    normal          ntfs          enabled    vserver_1

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
Security style of the qtree.  Possible values: "unix", "ntfs", or "mixed".
Changing the security style of a qtree will change the visibility of existing Windows security descriptors (i.e. ACLs). This may affect the disk space usage values in the quota database. Turn quotas off and then on to re-compute disk space usage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExportPolicy**
Export policy of the qtree.
If empty string, the qtree will inherit the export policy of the parent volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **EnableOplocks**
If specified, oplocks will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableOplocks**
If specified, oplocks will be disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: qtree-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcQtree [-Volume] <String> [[-Qtree] <String>] [-Mode <String>] [-SecurityStyle <String>] [-ExportPolicy <String>] [-EnableOplocks] [-DisableOplocks] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
