Stop-NcNode
-----------

### Synopsis
Shut down a node.

---

### Description

Shut down a node.  Only an admin can initiate a node shutdown.

---

### Related Links
* [Get-NcNode](Get-NcNode)

* [Start-NcNode](Start-NcNode)

---

### Examples
> Example 1

```PowerShell
Stop-NcNode node1
Shut down cluster node 'node1'.
```
> Example 2

Get-NcNode | Stop-NcNode
This simple command will shut down an entire cluster.  Seriously.  Don't do this.

Would anyone like a Klondike Bar?

---

### Parameters
#### **Name**
The node name.  This is the name defined during setup.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **Reason**
Reason for rebooting the node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IgnoreFullSyncWarnings**
Skip SnapMirror Synchronous Full Sync check before reboot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **AllowInhibitTakeover**
If specified, storage takeover by partner will be allowed. By default it is not allowed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DontDump**
If specified, no core dump will be created.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |NoDump |

#### **AllowLifMigrationBeforeShutdown**
If specified, allows migration of LIFs away from this node prior to reboot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnoreQuorumWarnings**
If specified, Ignore quorum warnings before reboot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UseSp**
Use the Service Processor firmware to power off a node

|Type      |Required|Position|PipelineInput|Aliases                         |
|----------|--------|--------|-------------|--------------------------------|
|`[Switch]`|false   |named   |false        |PowerOff<br/>UseServiceProcessor|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: system
API: system-node-shutdown, system-node-power-off
Family: cluster

---

### Syntax
```PowerShell
Stop-NcNode [-Name] <String> [-Reason <String>] [-IgnoreFullSyncWarnings] [-Controller <NcController[]>] [-AllowInhibitTakeover] [-DontDump] [-AllowLifMigrationBeforeShutdown] 
```
```PowerShell
[-IgnoreQuorumWarnings] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Stop-NcNode [-Name] <String> [-Controller <NcController[]>] [-UseSp] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
