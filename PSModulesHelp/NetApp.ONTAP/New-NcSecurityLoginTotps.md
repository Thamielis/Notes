New-NcSecurityLoginTotps
------------------------

### Synopsis

New-NcSecurityLoginTotps [[-OwnerName] <string>] [[-AccountName] <string>] [[-Comment] <string>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-WhatIf] [-Confirm] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AccountName**
User account Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Comment**
Optional comment for the TOTP profile.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **OwnerName**
The name of the SVM. This field cannot be specified in a PATCH method.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
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
{@{name=New-NcSecurityLoginTotps; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
