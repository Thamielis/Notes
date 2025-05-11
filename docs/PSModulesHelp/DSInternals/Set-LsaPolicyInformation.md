Set-LsaPolicyInformation
------------------------

### Synopsis
Configures AD-related Local Security Authority Policies of the local computer or a remote one.

---

### Description

Configures AD-related Local Security Authority (LSA) Policies of the local or a remote computer. This functionality is helpful when restoring Active Directory domain controllers (DC) from IFM backups. Note that running this command against a DC with parameters that do not match the information stored in its local AD database might prevent the target DC from booting ever again.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Set-LsaPolicyInformation.md)

* [New-ADDBRestoreFromMediaScript](New-ADDBRestoreFromMediaScript)

---

### Examples
> Example 1

```PowerShell
PS C:\> Set-LsaPolicyInformation -DomainName 'ADATUM' `
                                 -DnsDomainName 'Adatum.com' `
                                 -DnsForestName 'Adatum.com' `
                                 -DomainGuid 279b615e-ae79-4c86-a61a-50f687b9f7b8 `
                                 -DomainSid S-1-5-21-1817670852-3242289776-1304069626
Configures AD-related LSA Policy Information of the local computer.
```

---

### Parameters
#### **ComputerName**
Specifies the target computer for the operation. Enter a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. When the remote computer is in a different domain than the local computer, the fully qualified domain name is required.
The default is the local computer. To specify the local computer, such as in a list of computer names, use "localhost", the local computer name, or a dot (.).

|Type      |Required|Position|PipelineInput|Aliases                                                                                 |
|----------|--------|--------|-------------|----------------------------------------------------------------------------------------|
|`[String]`|false   |1       |False        |Server<br/>ServerName<br/>Computer<br/>Machine<br/>MachineName<br/>System<br/>SystemName|

#### **DnsDomainName**
Specifies the DNS name of the primary domain.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DnsForestName**
Specifies the DNS forest name of the primary domain. This is the DNS name of the domain at the root of the enterprise.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DomainGuid**
Specifies the GUID of the primary domain.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **DomainName**
Specifies the name of the primary domain.

|Type      |Required|Position|PipelineInput|Aliases                        |
|----------|--------|--------|-------------|-------------------------------|
|`[String]`|true    |named   |False        |NetBIOSDomainName<br/>Workgroup|

#### **DomainSid**
Specifies the SID of the primary domain.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SecurityIdentifier]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Set-LsaPolicyInformation [[-ComputerName] <String>] -DnsDomainName <String> -DnsForestName <String> -DomainGuid <Guid> -DomainName <String> -DomainSid <SecurityIdentifier> [<CommonParameters>]
```
