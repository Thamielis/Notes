Get-Email
---------

### Synopsis
Gets email from exchange

---

### Description

Gets email from an exchange server

---

### Related Links
* [Invoke-Office365](Invoke-Office365)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Email
```

---

### Parameters
#### **Account**
The account

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |false        |

#### **UserNameSetting**
The setting containing the username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PasswordSetting**
The setting containing the password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Email**
The email account to connect to retreive data from.  If not specified, email will be retreived for the account used to connect.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Unread**
If set, will only return unread messages

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **To**
The name of the contact the email was sent to.  This the displayed name, not a full email address

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **From**
The email that sent the message

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Download**
If set, will download the email content, not just the headers

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-Email [-UserNameSetting <String>] [-PasswordSetting <String>] [-Email <String>] [-Unread] [-To <String>] [-From <String>] [-Download] [<CommonParameters>]
```
```PowerShell
Get-Email -Account <PSCredential> [-Email <String>] [-Unread] [-To <String>] [-From <String>] [-Download] [<CommonParameters>]
```
