Remove-NcSecuritySessionUserLimit
---------------------------------

### Synopsis
Removes a per-user session limit.

---

### Description

Removes a per-user session limit.

---

### Related Links
* [Set-NcSecuritySessionUserLimit](Set-NcSecuritySessionUserLimit)

* [Get-NcSecuritySessionUserLimit](Get-NcSecuritySessionUserLimit)

* [New-NcSecuritySessionUserLimit](New-NcSecuritySessionUserLimit)

---

### Examples
> Example 1

Remove-NcSecuritySessionUserLimit -Interface cli -Username aparajir -Vserver test
Remove restrictions on the maximum number of concurrent CLI sessions by the user aparajir on test vserver

Remove session limit
Are you sure you want to remove session limit for user aparajir?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y
PS >

---

### Parameters
#### **Interface**
The interface (cli or ontapi) for this application limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Username**
The name of the authenticated user for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
The name of the Vserver for this limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* 

---

### Notes
Category: security session
API: security-session-limit-user-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcSecuritySessionUserLimit [-Interface] <String> [-Username] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
