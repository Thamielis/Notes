Remove-NcSecurityIpSecCaCertificates
------------------------------------

### Synopsis
Deletes the IPsec CA certificate with the specified UUID from IPsec.

---

### Description

Deletes the IPsec CA certificate with the specified UUID from IPsec.This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityIpSecCaCertificates](New-NcSecurityIpSecCaCertificates)

* [Get-NcSecurityIpSecCaCertificates](Get-NcSecurityIpSecCaCertificates)

* [Set-NcSecurityIpSecCaCertificates](Set-NcSecurityIpSecCaCertificates)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityIpSecCaCertificates -CertificateId 6080eca0-d01d-11ec-80ed-00a0985cdaa1
Deletes the IPsec CA certificate with the specified UUID from IPsec
```

---

### Parameters
#### **CertificateId**
Unique identifier of the certificate

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
* 

---

### Notes
Category: Security
API: api/security/ipsec/ca-certificates
Family: Security

---

### Syntax
```PowerShell
Remove-NcSecurityIpSecCaCertificates [-CertificateId] <String> [-VserverId] <String> [-Vserver] <String> [<CommonParameters>]
```
