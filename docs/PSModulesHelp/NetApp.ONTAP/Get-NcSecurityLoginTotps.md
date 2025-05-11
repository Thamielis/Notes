Get-NcSecurityLoginTotps
------------------------

### Synopsis

Get-NcSecurityLoginTotps [[-Enabled] <bool>] [[-Scope] <string>] [-Attributes <SecurityLoginTotpsOutput>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

Get-NcSecurityLoginTotps [[-Enabled] <bool>] [[-Scope] <string>] -Template [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

Get-NcSecurityLoginTotps [[-Enabled] <bool>] [[-Scope] <string>] -Query <SecurityLoginTotpsOutput> [-Attributes <SecurityLoginTotpsOutput>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityLoginTotpsOutput]`|false   |Benannt |false        |

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Enabled**
Status of the TOTP profile.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |0       |false        |

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Query**

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityLoginTotpsOutput]`|true    |Benannt |false        |

#### **Scope**
Scope of the entity. Set to cluster for cluster owned objects and to svm for SVM owned objects.
Valid Values:

* Svm
* Cluster

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Template**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |Benannt |false        |

#### **ZapiCall**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Benannt |false        |ONTAPI |

#### **ZapiRetryCount**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Benannt |false        |

---

### Inputs
NetApp.Ontapi.Filer.C.NcController[]

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginTotpsOutput

---

### Syntax
```PowerShell
syntaxItem                                                                                                                                                                                      
```
```PowerShell
----------                                                                                                                                                                                      
```
```PowerShell
{@{name=Get-NcSecurityLoginTotps; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}, @{name=Get-NcSecurityLoginTotps; CommonParameters=True; WorkflowCommonPa...
```
