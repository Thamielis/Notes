New-NcUser
----------

### Synopsis
Create a new user account associated with the specified application and authentication method.

---

### Description

Create a new user account associated with the specified application and authentication method.

---

### Related Links
* [Get-NcUser](Get-NcUser)

* [Remove-NcUser](Remove-NcUser)

* [Set-NcUser](Set-NcUser)

---

### Examples
> Example 1

New-NcUser vmware_admin -Vserver costea01 -Application ontapi -Role kamino -Password Netapp123
Create a new user 'vmware_admin'.

UserName     Application AuthMethod RoleName IsLocked Vserver
--------     ----------- ---------- -------- -------- -------
vmware_admin ontapi      password   kamino    False   costea01

---

### Parameters
#### **UserName**
Name of the user.  When creating a SNMPv1 or SNMPv2 user with 'snmp' application and 'community' authentication-method, the user name is the community string. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Vserver**
Name of the Vserver. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **Application**
Name of the application.  Possible values: 'console', 'http', 'ontapi', 'snmp', 'service-processor', 'ssh'. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **AuthMethod**
Authentication method for the application.  Possible values: 'community', 'password', 'publickey', 'domain', 'nsswitch' and 'usm'.
Not all authentication methods are valid for an application.  Valid authentication methods for each application are:
'password' for 'console' application.
'password', 'domain', 'nsswitch' for 'http' application.
'password', 'domain', 'nsswitch' for 'ontapi' application.
'community' for 'snmp' application (when creating SNMPv1 and SNMPv2 users).
'usm' and 'community' for 'snmp' application (when creating SNMPv3 users).
'password' for 'sp' application.
'password', 'publickey', 'domain', 'nsswitch' for 'ssh' application.
This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |named   |true (ByPropertyName)|AuthenticationMethod|

#### **Role**
Name of the role. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|RoleName|

#### **Password**
Password for the user account.  This is ignored for creating snmp users.  This is required for creating non-snmp users.This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Comment**
Comments for the user account.  Available in ONTAP 8.2 and later. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsPasswordHashed**
This specifies whether password entered by user is pre-hashed
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
This parameter is available in ONTAP 9.3 and later. This parameter is supported with Rest only.

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

#### **Credential**
A PSCredential object that may be used to specify the UserName and Password values.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginAccountInfo

---

### Notes
Category: security
API: security-login-create
Family: cluster

---

### Syntax
```PowerShell
New-NcUser [-UserName] <String> -Vserver <String[]> -Application <String[]> -AuthMethod <String> [-Role <String>] [-Password <String>] [-Comment <String>] [-IsPasswordHashed <Boolean>] 
```
```PowerShell
[-IsNsSwitchGroup <Boolean>] [-RemoteSwitchIpaddress <String>] [-SecondAuthenticationMethod <String>] [-LdapFastbind <Boolean>] [-PublicKey <String>] [-SslCaCertificate <String>] 
```
```PowerShell
[-PasswordHashAlgorithm <String>] [-Locked <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcUser -Vserver <String[]> -Application <String[]> -AuthMethod <String> [-Role <String>] [-Credential <PSCredential>] [-Comment <String>] [-IsPasswordHashed <Boolean>] [-IsNsSwitchGroup 
```
```PowerShell
<Boolean>] [-RemoteSwitchIpaddress <String>] [-SecondAuthenticationMethod <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
