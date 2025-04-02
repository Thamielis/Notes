Set-NcLdapConfig
----------------

### Synopsis
Modify the Lightweight Directory Access Protocol (LDAP) configuration for a Vserver.

---

### Description

Modify the Lightweight Directory Access Protocol (LDAP) configuration for a Vserver.

---

### Related Links
* [Get-NcLdapConfig](Get-NcLdapConfig)

* [New-NcLdapConfig](New-NcLdapConfig)

* [Remove-NcLdapConfig](Remove-NcLdapConfig)

---

### Examples
> Example 1

Set-NcLdapConfig -VserverContext lemon -ClientEnabled $false
Disable the LDAP client configuration for Vserver lemon.

ClientConfig                                  ClientEnabled
------------                                  -------------
ldap_client                                           False

---

### Parameters
#### **ClientConfig**
The name of an existing Lightweight Directory Access Protocol (LDAP) client configuration.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **ClientEnabled**
If true, the corresponding Lightweight Directory Access Protocol (LDAP) configuration is enabled for this Vserver.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |2       |true (ByPropertyName)|

#### **SkipConfigValidation**
Specify in order to Skip validation of the the corresponding Lightweight Directory Access Protocol (LDAP) client configuration

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Ldap.LdapConfig

---

### Notes
Category: ldap
API: ldap-config-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcLdapConfig [[-ClientConfig] <String>] [[-ClientEnabled] <Boolean>] [-SkipConfigValidation] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
