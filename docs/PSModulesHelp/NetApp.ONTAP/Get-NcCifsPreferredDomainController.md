Get-NcCifsPreferredDomainController
-----------------------------------

### Synopsis
Get a list of preferred domain controllers associated with an Active Directory domain, organized by Vserver.

---

### Description

Get a list of preferred domain controllers associated with an Active Directory domain, organized by Vserver.

---

### Related Links
* [Add-NcCifsPreferredDomainController](Add-NcCifsPreferredDomainController)

* [Remove-NcCifsPreferredDomainController](Remove-NcCifsPreferredDomainController)

---

### Examples
> Example 1

Get-NcCifsPreferredDomainController
Get the list of preferred domain controllers kept by the current Vserver.

Domain                    PreferredDc
------                    -----------
DOMAIN                    {10.10.10.6, 10.10.10.7}
TEST                      {10.10.10.5}

---

### Parameters
#### **Domain**
The name of one or more domains to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Name   |

#### **Attributes**
For improved scalability in large clusters, provide a CifsDomainPreferredDc object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsPreferredDomainController -Template" to get the initially empty CifsDomainPreferredDc object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[CifsDomainPreferredDc]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty CifsDomainPreferredDc object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsDomainPreferredDc object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsPreferredDomainController -Template" to get the initially empty CifsDomainPreferredDc object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[CifsDomainPreferredDc]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsDomainPreferredDc

---

### Notes
Category: cifs
API: cifs-domain-preferred-dc-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcCifsPreferredDomainController [[-Domain] <String[]>] [-Attributes <CifsDomainPreferredDc>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPreferredDomainController -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPreferredDomainController -Query <CifsDomainPreferredDc> [-Attributes <CifsDomainPreferredDc>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
