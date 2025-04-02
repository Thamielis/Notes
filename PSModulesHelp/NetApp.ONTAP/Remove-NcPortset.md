Remove-NcPortset
----------------

### Synopsis
Destroys an existing portset.

---

### Description

Destroys an existing portset.  By default a set cannot be destroyed if there are existing igroups associated with that portset.

---

### Related Links
* [Get-NcPortset](Get-NcPortset)

* [New-NcPortset](New-NcPortset)

---

### Examples
> Example 1

```PowerShell
Remove-NcPortset portset_iscsi1
Destroy portset 'portset_iscsi1'.
```

---

### Parameters
#### **Name**
Name of the portset to destroy.

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Portset<br/>PortsetName|

#### **Force**
If not specified, the request will fail if there are any igroups bound to this portset.  If specified, forcibly destroy the portset, even if there are existing igroup bindings.  Best practice is to unbind all the associated igroups before destroying the portset.

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
Category: portset
API: portset-destroy
Family: vserver

---

### Syntax
```PowerShell
Remove-NcPortset [-Name] <String> [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
