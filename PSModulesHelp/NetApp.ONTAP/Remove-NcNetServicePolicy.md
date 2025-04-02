Remove-NcNetServicePolicy
-------------------------

### Synopsis
Deletes a service policy for network interfaces.

---

### Description

Deletes a service policy for network interfaces. This cmdlet is supported with Rest

---

### Related Links
* [Set-NcNetServicePolicy](Set-NcNetServicePolicy)

* [Get-NcNetServicePolicy](Get-NcNetServicePolicy)

* [New-NcNetServicePolicy](New-NcNetServicePolicy)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetServicePolicy -Name testPolicy4
```

---

### Parameters
#### **Name**
Name(s) of Service Policy.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[string[]?]`|true    |0       |true (ByPropertyName)|

#### **Scope**
Scope of Service Policy. Set to \"svm\" for interfaces owned by an SVM. Otherwise, set to \"cluster\". Possible values are: [svm, cluster]

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[string]`|false   |1       |false (ByPropertyName)|

#### **IpSpaceName**
Name of IpSpace

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[string]`|false   |named   |false (ByPropertyName)|

#### **Vserver**
Name of SVM

|Type      |Required|Position|PipelineInput         |Aliases|
|----------|--------|--------|----------------------|-------|
|`[string]`|false   |named   |false (ByPropertyName)|SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Net
Api: api/network/ip/service-policies
Family: NcController

---

### Syntax
```PowerShell
Remove-NcNetServicePolicy [-Name] <string[]> [[-Scope] <string>] [-IpSpaceName <string>] [-Vserver <string>] [<CommonParameters>]
```
