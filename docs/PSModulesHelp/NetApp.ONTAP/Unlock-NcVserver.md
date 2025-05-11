Unlock-NcVserver
----------------

### Synopsis
Revoke the administrative lock on the Vserver configuration.

---

### Description

Revoke the administrative lock on the Vserver configuration. When a Vserver is unlocked, configuration changes are permitted. A failure is returned if the Vserver is not locked by the administrator or if it is locked by internal applications. If the vserver lock remains due to an error condition, it can be forcefully removed by specifying the force option of vserver unlock CLI command at diagnostic privilege.

---

### Related Links
* [Get-NcVserver](Get-NcVserver)

---

### Examples
> Example 1

Unlock-NcVserver -Name pester
Remove the configuration lock on the given vserver.

Vserver                   State      VserverType   Comment
-------                   -----      -----------   -------
pester                    running    data

---

### Parameters
#### **Name**
Name of the vserver.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Vserver|

#### **Force**
Specify to force unlock of a Vserver which got locked as part of a Disaster Recovery event or an error condition.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverInfo

---

### Notes
Category: vserver
API: vserver-unlock
Family: cluster

---

### Syntax
```PowerShell
Unlock-NcVserver [-Name] <String> [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
