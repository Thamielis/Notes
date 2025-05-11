Skip-GroupPolicy
----------------

### Synopsis
Used within ScriptBlocks only. Allows to exclude Group Policy from being affected by fixes

---

### Description

Used within ScriptBlocks only. Allows to exclude Group Policy from being affected by fixes. Only some commands support it. The goal is to support all cmdlets.

---

### Examples
> EXAMPLE 1

```PowerShell
Optimize-GPOZaurr -All -WhatIf -Verbose -LimitProcessing 2 {
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 1'
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 2'
}
```
> EXAMPLE 2

```PowerShell
Remove-GPOZaurr -Type Empty, Unlinked -BackupPath "$Env:UserProfile\Desktop\GPO" -BackupDated -LimitProcessing 2 -Verbose -WhatIf {
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 1'
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 2' -DomaiName 'ad.evotec.pl'
}
```

---

### Parameters
#### **Name**
Define Group Policy Name to skip

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[String]`|false   |named   |false        |GpoName<br/>DisplayName|

#### **GUID**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |ID     |

#### **DomaiName**
Define DomainName where Group Policy is located. Otherwise each domain will be checked and skipped if found with same name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Skip-GroupPolicy [-Name <String>] [-DomaiName <String>] [<CommonParameters>]
```
```PowerShell
Skip-GroupPolicy [-GUID <String>] [-DomaiName <String>] [<CommonParameters>]
```
