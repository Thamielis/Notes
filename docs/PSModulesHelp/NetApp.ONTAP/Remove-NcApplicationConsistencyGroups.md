Remove-NcApplicationConsistencyGroups
-------------------------------------

### Synopsis
Deletes a consistency group.

---

### Description

Deletes a consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcApplicationConsistencyGroups](Get-NcApplicationConsistencyGroups)

* [New-NcApplicationConsistencyGroups](New-NcApplicationConsistencyGroups)

* [Set-NcApplicationConsistencyGroups](Set-NcApplicationConsistencyGroups)

---

### Examples
> Example 1

```PowerShell
Remove-NcApplicationConsistencyGroups -Name Volume_2 -Vserver vs1
Deletes consistency group 'Volume_2'.
```

---

### Parameters
#### **Name**
Name of Consistency group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Vserver**
Name of Svm

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: application
Api: /api/application/consistency-groups/{uuid}
Family: cluster

---

### Syntax
```PowerShell
Remove-NcApplicationConsistencyGroups [-Name] <String> [-Vserver <String>] [<CommonParameters>]
```
