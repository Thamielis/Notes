Disable-NcVscanOnAccessPolicy
-----------------------------

### Synopsis
Disable the vscan On-Access policy.

---

### Description

Disable the vscan On-Access policy.

---

### Related Links
* [Enable-NcVscanOnAccessPolicy](Enable-NcVscanOnAccessPolicy)

* [Get-NcVscanOnAccessPolicy](Get-NcVscanOnAccessPolicy)

---

### Examples
> Example 1

```PowerShell
Disable-NcVscanOnAccessPolicy -Name default_CIFS
Disable the default CIFS on-access policy.

AdminOwner               : cluster
FileExtToExclude         :
Filters                  : {scan_mandatory}
IsPolicyEnabled          : False
MaxFileSize              : 2147483648
NcController             : 10.63.10.33
PathsToExclude           :
PolicyName               : default_CIFS
Protocol                 : cifs
Vserver                  : pstk01

```

---

### Parameters
#### **Name**
Name of the policy to disable.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

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
* DataONTAP.C.Types.Vscan.VscanOnAccessPolicyInfo

---

### Notes
Category: vscan
API: vscan-on-access-policy-modify
Family: vserver

---

### Syntax
```PowerShell
Disable-NcVscanOnAccessPolicy [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
