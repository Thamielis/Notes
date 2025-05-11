Confirm-Person
--------------

### Synopsis
Confirms that the person actually exists

---

### Description

Confirms that a person actually exists and modifies users records.

---

### Related Links
* [Get-Person](Get-Person)

---

### Examples
Confirm-Person is automatically called within a web site in the following manner

```PowerShell
Confirm-Person -WebsiteUrl 'http://MyPipeworksSite.com/'
```

---

### Parameters
#### **FacebookAccessToken**
Confirms that a facebook access token allows access to facebook

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveIDAccessToken**
Confirms that a live ID user exists by an access token.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveConnectCode**
The Live Connect code.  Used when confirming that a live ID user exists by an OAuth code, appID, and redirectURL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveConnectSecretSetting**
The Live Connect secret setting.  Used when confirming that a live ID user exists by an OAuth code, appID, and redirectURL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveConnectRedirectUrl**
The Live Connect redirect URL.  Used when confirming that a live ID user exists by code, clientID, and redirectURL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **LiveConnectAppID**
The Live Connect ClientID.  Used when confirming that a live ID user exists by code, clientID, and redirectURL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **FacebookAppId**
The FaceBook app ID

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **UserTable**
The user table where the account record is stored

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ConnectionSetting**
The ConnectionSetting.  This is used to handle the connection string for a User Database

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |named   |true (ByPropertyName)|ConnectionString|

#### **UserPartition**
The user partition where the account record is stored

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LockoutBalance**
The lockout balance (the point at which users can no longer log in)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|

#### **InitialBalance**
The initial balance attached to a user account when it is created

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|

#### **StorageAccountSetting**
The Azure storage key setting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **StorageKeySetting**
The Azure storage key setting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Email**
The email with changes to the account

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **PhoneNumber**
The phone number used to confirm the account

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ApiKey**
The ApiKey used to confirm the account

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ConfirmByEmail**
If set, will confirms the api key via email (if not already done on this machine)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|

#### **SmtpServer**
The email server used to send the confirmation mails

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **FromEmail**
The email address used to send confirmation mails (in a pure email based user system)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SmtpEmailSetting**
The setting containing the SMTP email used to send confirmation mails (in a pure email based user system)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SmtpPasswordSetting**
The setting containing the SMTP password used to send confirmation mails (in a pure email based user system)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsMobilePhone**
If set, the number will be treated as a mobile phone, and confirmation will occur via Text

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **PersonObject**
The Person Object

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **WebsiteUrl**
The URL for the website

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **IfLoggedInAs**
Determines if the user is logged in as a fixed set of options.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ValidUserPartition**
A partition in table storage that contains user groupings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CheckId**
If set, will validate that they are a specific user, not just a user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Confirm-Person -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -FacebookAccessToken <String> -FacebookAppId <String> -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -LiveIDAccessToken <String> -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -LiveConnectCode <String> -LiveConnectSecretSetting <String> -LiveConnectRedirectUrl <String> -LiveConnectAppID <String> -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -UserTable <String> -ConnectionSetting <String> -Email <String> [-PersonObject <PSObject>] -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -UserTable <String> -ConnectionSetting <String> [-LockoutBalance <Double>] [-InitialBalance <Double>] -ApiKey <String> -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -UserTable <String> [-UserPartition <String>] [-LockoutBalance <Double>] [-InitialBalance <Double>] [-StorageAccountSetting <String>] -ApiKey <String> -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -UserTable <String> [-UserPartition <String>] [-LockoutBalance <Double>] [-InitialBalance <Double>] -StorageAccountSetting <String> -StorageKeySetting <String> -Email <String> [-PersonObject <PSObject>] -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -UserTable <String> [-UserPartition <String>] [-LockoutBalance <Double>] -StorageAccountSetting <String> -StorageKeySetting <String> -PhoneNumber <String> [-IsMobilePhone] [-PersonObject <PSObject>] -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -ApiKey <String> -ConfirmByEmail -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -ApiKey <String> -ConfirmByEmail -SmtpServer <String> [-FromEmail <String>] [-SmtpEmailSetting <String>] [-SmtpPasswordSetting <String>] -WebsiteUrl <String> [<CommonParameters>]
```
```PowerShell
Confirm-Person -WebsiteUrl <String> [-IfLoggedInAs <String[]>] [-ValidUserPartition <String>] -CheckId [<CommonParameters>]
```
