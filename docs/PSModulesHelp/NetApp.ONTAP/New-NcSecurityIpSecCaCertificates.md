New-NcSecurityIpSecCaCertificates
---------------------------------

### Synopsis
Add CA certificate to IPsec. The CA certificate should already be installed on the cluster prior to adding them to IPsec.

---

### Description

Add CA certificate to IPsec. The CA certificate should already be installed on the cluster prior to adding them to IPsec.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityIpSecCaCertificates](Get-NcSecurityIpSecCaCertificates)

* [Remove-NcSecurityIpSecCaCertificates](Remove-NcSecurityIpSecCaCertificates)

* [Set-NcSecurityIpSecCaCertificates](Set-NcSecurityIpSecCaCertificates)

---

### Examples
> Example 1

New-NcSecurityIpSecCaCertificates -CertificateId 6080eca0-d01d-11ec-80ed-00a0985cdaa1
Add CA certificate to IPsec. The CA certificate should already be installed on the cluster prior to adding them to IPsec.

Certificate                            Scope   Svm NcController
-----------                            -----   --- ------------
DataONTAP.C.Types.Security.Certificate cluster     10.236.58.57

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
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
Name of the svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityIpSecCaCertificates

---

### Notes
Category: Security
API: api/security/ipsec/ca-certificates
Family: Security

---

### Syntax
```PowerShell
New-NcSecurityIpSecCaCertificates [-CertificateId] <String> [[-VserverId] <String>] [[-Vserver] <PSCredential>] [<CommonParameters>]
```
