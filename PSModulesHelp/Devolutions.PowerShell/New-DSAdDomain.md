New-DSAdDomain
--------------

### Synopsis
Add a domain.

---

### Description

Add a domain with the supplied parameters. The Platinum Edition license is required to enable the Multi Domain feature. The administration account supplied needs to be able to retrieve user account information and group memberships. It may requires higher privileges than being part of the Domain Users built-in Active Directory group. In most case, it should be sufficient.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-DSAdDomain -DomainName domain.loc -DisplayName Dom -AdministrationUsername admin -AdministrationPassword "Pa$$w0rd!" -IsLDAPS -LDAPSCustomPort 1500 -AutoCreateEnabled -DomainUsernameFormatType NetBios -DomainUserReadOnly
Create a new domain with the supplied parameters.
```

---

### Parameters
#### **AdministrationPassword**
Password part of the credentials of a domain or service account to access the Active Directory forest and obtain user account information through LDAP queries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AdministrationUsername**
Username part of the credentials of a domain or service account to access the Active Directory forest and obtain user account information through LDAP queries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoCreateEnabled**
Automatically create the domain user account in the Devolutions Server on the first login attempt.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DefaultVault**
Name of the vault the user will have access to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DisplayName**
Domain name that will be displayed in the application usage like informational messages.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **DomainName**
Remote computer domain name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **DomainUsernameFormatType**
Select the username format that will be created in the database. UPN : The user will be created using the UPN format ex: bill@windjammer.loc. NetBios : The user will be created using the NetBios format ex: WINDJAMMER\bill. Username : The user will be created using the SAM account name.
Valid Values:

* UPN
* NetBios
* Username

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[DomainUsernameFormatType]`|false   |named   |false        |

#### **DomainUserReadOnly**
Set Read only user instead of User type account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsLDAPS**
Enable the LDAP over SSL communication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LDAPSCustomPort**
LDAPS communication port. If not specified, it will be the default one.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSAdDomain -detailed". For technical information, type "Get-Help New-DSAdDomain -full".

---

### Syntax
```PowerShell
New-DSAdDomain -DomainName <String> -DisplayName <String> -AdministrationUsername <String> -AdministrationPassword <String> [-IsLDAPS] [-LDAPSCustomPort <Int32>] [-AutoCreateEnabled] [-DomainUsernameFormatType <UPN | NetBios | Username>] [-DomainUserReadOnly] [-DefaultVault <String>] [-AsLegacyResponse] [<CommonParameters>]
```
