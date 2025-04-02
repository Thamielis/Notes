Get-NcSecurityIpSecCaCertificates
---------------------------------

### Synopsis
Retrieves the collection of IPsec CA certificates configured for cluster and all SVMs.

---

### Description

Retrieves the collection of IPsec CA certificates configured for cluster and all SVMs.This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityIpSecCaCertificates](New-NcSecurityIpSecCaCertificates)

* [Set-NcSecurityIpSecCaCertificates](Set-NcSecurityIpSecCaCertificates)

* [Remove-NcSecurityIpSecCaCertificates](Remove-NcSecurityIpSecCaCertificates)

---

### Examples
> Example 1

Get-NcSecurityIpSecCaCertificates
Retrieves the collection of IPsec CA certificates configured for cluster and all SVMs.

Certificate                            Scope   Svm
-----------                            -----   ---
DataONTAP.C.Types.Security.Certificate cluster

---

### Parameters
#### **Scope**
Certificate scope.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|ScopeName|

#### **CertificateId**
Unique identifier of the certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **VserverId**
Unique identifier of the svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Name of the svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityIpSecCaCertificates

---

### Notes
Category: security
API: api/security/ipsec/ca-certificates
Family: security

---

### Syntax
```PowerShell
Get-NcSecurityIpSecCaCertificates [-Scope] <String> [-CertificateId] <String> [-VserverId] <String> [-Vserver] <String> [<CommonParameters>]
```
