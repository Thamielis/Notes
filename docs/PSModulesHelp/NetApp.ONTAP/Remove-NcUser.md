Remove-NcUser
-------------

### Synopsis
Delete an existing user account object.

---

### Description

Delete an existing user account object.

---

### Related Links
* [Get-NcUser](Get-NcUser)

* [New-NcUser](New-NcUser)

* [Set-NcUser](Set-NcUser)

---

### Examples
> Example 1

```PowerShell
Get-NcUser vmware_admin | Remove-NcUser
Remove all instances of user 'vmware_admin', regardless of vserver, application type, or authentication method.
```

---

### Parameters
#### **UserName**
Name of the user to be removed.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Vserver**
Vserver that owns the user account.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **Application**
Name of the application.  Possible values: 'console', 'http', 'ontapi', 'snmp', 'sp', 'ssh'. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **AuthMethod**
Authentication method for the application.  Possible values: 'community', 'password', 'publickey', 'domain', 'nsswitch' and 'usm'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |named   |true (ByPropertyName)|AuthenticationMethod|

#### **RemoteSwitchIpaddress**
This optionally specifies the IP Address of the remote switch.
This parameter is available in ONTAP 9.3 and later. This parameter is supported with Ontapi only.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security
API: security-login-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcUser [-UserName] <String> -Vserver <String[]> -Application <String[]> -AuthMethod <String> [-RemoteSwitchIpaddress <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
