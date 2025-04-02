Get-NcSecurityIpsecSecurityAssociation
--------------------------------------

### Synopsis
Retrieves the IPsec and IKE (Internet Key Exchange) security associations.

---

### Description

Retrieves the IPsec and IKE (Internet Key Exchange) security associations. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> 

---

### Parameters
#### **CipherSuite**
Cipher suite for the security association

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **LocalAddress**
Local address of the security association.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[String]`|false   |0       |false (ByPropertyName)|

#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput         |Aliases|
|----------|--------|--------|----------------------|-------|
|`[String]`|false   |0       |false (ByPropertyName)|SvmName|

#### **Template**
Specify $a = Get-NcSecurityIpsecSecurityAssociation -Template, to get an empty ipsec security object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpsecSecurityAssociation -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityIpsecSecurityAssociation -Template, to get an empty security ipsec object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpsecSecurityAssociation -Query $a.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[SecurityIpsecSecurityAssociationOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityIpsecSecurityAssociationOutput, to get an empty ipsec association object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpsecSecurityAssociation -Attributes $a.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[SecurityIpsecSecurityAssociationOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityIpsecSecurityAssociationOutput

---

### Notes
Category: Security
Api: api/security/ipsec/security-associations
Family: NcController

---

### Syntax
```PowerShell
Get-NcSecurityIpsecSecurityAssociation [[-CipherSuite] <String>] [[-PolicyName] <String>] [[-Vserver] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpsecSecurityAssociation -Template <DataONTAP.C.Types.Security.SecurityIpsecSecurityAssociationOutput> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpsecSecurityAssociation -Query <SecurityIpsecSecurityAssociationOutput> [-Attributes <SecurityIpsecSecurityAssociationOutput>] [<CommonParameters>]
```
