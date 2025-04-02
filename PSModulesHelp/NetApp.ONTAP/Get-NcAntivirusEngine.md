Get-NcAntivirusEngine
---------------------

### Synopsis
Get the attributes of the antivirus engine installed.

---

### Description

Get the attributes of the antivirus engine installed.

---

### Related Links
* [Set-NcAntivirusEngine](Set-NcAntivirusEngine)

---

### Examples
> Example 1

```PowerShell
Get-NcAntivirusEngine
Get the attributes of the antivirus engine.

IsEnabled           : False
LicenseKey          :
Vendor              : mcafee
ProductInfo         :
LicenseType         :
LicenseExpiration   : 0
LicenseExpirationDT : 1/1/1970 12:00:00 AM
Seats               : 0
UpdateUrl           : http://update.nai.com/products/commonupdater

```

---

### Parameters
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
* DataONTAP.C.Types.Antivirus.AvEngineInfo

---

### Notes
Category: antivirus
API: av-get-engine-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcAntivirusEngine [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
