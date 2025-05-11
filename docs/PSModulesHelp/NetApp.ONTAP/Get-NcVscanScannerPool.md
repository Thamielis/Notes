Get-NcVscanScannerPool
----------------------

### Synopsis
Get a list of vscan scanner pools.

---

### Description

Get a list of vscan scanner pools.  A scanner pool is a set of attributes which are used to validate and manage connections between clustered Data ONTAP and Vscan servers (virus scanners).

---

### Related Links
* [New-NcVscanScannerPool](New-NcVscanScannerPool)

* [Set-NcVscanScannerPool](Set-NcVscanScannerPool)

* [Remove-NcVscanScannerPool](Remove-NcVscanScannerPool)

---

### Examples
> Example 1

```PowerShell
Get-NcVscanScannerPool -Name pstk_scanner1
Get the requested scanner pool.

AdminOwner                      : vserver
IsCurrentlyActive               : True
MaxSessionSetupRetries          : 5
NcController                    : 10.63.10.33
PrivilegedUsers                 : {RTPRRE\Administrator}
RequestTimeout                  : 30
ScannerPolicy                   : primary
ScannerPool                     : pstk_scanner1
ScanQueueTimeout                : 20
Servers                         : {10.61.169.75}
SessionSetupTimeout             : 10
SessionTeardownTimeout          : 10
Vserver                         : pstk01

```
> Example 2

Get-NcVscanScannerPool -Query @{ScannerPolicy="primary"}
Get all vscan scanner pools with a scanner policy value of "primary".

Name                      ScannerPolicy  PrivilegedUsers                  Active   Vserver
----                      -------------  ---------------                  ------   -------
pstk_scanner1             primary        {RTPRRE\Administrator}            True    pstk01

---

### Parameters
#### **Name**
One or more scanner pools.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ScannerPool|

#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VscanScannerPoolInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVscanScannerPool -Template" to get the initially empty VscanScannerPoolInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VscanScannerPoolInfo]`|false   |named   |false        |

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
Specify to get an empty VscanScannerPoolInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VscanScannerPoolInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVscanScannerPool -Template" to get the initially empty VscanScannerPoolInfo object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VscanScannerPoolInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vscan.VscanScannerPoolInfo

---

### Notes
Category: vscan
API: vscan-scanner-pool-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVscanScannerPool [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <VscanScannerPoolInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanScannerPool -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanScannerPool -Query <VscanScannerPoolInfo> [-Attributes <VscanScannerPoolInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
