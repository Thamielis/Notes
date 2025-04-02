Set-NcCifsSecurity
------------------

### Synopsis
Set CIFS security tunable parameters.

---

### Description

Set CIFS security tunable parameters.

---

### Related Links
* [Get-NcCifsSecurity](Get-NcCifsSecurity)

---

### Examples
> Example 1

Set-NcCifsSecurity -ClockSkew 5 -RenewAge 7 -TicketAge 10
Set CIFS security settings.

KerberosClockSkew          KerberosRenewAge         KerberosTicketAge
-----------------          ----------------         -----------------
                5                        7                         10

---

### Parameters
#### **ClockSkew**
The clock skew in minutes is the tolerance for accepting tickets with time stamps that do not exactly match the host's system clock. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|KerberosClockSkew|

#### **TicketAge**
This option determines the maximum amount of time in hours that a user's ticket may be used for the purpose of Kerberos authentication. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|KerberosTicketAge|

#### **RenewAge**
This option determines the maximum amount of time in days for which a ticket can be renewed. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |Aliases         |
|---------|--------|--------|---------------------|----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|KerberosRenewAge|

#### **IsSigningRequired**
If true, signing is required for incoming CIFS traffic.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsPasswordComplexityRequired**
If true, password complexity is required for local users. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **UseStartTlsForAdLdap**
If true, use start-tls for AD LDAP connections. By default this option is false. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsAesEncryptionEnabled**
Determines whether AES-128 and AES-256 encryption mechanisms are enabled for Kerberos-related CIFS communication.  The default value is true.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **LmCompatibilityLevel**
This option determines the LM compatibility level. By default this option is 'LM, NTLM, NTLMv2 and Kerberos'.
Possible values: 
'lm_ntlm_ntlmv2_krb'  - Accepts LM, NTLM, NTLMv2 and Kerberos,
'ntlm_ntlmv2_krb'     - Accepts NTLM, NTLMv2 and Kerberos,
'ntlmv2_krb'          - Accepts NTLMv2 and Kerberos,
'krb'                 - Accepts Kerberos only

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AdminCredential**
Credential of the account with administrative privilege for the Active Directory domain to which the CIFS server is joined. This part of the credential may need to be supplied if the AES encryption is being enabled or disabled.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **IsSmbEncryptionRequired**
Determines whether SMB encryption is required for incoming CIFS traffic. The default value is false.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **KerberosKdcTimeout**
Timeout value for KDC connections. Example: 5m (5 minutes), 20s (20 seconds), 1h (1 hour)
This parameter is not available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SessionSecurityForAdLdap**
This option determines the level of security required for LDAP communications. By default this option is none. Possible values: "none" - No Signing or Sealing., "sign" - Sign LDAP traffic., "seal" - Seal and Sign LDAP traffic. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Smb1EnabledForDcConnections**
This option determines if SMB version 1 is used for connections to domain controllers. Possible values: "false", "true", "system_default".
This parameter is available in ONTAP 9.1 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Smb2EnabledForDcConnections**
This option determines if SMB version 2 is used for connections to domain controllers. Possible values: "false", "true", "system_default".
This parameter is available in ONTAP 9.1 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReferralEnabledForAdLdap**
This option determines whether LDAP referral chasing is enabled or not for AD LDAP connections. By default this option is false.
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **UseLdapsForAdLdap**
This option determines whether to use LDAPS for Secure Active Directory LDAP connections. By default this option is false. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **KdcEncryption**
Specifies whether AES-128 and AES-256 encryption is enabled for all Kerberos-based communication with the Active Directory KDC.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **LdapReferralEnabled**
Specifies whether or not LDAP referral chasing is enabled for AD LDAP connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SessionSecurity**
Specifies client session security for AD LDAP connections.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SmbEncryption**
Specifies whether encryption is required for incoming CIFS traffic.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SmbSigning**
Specifies whether signing is required for incoming CIFS traffic.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UseLdaps**
Specifies whether or not to use use LDAPS for secure Active Directory LDAP connections by using the TLS/SSL protocols.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UseStartTls**
Specifies whether or not to use SSL/TLS for allowing secure LDAP communication with Active Directory LDAP servers.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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

#### **AesEnabledForNetlogonChannel**
This parameter determines whether to use AES session key as part of NetLogon secure channel establishment. By default this option is false.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **TryChannelBindingForAdLdap**
This parameter determines whether to try channel binding for AD LDAP connections. By default this option is true.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSecurity

---

### Notes
Category: cifs
API: cifs-security-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsSecurity [-ClockSkew <Int32>] [-TicketAge <Int32>] [-RenewAge <Int32>] [-IsSigningRequired <Boolean>] [-IsPasswordComplexityRequired <Boolean>] [-UseStartTlsForAdLdap <Boolean>] 
```
```PowerShell
[-IsAesEncryptionEnabled <Boolean>] [-LmCompatibilityLevel <String>] [-AdminCredential <PSCredential>] [-IsSmbEncryptionRequired <Boolean>] [-KerberosKdcTimeout <String>] 
```
```PowerShell
[-SessionSecurityForAdLdap <String>] [-Smb1EnabledForDcConnections <String>] [-Smb2EnabledForDcConnections <String>] [-ReferralEnabledForAdLdap <Boolean>] [-UseLdapsForAdLdap <Boolean>] 
```
```PowerShell
[-VserverContext <String>] [-KdcEncryption <Boolean>] [-LdapReferralEnabled <Boolean>] [-SessionSecurity <String>] [-SmbEncryption <Boolean>] [-SmbSigning <Boolean>] [-UseLdaps <Boolean>] 
```
```PowerShell
[-UseStartTls <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[-AesEnabledForNetlogonChannel <Boolean>] [-TryChannelBindingForAdLdap <Boolean>] [<CommonParameters>]
```
