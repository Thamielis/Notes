Set-NcUser
----------

### Synopsis
Modify the role associated with a user account object.

---

### Description

Modify the role associated with a user account object.

---

### Related Links
* [New-NcUser](New-NcUser)

* [Get-NcUser](Get-NcUser)

* [Remove-NcUser](Remove-NcUser)

---

### Examples
> Example 1

Set-NcUser vmware_admin -Vserver costea01 -Application ontapi -AuthMethod password -Role vsadmin
Change role of user 'vmware_admin' to 'vsadmin'.

UserName     Application AuthMethod RoleName IsLocked Vserver
--------     ----------- ---------- -------- -------- -------
vmware_admin ontapi      password   vsadmin   False   costea01

---

### Parameters
#### **UserName**
Name of the user to be modified.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Vserver**
Vserver that owns the user account.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **Application**
Name of the application.  Possible values: 'console', 'http', 'ontapi', 'snmp', 'sp', 'ssh'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **AuthMethod**
Authentication method for the application.  Possible values: 'community', 'password', 'publickey', 'domain', 'nsswitch' and 'usm'.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |named   |true (ByPropertyName)|AuthenticationMethod|

#### **Role**
Name of the role.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|RoleName|

#### **Comment**
Comments for the user account.  Available in ONTAP 8.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsNsSwitchGroup**
Specifies whether the added group is ns-switch group or not.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RemoteSwitchIpaddress**
This optionally specifies the IP Address of the remote switch.
This parameter is available in ONTAP 9.3 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SecondAuthenticationMethod**
Second authentication method for ssh application. Possible values: 'none', 'password' and 'publickey'.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LdapFastbind**
Optional property that specifies the mode of authentication is LDAP Fastbind. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **PublicKey**
Public key for SSH. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SslCaCertificate**
SSL certificate for the chain of certificate authorities (CA) that have signed this user's client certificate. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PasswordHashAlgorithm**
Optional property that specifies the password hash algorithm used to generate a hash of the user's password for password matching. Possible values: sha512, sha256 and md5. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Locked**
Locked status of the account. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AddApplication**
Used to add new application object for user. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveApplication**
Used to remove existing application object from user. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.Security.SecurityLoginAccountInfo

---

### Notes
Category: security
API: security-login-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcUser [-UserName] <String> -Vserver <String[]> -Application <String[]> -AuthMethod <String> -Role <String> [-Comment <String>] [-IsNsSwitchGroup <Boolean>] [-RemoteSwitchIpaddress 
```
```PowerShell
<String>] [-SecondAuthenticationMethod <String>] [-LdapFastbind <Boolean>] [-PublicKey <String>] [-SslCaCertificate <String>] [-PasswordHashAlgorithm <String>] [-Locked <Boolean>] 
```
```PowerShell
[-AddApplication <SwitchParameter>] [-RemoveApplication <SwitchParameter>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
