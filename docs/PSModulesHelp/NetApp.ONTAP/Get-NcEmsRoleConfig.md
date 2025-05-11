Get-NcEmsRoleConfig
-------------------

### Synopsis

Get-NcEmsRoleConfig [[-LimitAccessToGlobalConfigs] <bool>] [[-EventFilterName] <string>] [-Attributes <EmsRoleConfigOutput>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

Get-NcEmsRoleConfig [[-LimitAccessToGlobalConfigs] <bool>] [[-EventFilterName] <string>] -Template [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

Get-NcEmsRoleConfig [[-LimitAccessToGlobalConfigs] <bool>] [[-EventFilterName] <string>] -Query <EmsRoleConfigOutput> [-Attributes <EmsRoleConfigOutput>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EmsRoleConfigOutput]`|false   |Benannt |false        |

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **EventFilterName**
Event filter name that is assigned to the access control role.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |1       |true (ByPropertyName)|

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **LimitAccessToGlobalConfigs**
Indicates whether the access control has limited access to global EMS configurations.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[bool]`|false   |0       |true (ByPropertyName)|

#### **Query**

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EmsRoleConfigOutput]`|true    |Benannt |false        |

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
System.Nullable`1[[System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]
System.String
NetApp.Ontapi.Filer.C.NcController[]

---

### Outputs
* DataONTAP.C.Types.Ems.EmsRoleConfigOutput

---

### Syntax
```PowerShell
syntaxItem                                                                                                                                                                                      
```
```PowerShell
----------                                                                                                                                                                                      
```
```PowerShell
{@{name=Get-NcEmsRoleConfig; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}, @{name=Get-NcEmsRoleConfig; CommonParameters=True; WorkflowCommonParameters=F...
```
