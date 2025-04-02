Set-NcCifsBranchCache
---------------------

### Synopsis
Modify the CIFS BranchCache service settings.

---

### Description

Modify the CIFS BranchCache service settings.

---

### Related Links
* [Get-NcCifsBranchCache](Get-NcCifsBranchCache)

* [New-NcCifsBranchCache](New-NcCifsBranchCache)

* [Remove-NcCifsBranchCache](Remove-NcCifsBranchCache)

---

### Examples
> Example 1

```PowerShell
Set-NcCifsBranchCache -HashStoreMaxSize 20GB
Set the BranchCache hash store max size to 20GB.

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
#### **HashStorePath**
Path to the hash store.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HashStoreMaxSize**
Maximum size of the hash store.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Version**
Supported BranchCache versions.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ServerKey**
Encryption key used to store the hashes.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OperatingMode**
CIFS BranchCache operating mode.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FlushHashes**
If specified, delete existing hashes.

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
API: cifs-branchcache-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsBranchCache [-HashStorePath <String>] [-HashStoreMaxSize <String>] [-Version <String[]>] [-ServerKey <String>] [-OperatingMode <String>] [-FlushHashes] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
