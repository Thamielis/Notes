Set-VBRNASBackupArchivalOptions
-------------------------------

### Synopsis

Set-VBRNASBackupArchivalOptions -Options <VBRNASBackupArchivalOptions> [-ArchivalType <VBRNASBackupArchivalType>] [-InclusionMask <string[]>] [-ExclusionMask <string[]>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ArchivalType**

Valid Values:

* All
* InclusionMask
* ExclusionMask

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRNASBackupArchivalType]`|false   |Benannt |false        |

#### **ExclusionMask**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Benannt |false        |

#### **InclusionMask**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Benannt |false        |

#### **Options**

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRNASBackupArchivalOptions]`|true    |Benannt |true (ByValue, ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupArchivalOptions

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
{@{name=Set-VBRNASBackupArchivalOptions; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
