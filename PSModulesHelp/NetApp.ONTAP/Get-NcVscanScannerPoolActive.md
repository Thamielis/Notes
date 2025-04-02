Get-NcVscanScannerPoolActive
----------------------------

### Synopsis
Get active scanner pool configuration of a vserver.

---

### Description

Get active scanner pool configuration of a vserver.

---

### Related Links
* [Get-NcVscanScannerPool](Get-NcVscanScannerPool)

---

### Examples
> Example 1

```PowerShell
Get-NcVscanScannerPoolActive
Get the active scanner pool configuration for all Vservers in the current cluster.

VscanServer                     : {10.61.169.75}
MaxSessionSetupRetries          : 5
NcController                    : 10.63.10.33
PrivilegedUsers                 : {RTPRRE\Administrator}
RequestTimeout                  : 30
ScannerPools                    : {pstk_scanner1}
ScanQueueTimeout                : 20
Servers                         : {10.61.169.75}
SessionSetupTimeout             : 10
SessionTeardownTimeout          : 10
Vserver                         : pstk01

```

---

### Parameters
#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VscanActiveScannerPoolInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVscanScannerPoolActive -Template" to get the initially empty VscanActiveScannerPoolInfo object.  If not specified, all data is returned for each object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VscanActiveScannerPoolInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty VscanActiveScannerPoolInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VscanActiveScannerPoolInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVscanScannerPoolActive -Template" to get the initially empty VscanActiveScannerPoolInfo object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VscanActiveScannerPoolInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vscan.VscanActiveScannerPoolInfo

---

### Notes
Category: vscan
API: vscan-active-scanner-pool-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVscanScannerPoolActive [[-Vserver] <String[]>] [-Attributes <VscanActiveScannerPoolInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanScannerPoolActive -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanScannerPoolActive -Query <VscanActiveScannerPoolInfo> [-Attributes <VscanActiveScannerPoolInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
