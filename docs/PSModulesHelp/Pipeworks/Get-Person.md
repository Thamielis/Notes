Get-Person
----------

### Synopsis
Gets information about a person

---

### Description

Gets account information about a person.

Get-Person contains the common tools to get user information from users on:
    - Active Directory
    - Azure Tables 
    - Facebook
    - Local Directory

---

### Related Links
* [Confirm-Person](Confirm-Person)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Person -UserTable SuppliUsUsers -Name "James Brundage" -UserPartition Users
```
> EXAMPLE 2

```PowerShell
Get-Person -Local "James Brundage"
```

---

### Parameters
#### **Alias**
The account alias or UserID

|Type      |Required|Position|PipelineInput        |Aliases                                   |
|----------|--------|--------|---------------------|------------------------------------------|
|`[String]`|true    |named   |true (ByPropertyName)|MailNickname<br/>UserID<br/>SamAccountName|

#### **Property**
If provided, will get a list of properties from the user

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IsLocalAccount**
If set, will look for local accounts

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
The account name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Domain**
The name of the domain.  If provided, then Active Directory will not be queried for a list of domains.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserTable**
The table in Azure that stores user information.  If provided, will search for accounts in Azure

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserPartition**
The parition within a table in Azure that should have user information.  Defaults to "Users"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageAccount**
The storage account.  If not provided, the StorageAccountSetting will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKey**
The storage key.  If not provided, the StorageKeySetting will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageAccountSetting**
The storage account setting.  This setting will be found with either Get-SecureSetting or Get-WebConfigurationSetting. Defaults to AzureStorageAccountName.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKeySetting**
The storage key setting.  This setting will be found with either Get-SecureSetting or Get-WebConfigurationSetting.  Defaults to AzureStorageAccountKey

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FacebookAccessToken**
A facebook access token

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveIDAccessToken**
A Live ID Access Token

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **FacebookUserID**
A facebook user ID

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|ID     |

---

### Outputs
* http://schema.org/Person

---

### Syntax
```PowerShell
Get-Person -Alias <String> [-Property <String[]>] [-IsLocalAccount] [-Domain <String>] [-UserTable <String>] [-UserPartition <String>] [-StorageAccount <String>] [-StorageKey <String>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [<CommonParameters>]
```
```PowerShell
Get-Person [-Property <String[]>] [-IsLocalAccount] -Name <String> [-Domain <String>] [-UserTable <String>] [-UserPartition <String>] [-StorageAccount <String>] [-StorageKey <String>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [<CommonParameters>]
```
```PowerShell
Get-Person [-Property <String[]>] [-IsLocalAccount] [-Domain <String>] [-UserTable <String>] [-UserPartition <String>] [-StorageAccount <String>] [-StorageKey <String>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] -FacebookAccessToken <String> [-FacebookUserID <String>] [<CommonParameters>]
```
```PowerShell
Get-Person [-Property <String[]>] [-IsLocalAccount] [-Domain <String>] [-UserTable <String>] [-UserPartition <String>] [-StorageAccount <String>] [-StorageKey <String>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] -LiveIDAccessToken <String> [<CommonParameters>]
```
