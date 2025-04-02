Set-NcSecuritySsh
-----------------

### Synopsis
Set SSH configuration options.

---

### Description

Set SSH configuration options.

---

### Related Links
* [Get-NcSecuritySsh](Get-NcSecuritySsh)

---

### Examples
> Example 1

Set-NcSecuritySsh -RemoveKeyExchangeAlgorithm diffie_hellman_group1_sha1 -RemoveCipher 3des_cbc -VserverContext beam_vsim01 -verbose
Remove the given key exchange algorithm and cipher from the SSH security settings.

Ciphers                       KeyExchangeAlgorithms         NcController                  VserverName
-------                       ---------------------         ------------                  -----------
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   beam_vsim01

> Example 2

Set-NcSecuritySsh -AddKeyExchangeAlgorithm diffie_hellman_group1_sha1 -AddCipher 3des_cbc -VserverContext beam_vsim01 -verbose
Add the given key exchange algorithm and cipher to the SSH security settings.

Ciphers                       KeyExchangeAlgorithms         NcController                  VserverName
-------                       ---------------------         ------------                  -----------
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   beam_vsim01

---

### Parameters
#### **KeyExchangeAlgorithm**
List of SSH key exchange algorithms enabled.
Possible values: diffie_hellman_group_exchange_sha256, diffie_hellman_group_exchange_sha1, diffie_hellman_group14_sha1, diffie_hellman_group1_sha1

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Cipher**
List of SSH Ciphers enabled.
 Possible values: aes256_ctr, aes192_ctr, aes128_ctr, aes256_cbc, aes192_cbc, aes128_cbc, 3des_cbc

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **MacAlgorithms**
List of SSH MAC Algorithms to reset. Valid values are hmac_md5, hmac_md5_96, hmac_md5_etm, hmac_md5_96_etm,hmac_ripemd160, hmac_ripemd160_etm, hmac_sha1, hmac_sha1_etm, hmac_sha1_96, hmac_sha1_96_etm, hmac_sha2_256, hmac_sha2_256_etm, hmac_sha2_512, hmac_sha2_512_etm, umac_64, umac_128, umac_64_etm, umac_128_et

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **MaxAuthenticationRetryCount**
Maximum Authentication Retry Count.
This parameter is available in ONTAP 9.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **AdministrativeSvm**
This parameter is supported with Rest only.

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

#### **AddKeyExchangeAlgorithm**
List of SSH Key Exchange Algorithms to add.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **AddCipher**
List of SSH Ciphers to add.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **AddMacAlgorithms**
List of SSH MAC Algorithms to add. Valid values are hmac_md5, hmac_md5_96, hmac_md5_etm, hmac_md5_96_etm,hmac_ripemd160, hmac_ripemd160_etm, hmac_sha1, hmac_sha1_etm, hmac_sha1_96, hmac_sha1_96_etm, hmac_sha2_256, hmac_sha2_256_etm, hmac_sha2_512, hmac_sha2_512_etm, umac_64, umac_128, umac_64_etm, umac_128_et

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **RemoveKeyExchangeAlgorithm**
List of SSH Key Exchange Algorithms to remove.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **RemoveCipher**
List of SSH Ciphers to remove.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **RemoveMacAlgorithms**
List of SSH MAC Algorithms to remove. Valid values are hmac_md5, hmac_md5_96, hmac_md5_etm, hmac_md5_96_etm,hmac_ripemd160, hmac_ripemd160_etm, hmac_sha1, hmac_sha1_etm, hmac_sha1_96, hmac_sha1_96_etm, hmac_sha2_256, hmac_sha2_256_etm, hmac_sha2_512, hmac_sha2_512_etm, umac_64, umac_128, umac_64_etm, umac_128_et

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecuritySshInfo

---

### Notes
Category: security
API: security-ssh-reset,security-ssh-add,security-ssh-remove
Family: vserver

---

### Syntax
```PowerShell
Set-NcSecuritySsh [-KeyExchangeAlgorithm <String[]>] [-Cipher <String[]>] [-MacAlgorithms <String[]>] [-MaxAuthenticationRetryCount <Int32>] [-VserverContext <String>] [-AdministrativeSvm 
```
```PowerShell
<SwitchParameter>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcSecuritySsh [-AddKeyExchangeAlgorithm <String[]>] [-AddCipher <String[]>] [-AddMacAlgorithms <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSecuritySsh [-RemoveKeyExchangeAlgorithm <String[]>] [-RemoveCipher <String[]>] [-RemoveMacAlgorithms <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
