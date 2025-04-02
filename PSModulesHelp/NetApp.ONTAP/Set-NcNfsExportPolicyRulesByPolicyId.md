Set-NcNfsExportPolicyRulesByPolicyId
------------------------------------

### Synopsis
Updates the properties of an export policy to change an export policy name or replace all export policy rules.

---

### Description

Updates the properties of an export policy to change an export policy name or replace all export policy rules..This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcNfsExportPolicyRulesByPolicyId](Get-NcNfsExportPolicyRulesByPolicyId)

* [Remove-NcNfsExportPolicyRulesByPolicyId](Remove-NcNfsExportPolicyRulesByPolicyId)

* [Add-NcNfsExportPolicyRulesByPolicyId](Add-NcNfsExportPolicyRulesByPolicyId)

---

### Examples
> Example 1

Set-NcNfsExportPolicyRulesByPolicyId -Id 12884901889 -ReadOnly any -ReadWrite any  -Index 3 -AllowDeviceCreation true -Superuser none
Updates the properties of an export policy to change an export policy name or replace all export policy rules.

Pathname                         SecurityRules
--------                         -------------

---

### Parameters
#### **Id**
Existing export policy for which to create an export rule.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|Policyid|

#### **Index**
Specifies Export rule index

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ReadOnly**
An array of hostnames which only have read privileges for all the security flavors found in the SecurityFlavors list.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **ReadWrite**
An array of hostnames which have read and write privileges for all the security flavors found in the SecurityFlavors list.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NtfsUnixSecurity**
NTFS export UNIX security options

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Bool]`|false   |named   |false        |

#### **Protocols**
Access Protocol(s) that the export rule describes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowDeviceCreation**
Specifies whether or not device creation is allowed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowSuid**
Specifies whether or not SetUID bits in SETATTR Op is to be honored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ChownMode**
Specifies who is authorized to change the ownership mode of a file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Superuser**
Represents an authentication flavor.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AnonymousUser**
User ID To Which Anonymous Users Are Mapped.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Set-NcNfsExportPolicyRulesByPolicyId [-Id] <String> [[-Index] <String>] [[-ReadOnly] <PSCredential>] [-ReadWrite <String>] [-NtfsUnixSecurity] [-Protocols <String>] [-AllowDeviceCreation 
```
```PowerShell
<String>] [-AllowSuid <String>] [-ChownMode <String>] [-Superuser <String>] [-AnonymousUser <String>] [<CommonParameters>]
```
