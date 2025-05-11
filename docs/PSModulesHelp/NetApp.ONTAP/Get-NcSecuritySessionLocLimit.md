Get-NcSecuritySessionLocLimit
-----------------------------

### Synopsis
Gets per-location session limits.

---

### Description

Gets per-location session limits.

---

### Related Links
* [Remove-NcSecuritySessionLocLimit](Remove-NcSecuritySessionLocLimit)

* [Set-NcSecuritySessionLocLimit](Set-NcSecuritySessionLocLimit)

* [New-NcSecuritySessionLocLimit](New-NcSecuritySessionLocLimit)

* [Get-NcSecuritySessionLocStats](Get-NcSecuritySessionLocStats)

---

### Examples
> Example 1

Get-NcSecuritySessionLocLimit
Get session limits on all locations

Location                             IPSpace                        Interface                            MaxActiveLimit
--------                             -------                        ---------                            --------------
10.238.49.52                         Default                        cli                                              64
-default-                            Default                        cli                                              32
-default-                            Default                        ontapi                                           20

---

### Parameters
#### **Interface**
Specify to filter by Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Location**
Specify to filter by Location

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Ipspace**
Specify to filter by Ipspace

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SessionLocationLimitsInfo]`|false   |named   |false        |

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

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SessionLocationLimitsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySession.SessionLocationLimitsInfo

---

### Notes
Category: security session
API: security-session-limit-location-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecuritySessionLocLimit [[-Interface] <String[]>] [[-Location] <String[]>] [[-Ipspace] <String[]>] [-Attributes <SessionLocationLimitsInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionLocLimit -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySessionLocLimit -Query <SessionLocationLimitsInfo> [-Attributes <SessionLocationLimitsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
