Remove-NcVserverMigrate
-----------------------

### Synopsis
Deletes the SVM migration.This cmdlet is supported with Rest

---

### Description

Deletes the SVM migration.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcVserverMigrate](Get-NcVserverMigrate)

---

### Examples
> Example 1

```PowerShell
Remove-NcVserverMigrate -Vserver vs0
Removes the SVM migration.
```

---

### Parameters
#### **Vserver**
Vserver to which this object belongs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: VserverMigrate
API: /svm/migrations/{uuid}
Family: cluster

---

### Syntax
```PowerShell
Remove-NcVserverMigrate [-Vserver] <String> [<CommonParameters>]
```
