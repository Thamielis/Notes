Remove-NcFileserviceEventAudit
------------------------------

### Synopsis
Deletes an S3 audit configuration.

---

### Description

Deletes an S3 audit configuration. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcFileserviceEventAudit](Get-NcFileserviceEventAudit)

* [New-NcFileserviceEventAudit](New-NcFileserviceEventAudit)

* [Set-NcFileserviceEventAudit](Set-NcFileserviceEventAudit)

---

### Examples
> Example 1

```PowerShell
Remove-NcFileserviceEventAudit -Vserver vs1
```

---

### Parameters
#### **Vserver**
Name of the SVM.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |0       |true (ByPropertyName)|VS<br/>SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: FileserviceAudit
Api: api/protocols/audit/{svm.uuid}/object-store
Family: Controller, Vserver

---

### Syntax
```PowerShell
Remove-NcFileserviceEventAudit [-Vserver] <String> [<CommonParameters>]
```
