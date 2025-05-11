Update-DSUser
-------------

### Synopsis
Update a user

---

### Description

Update a user with the supplied parameters.

---

### Related Links
* [Get-DSUser](Get-DSUser)

* [New-DSUser](New-DSUser)

* [Remove-DSUSer](Remove-DSUSer)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Update-DSUSer -UserId $uid -CustomRoles "d8f94f53-e073-48fd-85b7-d4bfb127bd2d"
Assign the role "d8f94f53-e073-48fd-85b7-d4bfb127bd2d" to the user whose id is $uid. All others previous roles are unassigned.
```

---

### Parameters
#### **Address**
Address of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowDragAndDrop**
True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CanExport**
True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanImport**
True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanViewGlobalLogs**
True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanViewInformations**
True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CellPhone**
Cell phone number to contact the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CompanyName**
Company name that employs the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CountryName**
Country of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CustomRoles**
Role ids the user will be assigned to.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Department**
Department in which the user is working.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Email**
Email of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Enabled**
Determine if the user is activated. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Fax**
Fax number to contact the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FirstName**
First name of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GravatarEmail**
Gravatar email to obtain the user's avatar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HasAccessCLI**
Allow the user to use to CLI (command line interface). True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HasAccessLauncher**
Allow the user can open remote connections with Devolutions Launcher. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HasAccessRDM**
Allow the user to access to Devolutions Server through RDM. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HasAccessWeb**
Allow the user to use Devolutions Server web interface. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HasAccessWebLogin**
Allow the user to auto fill username and passwords on websites with Devolutions Web Login. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **JobTitle**
Job title of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Language**
Language of the user's web interface. English by default.
Valid Values:

* English
* French
* German
* Spanish
* Hungarian
* Italian
* Dutch
* Polish (Poland)
* Russian
* Swedish
* Ukrainian
* Chinese (Simplified) Legacy
* Chinese (Traditional, Taiwan)
* Czech

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LastName**
Last name of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OfflineMode**
Offline mode. Read/Write by default.
Valid Values:

* Disabled
* Cache
* ReadOnly
* ReadWrite
* Unknown

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[OfflineMode]`|false   |named   |false        |

#### **Password**
Password of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Phone**
Phone number to contact the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **State**
State of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserID**
Id of the user to update.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **UserLicenceType**
Select the type of the license that the user has: Default: Connection Management. | Connection Management: for users who open remote connections. | Password Management: for users who only use Devolutions Server as a password manager.
Valid Values:

* Default
* ConnectionManagement
* PasswordManagement

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[UserLicenceTypeMode]`|false   |named   |false        |

#### **UserMustChangePasswordAtNextLogin**
Force the user to change the password next time they log on.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Username**
Ignored. User login name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserType**
User type defining his rights. User by default. Choices: Administrator: grant full administrative rights to the user. | Read only user: grant only the View access to the user. | Restricted user: select which rights to grant to the user. | User: grant all basic rights to the user (Add, Edit, Delete).
Valid Values:

* Admin
* User
* Restricted
* ReadOnly

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UserType]`|false   |named   |false        |

#### **Workphone**
Work phone number to contact the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSUser -detailed". For technical information, type "Get-Help Update-DSUser -full".

---

### Syntax
```PowerShell
Update-DSUser -UserID <Guid> [-CustomRoles <String[]>] [-UserType <Admin | User | Restricted | ReadOnly>] [-UserLicenceType <Default | ConnectionManagement | PasswordManagement>] [-Username <String>] [-Password <String>] [-FirstName <String>] [-LastName <String>] [-Email <String>] [-Language <English | French | German | Spanish | Hungarian | Italian | Dutch | Polish (Poland) | Russian | Swedish | Ukrainian | Chinese (Simplified) Legacy | Chinese (Traditional, Taiwan) | Czech>] [-Enabled <Boolean>] [-UserMustChangePasswordAtNextLogin <Boolean>] [-CompanyName <String>] [-JobTitle <String>] [-Department <String>] [-GravatarEmail <String>] [-Address <String>] [-State <String>] [-CountryName <String>] [-Phone <String>] [-Workphone <String>] [-CellPhone <String>] [-Fax <String>] [-HasAccessRDM <Boolean>] [-HasAccessWebLogin <Boolean>] [-HasAccessLauncher <Boolean>] [-HasAccessWeb <Boolean>] [-HasAccessCLI <Boolean>] [-AllowDragAndDrop <Boolean>] [-CanViewInformations <Boolean>] [-CanViewGlobalLogs <Boolean>] [-CanImport <Boolean>] [-CanExport <Boolean>] [-OfflineMode <Disabled | ReadOnly | ReadWrite>] [-AsLegacyResponse] [<CommonParameters>]
```
