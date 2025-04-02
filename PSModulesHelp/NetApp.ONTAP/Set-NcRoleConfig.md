Set-NcRoleConfig
----------------

### Synopsis
Modify the specified attributes of role configuration object.

---

### Description

Modify the specified attributes of role configuration object.  Omitted (optional) fields will not be changed.

---

### Related Links
* [Get-NcRole](Get-NcRole)

* [Get-NcRoleConfig](Get-NcRoleConfig)

---

### Examples
> Example 1

```PowerShell
Set-NcRoleConfig -Vserver costea01 -Role vsadmin-volume -ChangePasswordDurationInDays 30
Change the password duration setting in the role configuration for role 'vsadmin-volume' in vserver 'costea01'.

RoleName                     : vsadmin-volume
Vserver                      : costea01
MinUsernameSize              : 3
RequireUsernameAlphaNumeric  : False
MinPasswordSize              : 8
RequirePasswordAlphaNumeric  : True
ChangePasswordDurationInDays : 30
LastPasswordsDisallowedCount : 6
NcController                 : VxeRubble

```

---

### Parameters
#### **Role**
Name of the role to modify.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|RoleName|

#### **Vserver**
Vserver that owns the role.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **MinUsernameSize**
The minimum length of the user name.  Possible values range from 3 to 16 characters.  The default setting is 3 characters.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinPasswordSize**
This optionally specifies the minimum length of the password.  Possible values range from 3 to 64 characters.  The default setting is 8 characters.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **LastPasswordsDisallowedCount**
This optionally specifies the number of previous passwords that are disallowed for reuse.  The default setting is 6.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ChangePasswordDurationInDays**
This optionally specifies the number of days that must pass between password changes.  The default setting is 0 (zero) meaning the user is not allowed to change the password ever.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **RequireUsernameAlphaNumeric**
This optionally specifies the username must be an alphanumeric value.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RequirePasswordAlphaNumeric**
This optionally specifies the password must be an alphanumeric value.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MinPasswordSpecialCharacter**
The minimum number of special characters required in the password.  Available in ONTAP 8.2 and later.

|Type     |Required|Position|PipelineInput        |Aliases             |
|---------|--------|--------|---------------------|--------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|MinPasswdSpecialchar|

#### **PasswordExpirationDuration**
The password expiry in days.  Available in ONTAP 8.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxFailedLoginAttempts**
The maximum number of invalid login attempts before the account gets locked.  Available in ONTAP 8.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **LockoutDurationDays**
The number of days to lock the account if maximum number of failed attempts occur.  Available in ONTAP 8.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **RequireInitialPasswordUpdate**
If true, require the user to change the password upon first-login to the storage controller from SSH or serial-console.  Available in ONTAP 8.2 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DelayAfterFailedLogin**
This specifies the delay after each failed login attempt in seconds. Default is 4 secs.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PasswdMinLowercaseChars**
This specifies the minimum number of lowercase alphabetic characters required in the password. The default setting is 0.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PasswdMinUppercaseChars**
This specifies the minimum number of uppercase alphabetic characters required in the password. The default setting is 0.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PasswdMinDigits**
This specifies the minimum number of digits required in the password. The default setting is 0.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PasswdExpiryWarnTime**
If configured, this specifies when the user starts receiving warning messages regarding upcoming password expiry. The default setting is 2^32-1.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AccountExpiryTime**
This specifies the expiration period of user accounts.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AccountInactiveLimit**
This specifies the maximum duration of inactivity of user accounts.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginRoleConfigInfo

---

### Notes
Category: security
API: security-login-role-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcRoleConfig [-Role] <String> -Vserver <String[]> [-MinUsernameSize <Int32>] [-MinPasswordSize <Int32>] [-LastPasswordsDisallowedCount <Int32>] [-ChangePasswordDurationInDays <Int32>] 
```
```PowerShell
[-RequireUsernameAlphaNumeric <Boolean>] [-RequirePasswordAlphaNumeric <Boolean>] [-MinPasswordSpecialCharacter <Int32>] [-PasswordExpirationDuration <Int32>] [-MaxFailedLoginAttempts 
```
```PowerShell
<Int32>] [-LockoutDurationDays <Int32>] [-RequireInitialPasswordUpdate <Boolean>] [-DelayAfterFailedLogin <Int32>] [-PasswdMinLowercaseChars <Int32>] [-PasswdMinUppercaseChars <Int32>] 
```
```PowerShell
[-PasswdMinDigits <Int32>] [-PasswdExpiryWarnTime <String>] [-AccountExpiryTime <String>] [-AccountInactiveLimit <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
