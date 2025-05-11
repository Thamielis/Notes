Get-NcNfsExportPolicyRulesByPolicyId
------------------------------------

### Synopsis
Retrieves export policy rules.

---

### Description

Retrieves export policy rules.This cmdlet is supported with Rest.

---

### Related Links
* [Add-NcNfsExportPolicyRulesByPolicyId](Add-NcNfsExportPolicyRulesByPolicyId)

* [Set-NcNfsExportPolicyRulesByPolicyId](Set-NcNfsExportPolicyRulesByPolicyId)

* [Remove-NcNfsExportPolicyRulesByPolicyId](Remove-NcNfsExportPolicyRulesByPolicyId)

---

### Examples
> Example 1

```PowerShell
Get-NcNfsExportPolicyRulesByPolicyId -Id 12884901889
Retrieves export policy rules.

NcController        : 10.236.139.159
ActualPathname      :
Pathname            :
SecurityRules       :
ExportChownMode     : restricted
NtfsUnixSecurity    : fail
Svm                 : DataONTAP.C.Types.Nfs.Svm
AllowSuid           : False
Clients             : {DataONTAP.C.Types.Nfs.Client}
AllowDeviceCreation : False
Policy              : DataONTAP.C.Types.Nfs.Policy
Protocols           : {any}
RoRule              : {none}
RwRule              : {none}
AnonymousUser       : 65534
Superuser           : {any}
Index               : 1

```

---

### Parameters
#### **Id**
Existing export policy for which to create an export rule.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|Policyid|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.ExportsRuleInfo2

---

### Notes
Category: protocol
API: api/protocols/nfs/export-policies
Family: nfs

---

### Syntax
```PowerShell
Get-NcNfsExportPolicyRulesByPolicyId [-Id] <String> [<CommonParameters>]
```
