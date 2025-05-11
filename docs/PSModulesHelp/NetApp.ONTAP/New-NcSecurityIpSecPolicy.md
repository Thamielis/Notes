New-NcSecurityIpSecPolicy
-------------------------

### Synopsis
Creates an IPsec policy.

---

### Description

Creates an IPsec policy..This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityIpSecPolicy](Get-NcSecurityIpSecPolicy)

* [Remove-NcSecurityIpSecPolicy](Remove-NcSecurityIpSecPolicy)

* [Set-NcSecurityIpSecPolicy](Set-NcSecurityIpSecPolicy)

---

### Examples
> Example 1

New-NcSecurityIpSecPolicy -Name testPolicyNew -Action bypass -AuthenticationMethod none -Enabled $false -LocalIdentity string -Certificate $certificate -LocalEndpoint $localEndpoint -Protocol udp -RemoteEndpoint $remoteEndpoint -RemoteIdentity string -SvmName vs0
Add a testPolicyNew policy.

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

#### **Action**
Action for the IPsec policy." +
            "Possible values are : [ bypass, discard, esp_transport, esp_udp ]..
Valid Values:

* bypass
* discard
* esp_transport
* esp_udp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Authentication Method**
Authentication method for the IPsec policy." +
            "Possible values are : [ none, psk, pki ].

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Certificate**
Certificate for the IPsec policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Enabled**
Indicates whether or not the policy is enabled.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Bool]`|false   |named   |false        |

#### **IpspaceName**
Name of the Ipspace for the IPsec policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IpspaceUuid**
Unique Identifier of the Ipspace for the IPsec policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **SvmName**
Name of the Svm object for the IPsec policy.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Vserver|

#### **SvmUuid**
Unique Identifier of the Svm object for the IPsec policy.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |VserverUuid|

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
New-NcSecurityIpSecPolicy [-Name] <String> [[-Action] <String>] [[-AuthenticationMethod] <PSCredential>] [-Certificate <String>] [-Enabled] [-IpspaceName <String>] [-IpspaceUuid <String>] 
```
```PowerShell
[-LocalEndpoint <String>] [-LocalIdentity <String>] [-Protocol <String>] [-RemoteEndpoint <String>] [-RemoteIdentity <String>] [-SvmName <String>] [-SvmUuid <String>] [<CommonParameters>]
```
