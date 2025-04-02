New-DSPamProvider
-----------------

### Synopsis

---

### Description

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CredentialType**
Provider's type: DomainUser (AD), LocalUser (SSH), SqlServer.
Valid Values:

* Unknown
* Standalone
* LocalUser
* DomainUser
* DomainAdmin
* SqlServer
* Certificate
* WindowsLocalAccount
* AzureADUser
* MySqlUser
* OracleUser
* CiscoHost
* Custom

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[PamCredentialType]`|true    |named   |false        |

#### **Description**
Provider's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DomainName**
Domain's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
Provider's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Password**
Credentials - Password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Port**
Port used for the communication. By default, the port 636 is used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Protocol**
Protocol used: LDAP or LDAPS. By default, LDAPS is used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Protocol]`|false   |named   |false        |

#### **ServerName**
Server's name / IP Address

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Username**
Credentials - Username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-DSPamProvider -detailed". For technical information, type "Get-Help New-DSPamProvider -full".

---

### Syntax
```PowerShell
New-DSPamProvider -Name <String> -CredentialType <DomainUser> [-DomainName <String>] [-Port <Int32>] [-Protocol <LDAP | LDAPS>] [-Username <String>] [-Password <String>] [-Description <String>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamProvider -Name <String> -CredentialType <LocalUser> [-Host <String>] [-Port <Int32>] [-Username <String>] [-Password <String>] [-Description <String>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSPamProvider -Name <String> -CredentialType <SqlServer> [-ServerName <String>] [-Username <String>] [-Password <String>] [-Description <String>] [-AsLegacyResponse] [<CommonParameters>]
```
