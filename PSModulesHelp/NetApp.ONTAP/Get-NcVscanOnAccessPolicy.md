Get-NcVscanOnAccessPolicy
-------------------------

### Synopsis
Get list of vscan On-Access policies.

---

### Description

Get list of vscan On-Access policies.

---

### Related Links
* [Set-NcVscanOnAccessPolicy](Set-NcVscanOnAccessPolicy)

* [New-NcVscanOnAccessPolicy](New-NcVscanOnAccessPolicy)

* [Enable-NcVscanOnAccessPolicy](Enable-NcVscanOnAccessPolicy)

* [Disable-NcVscanOnAccessPolicy](Disable-NcVscanOnAccessPolicy)

* [Remove-NcVscanOnAccessPolicy](Remove-NcVscanOnAccessPolicy)

---

### Examples
> Example 1

Get-NcVscanOnAccessPolicy
Get all of the on-access policies for the current Vserver.

Name                      Protocol   Filters                         Enabled   Vserver
----                      --------   -------                         -------   -------
default_CIFS              cifs       {scan_mandatory}                 False    pstk01
pstk_policy1              cifs       {scan_execute_access}            False    pstk01
pstk_policy2              cifs       {scan_mandatory}                  True    pstk01

> Example 2

```PowerShell
Get-NcVscanOnAccessPolicy -Query @{Enabled=$true}
Get the currently enabled Vscan on-access policy.

Name                     : pstk_policy2
Enabled                  : True
AdminOwner               : vserver
FileExtToExclude         :
Filters                  : {scan_mandatory}
IsPolicyEnabled          : True
MaxFileSize              : 2147483648
NcController             : 10.63.10.33
PathsToExclude           :
PolicyName               : pstk_policy2
Protocol                 : cifs
Vserver                  : pstk01

```

---

### Parameters
#### **Name**
One or more On-Access policies.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VscanOnAccessPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVscanOnAccessPolicy -Template" to get the initially empty VscanOnAccessPolicyInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[NaSerializable]`|false   |named   |false        |

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

#### **Query**
For advanced queries, provide a VscanOnAccessPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVscanOnAccessPolicy -Template" to get the initially empty VscanOnAccessPolicyInfo object.

|Type              |Required|Position|PipelineInput        |
|------------------|--------|--------|---------------------|
|`[NaSerializable]`|false   |1       |true (ByPropertyName)|

#### **Template**
Specify to get an empty VscanOnAccessPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vscan.VscanOnAccessPolicyInfo

---

### Notes
Category: vscan
API: vscan-on-access-policy-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVscanOnAccessPolicy [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <NaSerializable>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanOnAccessPolicy [[-Query] <NaSerializable>] [-Attributes <NaSerializable>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVscanOnAccessPolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
