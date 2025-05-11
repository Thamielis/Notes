New-NcCloneToken
----------------

### Synopsis
Create a token to reserve available split load on a node.

---

### Description

Create a token to reserve available split load on a node. This token can be used with New-NcClone cmdlet to use up the reserved split load. This is to allow clone creates from getting throttled.

---

### Related Links
* [New-NcClone](New-NcClone)

* [Set-NcCloneTokenExpiry](Set-NcCloneTokenExpiry)

* [Remove-NcCloneToken](Remove-NcCloneToken)

* [Get-NcCloneToken](Get-NcCloneToken)

---

### Examples
> Example 1

```PowerShell
New-NcCloneToken -Node aparajir-vvsim-01 -ReserveSize 4096
Reserve 4096 bytes of split load on node1

NcController                          : 10.238.48.40
Node                                  : aparajir-vvsim-01
ReservationDurationLimit              : 60
ReservationDurationRemaining          : 59
ReserveSize                           : 4096
TokenUuid                             : 8559dda1-d884-436a-8b8f-e117fc18d071
ReservationDurationLimitSpecified     : True
ReservationDurationRemainingSpecified : True

```

---

### Parameters
#### **Node**
Node name on which split load is reserved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ReserveSize**
Available reserve in split load reserved by token.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ExpiryLimit**
The duration (in seconds) for which the reserved token is valid.
This parameter is available in ONTAP 8.4 and later.

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
* DataONTAP.C.Types.Clone.CloneTokenInfo

---

### Notes
Category: clone
API: clone-token-create
Family: cluster, vserver

---

### Syntax
```PowerShell
New-NcCloneToken [-Node] <String> [-ReserveSize] <String> [-ExpiryLimit <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
