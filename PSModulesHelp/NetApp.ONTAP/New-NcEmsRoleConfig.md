New-NcEmsRoleConfig
-------------------

### Synopsis

New-NcEmsRoleConfig [[-LimitAccessToGlobalConfigs] <bool>] [[-EventFilterName] <string>] [[-AccessControlRole] <string>] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-WhatIf] [-Confirm] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AccessControlRole**
Access control role that the event filter is assigned to

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |2       |true (ByPropertyName)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

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
{@{name=New-NcEmsRoleConfig; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
