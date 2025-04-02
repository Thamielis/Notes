Get-NcSystemVendorInfo
----------------------

### Synopsis
Obtain the Data ONTAP vendor information.

---

### Description

Obtain the Data ONTAP vendor information.

---

### Related Links
* [Get-NcSystemVersion](Get-NcSystemVersion)

---

### Examples
> Example 1

```PowerShell
Get-NcSystemVendorInfo
Obtain the Data ONTAP vendor information for the current cluster.

NcController           : 10.61.172.155
AutosupportEmail       : autosupport@netapp.com
AutosupportUrl         : support.netapp.com/asupprod/post/1.0/postAsup
CompleteName           : NetApp
CustomerSupportContact : Please contact NetApp Global Services.
CustomerSupportName    : NetApp Global Services
InformationUrl         : http://now.netapp.com/autosupport/
OntapOidPrefix         : .1.3.6.1.4.1.789
ProductUrl             : http://now.netapp.com/installedproducts/
ShortName              : NetApp

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
* DataONTAP.C.Types.System.SystemVendorInfo

---

### Notes
Category: system
API: system-get-vendor-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemVendorInfo [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
