Remove-NcNfsExportPolicyRulesByPolicyId
---------------------------------------

### Synopsis
Remove the Policy Rule for policy Id.

---

### Description

Remove the Policy Rule for policy Id..This cmdlet is supported with Rest.

---

### Related Links
* [Add-NcNfsExportPolicyRulesByPolicyId](Add-NcNfsExportPolicyRulesByPolicyId)

* [Get-NcNfsExportPolicyRulesByPolicyId](Get-NcNfsExportPolicyRulesByPolicyId)

* [Set-NcNfsExportPolicyRulesByPolicyId](Set-NcNfsExportPolicyRulesByPolicyId)

---

### Examples
> Example 1

```PowerShell
Remove-NcNfsExportPolicyRulesByPolicyId -Id 12884901889 -Index 1
Remove the Policy Rule for policy Id.
```

---

### Parameters
#### **Id**
Existing export policy for which to create an export rule.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|Policyid|

#### **Index**
Specifies Export rule index.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category:  Nfs.
API: api/protocols/nfs/export-policies
Family: Nfs

---

### Syntax
```PowerShell
Remove-NcNfsExportPolicyRulesByPolicyId [-Id] <String> [-Index] <String> [<CommonParameters>]
```
