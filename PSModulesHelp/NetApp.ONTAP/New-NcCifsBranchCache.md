New-NcCifsBranchCache
---------------------

### Synopsis
Create and setup the BranchCache service.

---

### Description

Create and setup the BranchCache service.

---

### Related Links
* [Get-NcCifsBranchCache](Get-NcCifsBranchCache)

* [Set-NcCifsBranchCache](Set-NcCifsBranchCache)

* [Remove-NcCifsBranchCache](Remove-NcCifsBranchCache)

---

### Examples
> Example 1

```PowerShell
New-NcCifsBranchCache /hashes -ServerKey "beam01ServerSecret" -HashStoreMaxSize 25GB
Create the CIFS BranchCache service for the current Vserver.

HashStoreMaxSize : 26843545600
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
Path to the directory where hash files are stored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **HashStoreMaxSize**
Maximum size the hash store can grow to.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Version**
Versions of the BranchCache protocol that are supported.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ServerKey**
BranchCache server key.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OperatingMode**
The mode in which the BranchCache service will operate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
API: cifs-branchcache-create
Family: vserver

---

### Syntax
```PowerShell
New-NcCifsBranchCache [-HashStorePath] <String> [-HashStoreMaxSize <String>] [-Version <String[]>] [-ServerKey <String>] [-OperatingMode <String>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
