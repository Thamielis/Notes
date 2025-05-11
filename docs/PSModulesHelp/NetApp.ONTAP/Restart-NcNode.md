Restart-NcNode
--------------

### Synopsis
Reboot the specified node.

---

### Description

Reboot the specified node.  Only an admin can reboot the node.

---

### Related Links
* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

Restart-NcNode f3250-215-73-75-02 -UseSp
Power Cycle node
Are you sure you want to power cycle node f3250-215-73-75-02 using the SP firmware?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

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

#### **AllowLifMigrationBeforeReboot**
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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UseSp**
Specify to PowerCycle the node using the Service Processor firmware

|Type      |Required|Position|PipelineInput|Aliases                           |
|----------|--------|--------|-------------|----------------------------------|
|`[Switch]`|false   |named   |false        |PowerCycle<br/>UseServiceProcessor|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: system
API: system-node-reboot, system-node-power-cycle
Family: cluster

---

### Syntax
```PowerShell
Restart-NcNode [-Name] <String> [-Reason <String>] [-IgnoreFullSyncWarnings] [-Controller <NcController[]>] [-AllowInhibitTakeover] [-DontDump] [-AllowLifMigrationBeforeReboot] 
```
```PowerShell
[-IgnoreQuorumWarnings] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Restart-NcNode [-Name] <String> [-Controller <NcController[]>] [-UseSp] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
