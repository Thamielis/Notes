Invoke-NcCifsBranchCacheHash
----------------------------

### Synopsis
Force the generation of BranchCache hashes for a file or path.

---

### Description

Force the generation of BranchCache hashes for a file or path.

---

### Related Links
* [Invoke-NcCifsBranchCacheFlush](Invoke-NcCifsBranchCacheFlush)

* [Get-NcCifsBranchCache](Get-NcCifsBranchCache)

---

### Examples
> Example 1

```PowerShell
Invoke-NcCifsBranchCacheHash -Path /powershell/file
Force the generation of CIFS BranchCache hashes for the given file.

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
#### **Path**
Path to the file or directory to hash.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Recurse**
If specified, hashes will be recursively computed for all files in the directory.

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
* DataONTAP.C.Types.Cifs.CifsBranchcache

---

### Notes
Category: cifs
API: cifs-branchcache-hash
Family: vserver

---

### Syntax
```PowerShell
Invoke-NcCifsBranchCacheHash [-Path] <String> [-Recurse] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
