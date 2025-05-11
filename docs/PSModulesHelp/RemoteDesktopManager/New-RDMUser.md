New-RDMUser
-----------

### Synopsis
Create a new user instance.

---

### Description

Create a user instance. The instance has not yet been saved. Use the SetUser parameter or assign the result to a variable then call "Set-RDMUser $s" to save the user.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [Set-RDMUser](Set-RDMUser)

* [Set-RDMUserProperty](Set-RDMUserProperty)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $user = New-RDMUser -AuthenticationType SqlServer -Login 'PSTest' -Password (ConvertTo-SecureString -String 'password' -AsPlainText -Force) -SetUser
Create & save new user.
```
> EXAMPLE 2

```PowerShell
PS C:\> $user = New-RDMUser -Login 'domain\username' -IntegratedSecurity -SkipCreateSQLServerLogin; $user.UserType = 'User'; Set-RDMUser $user
Before everything, the administrator add the login/user to the database. Create the user domain\username with integrated security. The SkipCreateSQLServerLogin switch indicates the administrator will manually add the information in the database. Change the user type from read-only to user and save the user.
```

---

### Parameters
#### **Administrator**
Gives the user administrator rights

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **AuthenticationType**
Authentication type. Available in some data sources

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **AuthentificationType**
Authentification type. Available in some data sources (Backward compatibility)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BypassAzureADValidationEvenIfUnsupported**
Bypass validation preventing creation of AzureAD user when connected with a database user. Do so at your own risk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Disable**
Disables the user. Available in some data sources

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Email**
User email. Available when using a all data source except DODB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **IntegratedSecurity**
Integrated security. Only available in SQL Server and DVLS data sources

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Login**
Login.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **LoginEmail**
Login email. Available in some data sources

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Password**
User password. Available when using a SQL Server data source and integrated security is not used

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |1       |false        |

#### **SetUser**
Set the user in the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **SkipCreateSQLServerLogin**
Skip to create the SQL Server login. The administrator will add the database login/user manually. Available in SQL Server data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo

---

### Notes
For more information, type "Get-Help New-RDMUser -detailed". For technical information, type "Get-Help New-RDMUser -full".

---

### Syntax
```PowerShell
New-RDMUser [[-IntegratedSecurity] <SwitchParameter>] [[-Login] <String>] [[-Administrator]] [[-Email] <String>] [[-Disable]] [[-LoginEmail] <String>] [[-SkipCreateSQLServerLogin] <SwitchParameter>] [[-AuthentificationType] <String>] [[-AuthenticationType] <String>] [[-BypassAzureADValidationEvenIfUnsupported]] [[-SetUser]] [<CommonParameters>]
```
```PowerShell
New-RDMUser [[-Password] <SecureString>] [[-Login] <String>] [[-Administrator]] [[-Email] <String>] [[-Disable]] [[-LoginEmail] <String>] [[-SkipCreateSQLServerLogin] <SwitchParameter>] [[-AuthentificationType] <String>] [[-AuthenticationType] <String>] [[-BypassAzureADValidationEvenIfUnsupported]] [[-SetUser]] [<CommonParameters>]
```
