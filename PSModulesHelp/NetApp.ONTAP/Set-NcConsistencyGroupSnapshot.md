Set-NcConsistencyGroupSnapshot
------------------------------

### Synopsis

Set-NcConsistencyGroupSnapshot [-ConsistencyGroup] <string> [-Name] <string> -Vserver <string> [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-WhatIf] [-Confirm] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **ConsistencyGroup**
Name of Consistency Group

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[string]`|true    |0       |false        |ConsistencyGroupName|

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

#### **Name**
Name of the Snapshot copy

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[string]`|true    |1       |false        |SnapshotCopyName|

#### **Vserver**
Name of Svm

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[string]`|true    |Benannt |false        |VS<br/>SvmName|

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
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem                                                                                                                
```
```PowerShell
----------                                                                                                                
```
```PowerShell
{@{name=Set-NcConsistencyGroupSnapshot; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
