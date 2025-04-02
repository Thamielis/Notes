Add-ADReplNgcKey
----------------

### Synopsis
Composes and updates the msDS-KeyCredentialLink value on an object through the MS-DRSR protocol.

---

### Description

This cmdlet wraps the IDL_DRSWriteNgcKey RPC call.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Add-ADReplNgcKey.md)

* [Get-ADReplAccount](Get-ADReplAccount)

* [Get-ADKeyCredential](Get-ADKeyCredential)

---

### Examples
> Example 1

```PowerShell
PS C:\> Add-ADReplNgcKey -UserPrincipalName 'john@contoso.com' -Server LON-DC1 -PublicKey 525341310008000003000000000100000000000000000000010001C1A78914457758B0B13C70C710C7F8548F3F9ED56AD4640B6E6A112655C98ECAC1CBD68A298F5686C08439428A97FE6FDF58D78EA481905182BAD684C2D9C5CDE1CDE34AA19742E8BBF58B953EAC4C562FCF598CC176B02DBE9FFFEF5937A65815C236F92892F7E511A1FEDD5483CB33F1EA715D68106180DED2432A293367114A6E325E62F93F73D7ECE4B6A2BCDB829D95C8645C3073B94BA7CB7515CD29042F0967201C6E24A77821E92A6C756DF79841ACBAAE11D90CA03B9FCD24EF9E304B5D35248A7BD70557399960277058AE3E99C7C7E2284858B7BF8B08CDD286964186A50A7FCBCC6A24F00FEE5B9698BBD3B1AEAD0CE81FEA461C0ABD716843A5
Registers the specified NGC public key for user john@contoso.com .
```

---

### Parameters
#### **Credential**
Specifies a user account that has permission to perform this action. The default is the current user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **DistinguishedName**
Specifies the identifier of the target Active Directory object.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |0       |True (ByPropertyName)|dn     |

#### **Domain**
Specifies the NetBIOS domain name of the target Active Directory account.

|Type      |Required|Position|PipelineInput|Aliases                     |
|----------|--------|--------|-------------|----------------------------|
|`[String]`|false   |1       |False        |AccountDomain<br/>UserDomain|

#### **ObjectGuid**
Specifies the identifier of the target Active Directory object.

|Type    |Required|Position|PipelineInput        |Aliases|
|--------|--------|--------|---------------------|-------|
|`[Guid]`|true    |named   |True (ByPropertyName)|Guid   |

#### **ObjectSid**
Specifies the identifier of the target Active Directory account.

|Type                  |Required|Position|PipelineInput        |Aliases|
|----------------------|--------|--------|---------------------|-------|
|`[SecurityIdentifier]`|true    |named   |True (ByPropertyName)|Sid    |

#### **Protocol**
Specifies the protocol sequence that is used for RPC communication.
Valid Values:

* TCP
* SMB
* HTTP

|Type           |Required|Position|PipelineInput|Aliases                        |
|---------------|--------|--------|-------------|-------------------------------|
|`[RpcProtocol]`|false   |named   |False        |Proto<br/>RPCProtocol<br/>NCACN|

#### **PublicKey**
Specifies the NGC key value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Byte[]]`|true    |named   |False        |

#### **SamAccountName**
Specifies the identifier of the target Active Directory account.

|Type      |Required|Position|PipelineInput                 |Aliases                               |
|----------|--------|--------|------------------------------|--------------------------------------|
|`[String]`|true    |0       |True (ByPropertyName, ByValue)|Login<br/>sam<br/>AccountName<br/>User|

#### **Server**
Specifies the target computer for the operation. Enter a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. When the remote computer is in a different domain than the local computer, the fully qualified domain name is required.

|Type      |Required|Position|PipelineInput|Aliases                         |
|----------|--------|--------|-------------|--------------------------------|
|`[String]`|true    |named   |False        |Host<br/>DomainController<br/>DC|

#### **UserPrincipalName**
Specifies the identifier of the target Active Directory account.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|UPN    |

---

### Inputs
System.String

System.Security.Principal.SecurityIdentifier

System.Guid

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Add-ADReplNgcKey [-DistinguishedName] <String> [-Credential <PSCredential>] [-Protocol {TCP | SMB | HTTP}] -PublicKey <Byte[]> -Server <String> [<CommonParameters>]
```
```PowerShell
Add-ADReplNgcKey [-SamAccountName] <String> [[-Domain] <String>] [-Credential <PSCredential>] [-Protocol {TCP | SMB | HTTP}] -PublicKey <Byte[]> -Server <String> [<CommonParameters>]
```
```PowerShell
Add-ADReplNgcKey [-Credential <PSCredential>] -ObjectGuid <Guid> [-Protocol {TCP | SMB | HTTP}] -PublicKey <Byte[]> -Server <String> [<CommonParameters>]
```
```PowerShell
Add-ADReplNgcKey [-Credential <PSCredential>] -ObjectSid <SecurityIdentifier> [-Protocol {TCP | SMB | HTTP}] -PublicKey <Byte[]> -Server <String> [<CommonParameters>]
```
```PowerShell
Add-ADReplNgcKey [-Credential <PSCredential>] [-Protocol {TCP | SMB | HTTP}] -PublicKey <Byte[]> -Server <String> -UserPrincipalName <String> [<CommonParameters>]
```
