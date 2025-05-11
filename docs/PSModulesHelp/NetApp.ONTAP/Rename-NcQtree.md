Rename-NcQtree
--------------

### Synopsis
Renames the specified qtree.

---

### Description

Renames the specified qtree.  The qtree name in the quota rules will be automatically updated with the new qtree name.

---

### Related Links
* [Get-NcQtree](Get-NcQtree)

---

### Examples
> Example 1

Rename-NcQtree /vol/test/qtree1 -NewName qtree2
Rename qtree 'qtree1' to 'qtree2'.

Volume Qtree  Status SecurityStyle Oplocks Vserver
------ -----  ------ ------------- ------- -------
test   qtree2 normal ntfs          enabled Knight01

---

### Parameters
#### **Volume**
Name of the volume containing the qtree to rename.  This parameter may also be the complete path of the qtree in the format /vol/<volume>/<qtree>, in which case the Qtree parameter should not be specified.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Path   |

#### **Qtree**
The path of the qtree, relative to the volume, to rename.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **NewName**
The new qtree name, relative to the volume.  This parameter may also be the complete path of the renamed qtree in the format /vol/<volume>/<qtree>.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |NewPath|

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
API: qtree-rename
Family: vserver

---

### Syntax
```PowerShell
Rename-NcQtree [-Volume] <String> [[-Qtree] <String>] -NewName <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
