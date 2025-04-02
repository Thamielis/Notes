Invoke-NcCifsBranchCacheFlush
-----------------------------

### Synopsis
Flush (delete) all the BranchCache hashes that have been generated for a Vserver.

---

### Description

Flush (delete) all the BranchCache hashes that have been generated for a Vserver.

---

### Related Links
* [Invoke-NcCifsBranchCacheHash](Invoke-NcCifsBranchCacheHash)

* [Get-NcCifsBranchCache](Get-NcCifsBranchCache)

---

### Examples
> Example 1

```PowerShell
Invoke-NcCifsBranchCacheFlush
Delete all BranchCache hashes that have been generated.

HashStoreMaxSize : 21474836480
HashStorePath    : /hashes
NcController     : 10.63.165.62
OperatingMode    : per_share
ServerKey        :
Versions         : {enable_all}
Vserver          : beam01

```

---

### Parameters
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
* DataONTAP.C.Types.Cifs.CifsBranchcache

---

### Notes
Category: cifs
API: cifs-branchcache-flush
Family: vserver

---

### Syntax
```PowerShell
Invoke-NcCifsBranchCacheFlush [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
