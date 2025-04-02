Get-NcSecuritySessionVserverLimit
---------------------------------

### Synopsis
Returns per-vserver session limits.

---

### Description

Returns per-vserver session limits.

---

### Related Links
* [Remove-NcSecuritySessionVserverLimit](Remove-NcSecuritySessionVserverLimit)

* [Set-NcSecuritySessionVserverLimit](Set-NcSecuritySessionVserverLimit)

* [New-NcSecuritySessionVserverLimit](New-NcSecuritySessionVserverLimit)

* [Get-NcSecuritySessionVserverStats](Get-NcSecuritySessionVserverStats)

---

### Examples
> Example 1

Get-NcSecuritySessionVserverLimit
Get session limits for all vservers in the cluster

Vserver                                                             Interface                            MaxActiveLimit
-------                                                             ---------                            --------------
Cluster                                                             cli                                              16
test                                                                cli                                              64
aparajircluster-1                                                   ontapi                                           24
Cluster                                                             ontapi                                           10

---

### Parameters
#### **Interface**
Specify to filter by Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Specify to filter by Vserver

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SessionVserverLimitsInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SessionVserverLimitsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionVserverLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-vserver-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionVserverLimit [[-Interface] <String[]>] [[-Vserver] <String[]>] [-Attributes <SessionVserverLimitsInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionVserverLimit -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionVserverLimit -Query <SessionVserverLimitsInfo> [-Attributes <SessionVserverLimitsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
