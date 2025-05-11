Remove-NcQtree
--------------

### Synopsis
Delete a qtree.

---

### Description

Delete a qtree.  All quota rules that reference this qtree will be automatically deleted.

---

### Related Links
* [Get-NcQtree](Get-NcQtree)

* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

```PowerShell
Remove-NcQtree /vol/test/qtree1
Remove a qtree.
```
> Example 2

Get-NcQtree /vol/test/qtree* | Remove-NcQtree -Async | Get-NcJob
Remove all qtrees matching the pattern '/vol/test/qtree*' asynchronously and show the resulting job objects.

JobId JobName      JobPriority JobState JobVserver JobCompletion
----- -------      ----------- -------- ---------- -------------
4282  Qtree Delete high        running  Knight01
4283  Qtree Delete high        queued   Knight01
4284  Qtree Delete high        queued   Knight01
4285  Qtree Delete high        queued   Knight01
4286  Qtree Delete high        queued   Knight01

---

### Parameters
#### **Volume**
Name of the volume containing the qtree to delete.  This parameter may also be the complete path of the qtree in the format /vol/<volume>/<qtree>, in which case the Qtree parameter should not be specified.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Path   |

#### **Qtree**
The path of the qtree, relative to the volume, to delete.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Force**
Force the deletion of the qtree even if it is not empty.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Async**
Delete the specified qtree by spawning a background job.

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
* 

---

### Notes
Category: qtree
API: qtree-delete, qtree-delete-async
Family: vserver

---

### Syntax
```PowerShell
Remove-NcQtree [-Volume] <String> [[-Qtree] <String>] [-Force] [-Async] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
