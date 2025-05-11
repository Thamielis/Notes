Set-NcAntivirusEngine
---------------------

### Synopsis
This sets the attributes of the antivirus engine installed.

---

### Description

This sets the attributes of the antivirus engine installed.

---

### Related Links
* [Get-NcAntivirusEngine](Get-NcAntivirusEngine)

---

### Examples
> Example 1

```PowerShell
Set-NcAntivirusEngine -LicenseType none
Set the antivirus engine to have the license type "none".

NcController        : 10.61.172.155
IsEnabled           : False
LicenseKey          :
Vendor              : mcafee
ProductInfo         :
LicenseType         : none
LicenseExpiration   : 0
LicenseExpirationDT : 1/1/1970 12:00:00 AM
Seats               : 0
UpdateUrl           : http://update.nai.com/products/commonupdater

```

---

### Parameters
#### **LicenseKey**
Vendor-specific license key for license management that is currently in effect.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vendor**
Descriptive name of antivirus vendor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProductInfo**
Detailed information of the antivirus product

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LicenseType**
Vendor-specific license type. Possible values: "full" - full license; "eval" - evaluation license; "none" - no license

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LicenseExpiration**
Expiration date of the license.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **Seats**
Number of nodes that can run an instance of the antivirus software.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UpdateUrl**
HTTP/HTTPS url for downloading updates.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DesiredActivationCode**
Vendor-specific desired activation code for license management.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CurrentActivationCode**
Vendor-specific activation code for license management, that is currently in effect.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Enable**
If specified, the antivirus engine will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, the antivirus engine will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Antivirus.AvEngineInfo

---

### Notes
Category: antivirus
API: av-set-engine-info
Family: cluster

---

### Syntax
```PowerShell
Set-NcAntivirusEngine [-LicenseKey <String>] [-Vendor <String>] [-ProductInfo <String>] [-LicenseType <String>] [-LicenseExpiration <DateTime>] [-Seats <Int32>] [-UpdateUrl <String>] 
```
```PowerShell
[-DesiredActivationCode <String>] [-CurrentActivationCode <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAntivirusEngine [-Enable] [-LicenseKey <String>] [-Vendor <String>] [-ProductInfo <String>] [-LicenseType <String>] [-LicenseExpiration <DateTime>] [-Seats <Int32>] [-UpdateUrl 
```
```PowerShell
<String>] [-DesiredActivationCode <String>] [-CurrentActivationCode <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAntivirusEngine [-Disable] [-LicenseKey <String>] [-Vendor <String>] [-ProductInfo <String>] [-LicenseType <String>] [-LicenseExpiration <DateTime>] [-Seats <Int32>] [-UpdateUrl 
```
```PowerShell
<String>] [-DesiredActivationCode <String>] [-CurrentActivationCode <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
