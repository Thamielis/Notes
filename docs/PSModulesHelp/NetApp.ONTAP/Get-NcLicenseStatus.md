Get-NcLicenseStatus
-------------------

### Synopsis
Get Data ONTAP licenses status information.

---

### Description

Get Data ONTAP licenses status information.

---

### Examples
> Example 1

```PowerShell
Get-NcLicenseStatus
Get Data ONTAP licenses status information.

DetailedStatus :
License        : cifs
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : cloud
NcController   : 10.140.111.42
Scope          :
Status         : not_applicable

DetailedStatus :
License        : dp_optimized
NcController   : 10.140.111.42
Scope          :
Status         : not_installed

DetailedStatus :
License        : fabricpool
NcController   : 10.140.111.42
Scope          :
Status         : not_installed

DetailedStatus :
License        : fcp
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : flexclone
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : insight_balance
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : iscsi
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : nfs
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : ocshift
NcController   : 10.140.111.42
Scope          :
Status         : not_installed

DetailedStatus :
License        : select
NcController   : 10.140.111.42
Scope          :
Status         : not_applicable

DetailedStatus :
License        : snaplock
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : snapmanagersuite
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : snapmirror
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : snapprotectapps
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : snaprestore
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : snapvault
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : tpm
NcController   : 10.140.111.42
Scope          :
Status         : not_installed

DetailedStatus :
License        : v_storageattach
NcController   : 10.140.111.42
Scope          : site
Status         : valid

DetailedStatus :
License        : ve
NcController   : 10.140.111.42
Scope          :
Status         : not_installed

```

---

### Parameters
#### **License**
License Name.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Status**
Current status of the license.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[LicenseV2LicenseInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
Specify to get an empty license-v2 object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a license-v2 object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLicenseStatus -Template" to get the initially empty license-v2 object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[LicenseV2LicenseInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.LicenseV2.LicenseV2LicenseInfo

---

### Notes
Category: License
API: license-v2-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcLicenseStatus [[-License] <String[]>] [[-Status] <String[]>] [-Attributes <LicenseV2LicenseInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLicenseStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcLicenseStatus -Query <LicenseV2LicenseInfo> [-Attributes <LicenseV2LicenseInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
