New-NcVscanScannerPool
----------------------

### Synopsis
Create a virus scanner pool.

---

### Description

Create a virus scanner pool, which is used for validating and managing connections between clustered Data ONTAP and Vscan servers.

---

### Related Links
* [Get-NcVscanScannerPool](Get-NcVscanScannerPool)

* [Set-NcVscanScannerPool](Set-NcVscanScannerPool)

* [Remove-NcVscanScannerPool](Remove-NcVscanScannerPool)

---

### Examples
> Example 1

```PowerShell
New-NcVscanScannerPool -Name pstk_scanner1 -VscanServer 10.61.169.73 -PrivilegedUser RTPRRE\Administrator
Create a new Vscan scanner pool.

AdminOwner                      : vserver
IsCurrentlyActive               : False
MaxSessionSetupRetries          : 5
NcController                    : 10.63.10.33
PrivilegedUsers                 : {RTPRRE\Administrator}
RequestTimeout                  : 30
ScannerPolicy                   : idle
ScannerPool                     : pstk_scanner1
ScanQueueTimeout                : 20
Servers                         : {10.61.169.73}
SessionSetupTimeout             : 10
SessionTeardownTimeout          : 10
Vserver                         : pstk01
IsCurrentlyActiveSpecified      : True
MaxSessionSetupRetriesSpecified : True
RequestTimeoutSpecified         : True
ScanQueueTimeoutSpecified       : True
SessionSetupTimeoutSpecified    : True
SessionTeardownTimeoutSpecified : True

```

---

### Parameters
#### **Name**
Name of the virus scanner pool.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|ScannerPool|

#### **VscanServer**
One or more IP addresses of Vscan servers which are allowed to connect to clustered Data ONTAP.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **PrivilegedUser**
One or more privileged users.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|

#### **RequestTimeout**
Total request-service time-limit in seconds. The default value is 30. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ScanQueueTimeout**
Scan-queue wait time-limit in seconds. The default is 20. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **SessionSetupTimeout**
Total session setup time-limit in seconds. The default value is 10. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **SessionTeardownTimeout**
Total session teardown time-limit in seconds. The default value is 10. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxSessionSetupRetries**
Maximum number of consecutive session-setup attempts. The default is 5. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **VscanCluster**
Specifies the cluster of the scanner pool. To instantiate the cluster, create object using New-Object DataONTAP.C.Types.Vscan.Cluster. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput        |Aliases|
|-----------------------------------|--------|--------|---------------------|-------|
|`[DataONTAP.C.Types.Vscan.Cluster]`|false   |named   |true (ByPropertyName)|Cluster|

#### **Role**
Specifies the role of the scanner pool. The possible values are:
primary - Always active.
secondary - Active only when none of the primary external virus - scanning servers are connected.
idle - Always inactive. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Vscan.VscanScannerPoolInfo

---

### Notes
Category: vscan
API: vscan-scanner-pool-create
Family: vserver

---

### Syntax
```PowerShell
New-NcVscanScannerPool [-Name] <String> [-VscanServer] <String[]> [-PrivilegedUser] <String[]> [-RequestTimeout <Int32>] [-ScanQueueTimeout <Int32>] [-SessionSetupTimeout <Int32>] 
```
```PowerShell
[-SessionTeardownTimeout <Int32>] [-MaxSessionSetupRetries <Int32>] [-VserverContext <String>] [-VscanCluster <DataONTAP.C.Types.Vscan.Cluster>] [-Role <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
