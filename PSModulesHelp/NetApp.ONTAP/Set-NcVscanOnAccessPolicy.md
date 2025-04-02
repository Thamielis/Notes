Set-NcVscanOnAccessPolicy
-------------------------

### Synopsis
Modify a Vscan On-Access policy.

---

### Description

Modify a Vscan On-Access policy.

---

### Related Links
* [Get-NcVscanOnAccessPolicy](Get-NcVscanOnAccessPolicy)

* [New-NcVscanOnAccessPolicy](New-NcVscanOnAccessPolicy)

* [Remove-NcVscanOnAccessPolicy](Remove-NcVscanOnAccessPolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcVscanOnAccessPolicy -Name pstk_policy2 -MaxFileSize 1GB
Change the max file size for the given vscan on-access policy.

Name                     : pstk_policy2
Enabled                  : True
AdminOwner               : vserver
FileExtToExclude         :
Filters                  : {scan_mandatory}
IsPolicyEnabled          : True
MaxFileSize              : 1073741824
NcController             : 10.63.10.33
PathsToExclude           :
PolicyName               : pstk_policy2
Protocol                 : cifs
Vserver                  : pstk01

```

---

### Parameters
#### **Name**
Name of the policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Filter**
Filters to apply.
Possible values: 
'scan_mandatory'      - Enable mandatory scan,
'scan_ro_volume'      - Enable scans for read-only volume,
'scan_execute_access' - Scan only files opened with execute-access (CIFS only)

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **MaxFileSize**
Max file-size (in bytes) allowed for scanning.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ExcludePath**
File paths for which On-Access scanning must not be performed.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ExcludeExtension**
File extensions for which On-Access scanning must not be performed.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **IncludeExtension**
File extensions for which On-Access scanning must be performed. The default value is '*', which means that all files are considered for scanning except those which are excluded from scanning.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ScanFilesWithNoExtension**
Specifies whether files without any extension are considered for scanning

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsScanMandatory**

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vscan.VscanOnAccessPolicyInfo

---

### Notes
Category: vscan
API: vscan-on-access-policy-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcVscanOnAccessPolicy [-Name] <String> [-Filter <String[]>] [-MaxFileSize <Int64>] [-ExcludePath <String[]>] [-ExcludeExtension <String[]>] [-IncludeExtension <String[]>] 
```
```PowerShell
[-ScanFilesWithNoExtension <Boolean>] [-IsScanMandatory <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
