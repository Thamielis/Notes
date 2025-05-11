Set-NcSecurityIpSecPolicy
-------------------------

### Synopsis
Updates a specific IPsec policy.

---

### Description

Updates a specific IPsec policy.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityIpSecPolicy](Get-NcSecurityIpSecPolicy)

* [Remove-NcSecurityIpSecPolicy](Remove-NcSecurityIpSecPolicy)

* [New-NcSecurityIpSecPolicy](New-NcSecurityIpSecPolicy)

---

### Examples
> Example 1

Set-NcSecurityIpSecPolicy -Name testPolicyNew -Enabled $true -LocalEndpoint $localEndpoint -LocalIdentity newString -Protocol udp -RemoteEndpoint $remoteEndpoint -RemoteIdentity newString
Update a testPolicyNew policy.

Name          Enabled Scope
----          ------- -----
testPolicyNew False

---

### Parameters
#### **Name**
IPsec policy name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **LocalEndpoint**
Local endpoint for the IPsec policy..

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LocalIdentity**
Local Identity.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Protocol**
Lower layer protocol to be covered by the IPsec policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoteEndpoint**
Remote endpoint for the IPsec policy..

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoteIdentity**
Remote Identity.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityIpSecPolicies

---

### Notes
Category: IPsec policy.
API: api/security/ipsec/policies
Family: Security

---

### Syntax
```PowerShell
Set-NcSecurityIpSecPolicy [-Name] <String> [-Enabled] [-LocalEndpoint <String>] [-LocalIdentity <String>] [-Protocol <String>] [-RemoteEndpoint <String>] [-RemoteIdentity <String>] 
```
```PowerShell
[<CommonParameters>]
```
