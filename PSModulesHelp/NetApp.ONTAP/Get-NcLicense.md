Get-NcLicense
-------------

### Synopsis
Get information for ONTAP licenses.

---

### Description

Get information for ONTAP licenses.

---

### Related Links
* [Add-NcLicense](Add-NcLicense)

* [Remove-NcLicense](Remove-NcLicense)

---

### Examples
> Example 1

```PowerShell
Get-NcLicense iscsi
Get the iscsi license.

Expiration       :
CustomerId       :
Description      : iSCSI License
ExpirationTime   :
ExpirationTimeDT :
Legacy           : True
NcController     : 10.63.165.62
Owner            : sfp-cmode-02-02
Package          : iscsi
SerialNumber     : 1-81-0000000000000700001061784
Type             : license
LegacySpecified  : True

Expiration       :
CustomerId       :
Description      : iSCSI License
ExpirationTime   :
ExpirationTimeDT :
Legacy           : True
NcController     : 10.63.165.62
Owner            : sfp-cmode-02-01
Package          : iscsi
SerialNumber     : 1-81-0000000000000700001061772
Type             : license
LegacySpecified  : True

```

---

### Parameters
#### **Name**
Name of the licensed package.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |1       |true (ByPropertyName)|Package<br/>Service|

#### **Owner**
Controller or cluster that owns the serial number.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.LicenseV2.LicenseV2Info

---

### Notes
Category: license
API: license-v2-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcLicense [[-Name] <String>] [[-Owner] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
