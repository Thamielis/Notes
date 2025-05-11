Set-NcCloneTokenExpiry
----------------------

### Synopsis
Modify the allowed expiry limit for tokens.

---

### Description

Modify the allowed expiry limit for tokens.

---

### Related Links
* [Get-NcCloneToken](Get-NcCloneToken)

* [New-NcCloneToken](New-NcCloneToken)

* [Remove-NcCloneToken](Remove-NcCloneToken)

---

### Examples
> Example 1

```PowerShell
Set-NcCloneTokenExpiry -Node  aparajir-vvsim-01 -ExpiryLimit 300
Set expiry limit of split load reservation token on node 1 to 300seconds
```

---

### Parameters
#### **Node**
Node name on which split load is reserved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ExpiryLimit**
The duration (in seconds) for which the reserved token is valid

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|false   |2       |true (ByPropertyName)|ReservationDurationLimit|

#### **TokenUuid**
Token UUID for which the split load is reserved.
This parameter is available only in ONTAP 8.4 and later.

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
Category: clone
API: clone-token-modify-expiry-limit
Family: cluster, vserver

---

### Syntax
```PowerShell
Set-NcCloneTokenExpiry [-Node] <String> [[-ExpiryLimit] <String>] [-TokenUuid <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
