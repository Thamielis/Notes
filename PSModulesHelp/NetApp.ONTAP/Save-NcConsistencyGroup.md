Save-NcConsistencyGroup
-----------------------

### Synopsis
Commits the snapshots that were started during the preceding New-NaConsistencyGroup call.

---

### Description

Commits the snapshots that were started during the preceding New-NaConsistencyGroup call that returned the consistency group ID key, and unfences the volumes that were fenced.

---

### Related Links
* [New-NcConsistencyGroup](New-NcConsistencyGroup)

---

### Examples
> Example 1

```PowerShell
Save-NcConsistencyGroup 97188234 -Verbose
Commit the cg operation with ID 97188234

VERBOSE: Committing snapshots for consistency group 97188234.
VERBOSE: Consistency Group 97188234 committed

```

---

### Parameters
#### **ID**
Key to identify the ongoing cg operation.

|Type     |Required|Position|PipelineInput        |Aliases                    |
|---------|--------|--------|---------------------|---------------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|ConsistencyGroupID<br/>CgId|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

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
Category: consistency group
API: cg-commit
Family: vserver

---

### Syntax
```PowerShell
Save-NcConsistencyGroup [-ID] <Int64> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
