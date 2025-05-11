Get-ADReplBackupKey
-------------------

### Synopsis
Reads the DPAPI backup keys from a domain controller through the MS-DRSR protocol.

---

### Description

Replicates the Data Protection API (DPAPI) backup keys from an Active Directory domain controller through the MS-DRSR protocol. The output can be saved to the file system using the Save-DPAPIBlob cmdlet.

DPAPI is used by several components of Windows to securely store passwords, encryption keys and other sensitive data. When DPAPI is used in an Active Directory domain environment, a copy of user's master key is encrypted with a so-called DPAPI Domain Backup Key that is known to all domain controllers. Windows Server 2000 DCs use a symmetric key and newer systems use a public/private key pair. If the user password is reset and the original master key is rendered inaccessible to the user, the user's access to the master key is automatically restored using the backup key.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-ADReplBackupKey.md)

* [Save-DPAPIBlob](Save-DPAPIBlob)

* [Get-ADDBBackupKey](Get-ADDBBackupKey)

* [Get-LsaBackupKey](Get-LsaBackupKey)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-ADReplBackupKey -Server 'lon-dc1.contoso.com'
<# Sample Output:

FilePath          : ntds_legacy_b116cbfa-b881-43e6-ba85-ef3efa64ba22.key
KiwiCommand       : 
Type              : LegacyKey
DistinguishedName : CN=BCKUPKEY_b116cbfa-b881-43e6-ba85-ef3efa64ba22 
                    Secret,CN=System,DC=contoso,DC=com
KeyId             : b116cbfa-b881-43e6-ba85-ef3efa64ba22
Data              : {1, 0, 0, 0...}

FilePath          : 
KiwiCommand       : 
Type              : PreferredLegacyKeyPointer
DistinguishedName : CN=BCKUPKEY_P Secret,CN=System,DC=contoso,DC=com
KeyId             : b116cbfa-b881-43e6-ba85-ef3efa64ba22
Data              : {250, 203, 22, 177...}

FilePath          : ntds_capi_290914ed-b1a8-482e-a89f-7caa217bf3c3.pvk
KiwiCommand       : REM Add this parameter to at least the first dpapi::masterkey 
                    command: /pvk:"ntds_capi_290914ed-b1a8-482e-a89f-7caa217bf3c3.pvk"
Type              : RSAKey
DistinguishedName : CN=BCKUPKEY_290914ed-b1a8-482e-a89f-7caa217bf3c3 
                    Secret,CN=System,DC=contoso,DC=com
KeyId             : 290914ed-b1a8-482e-a89f-7caa217bf3c3
Data              : {2, 0, 0, 0...}

FilePath          : 
KiwiCommand       : 
Type              : PreferredRSAKeyPointer
DistinguishedName : CN=BCKUPKEY_PREFERRED Secret,CN=System,DC=contoso,DC=com
KeyId             : 290914ed-b1a8-482e-a89f-7caa217bf3c3
Data              : {237, 20, 9, 41...}
#>
Replicates all DPAPI backup keys from the target Active Directory domain controller.
```
> Example 2

```PowerShell
PS C:\> Get-ADReplBackupKey -Server 'lon-dc1.adatum.com' | Save-DPAPIBlob -DirectoryPath '.\Output'
PS C:\> Get-ChildItem -Path '.\Output' | Select-Object -ExpandProperty Name
<# Sample Output:
kiwiscript.txt
ntds_legacy_b116cbfa-b881-43e6-ba85-ef3efa64ba22.key
ntds_capi_4cee80c0-b6c6-406c-a68b-c0e5818bc436.cer
ntds_capi_290914ed-b1a8-482e-a89f-7caa217bf3c3.pfx
ntds_capi_290914ed-b1a8-482e-a89f-7caa217bf3c3.pvk
#>
Replicates all DPAPI backup keys from the target Active Directory domain controller and saves them to the Output directory.
```

---

### Parameters
#### **Credential**
Specifies a user account that has permission to perform this action. The default is the current user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **Domain**
Specifies the DNS name of the target Active Directory domain.

|Type      |Required|Position|PipelineInput|Aliases                              |
|----------|--------|--------|-------------|-------------------------------------|
|`[String]`|false   |named   |False        |FQDN<br/>DomainName<br/>DNSDomainName|

#### **Protocol**
Specifies the protocol sequence that is used for RPC communication.
Valid Values:

* TCP
* SMB
* HTTP

|Type           |Required|Position|PipelineInput|Aliases                        |
|---------------|--------|--------|-------------|-------------------------------|
|`[RpcProtocol]`|false   |named   |False        |Proto<br/>RPCProtocol<br/>NCACN|

#### **Server**
Specifies the target computer for the operation. Enter a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. When the remote computer is in a different domain than the local computer, the fully qualified domain name is required.

|Type      |Required|Position|PipelineInput|Aliases                         |
|----------|--------|--------|-------------|--------------------------------|
|`[String]`|true    |named   |False        |Host<br/>DomainController<br/>DC|

---

### Inputs
None

---

### Outputs
* DSInternals.Common.Data.DPAPIBackupKey

---

### Notes

---

### Syntax
```PowerShell
Get-ADReplBackupKey [-Credential <PSCredential>] [-Domain <String>] [-Protocol {TCP | SMB | HTTP}] -Server <String> [<CommonParameters>]
```
