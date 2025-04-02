New-RDMSSHKey
-------------

### Synopsis
Create an SSH key.

---

### Description

Create an SSH key. The public key will be returned. There is also the possiblity the save a public or private key file. A passphrase can be used to protect the private key file. In both cases, an existing file will be overwritten.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $pubKey = New-RDMSSHkey -Algorithm RSA -Comment username@hostname -Size 2048
Create an SSH public key of 2048 bits using RSA and of format is Putty. The resulting key ends with the comment (username@hostname).
```
> EXAMPLE 2

```PowerShell
PS C:\> $pubKey = New-RDMSSHkey ECDSA -Comment username@hostname -Size 256 -SavePublicKey C:\mypath\sshPublicKey.pub
Create an SSH public key of 256 bits using ECDSA with the comment username@hostname. The key is saved in the file C:\mypath\sshPublicKey.pub. If the file exists, it will be overwritten.
```
> EXAMPLE 3

PS C:\> $passwd = Read-Host -AsSecureString; $pubKey = New-RDMSSHkey -Algorithm ECDSA -Format PKCS8 -Encryption SHA1_RC4_128 -Size 521 -Round 64 -SavePrivateKey C:\mypath\sshPrivateKey.pri -Passphrase $passwd
First, the password used to encrypt the file is generated from the input of the user. Create an SSH private key of 521 bits using ECDSA with an empty comment. The key is saved in the file C:\mypath\sshPrivateKey.pri. The format used is PKCS8 with encryption SHA1_RC4_128 and 64 rounds. If the passphrase used is empty, no encryption will occur.
> EXAMPLE 4

```PowerShell
PS C:\> $pubKey = New-RDMSSHkey -Algorithm ECDSA -Comment username@hostname -Format PKCS8 -Size 521 -Round 64 -SavePrivateKey C:\mypath\sshPrivateKey.pri
Create an SSH private key of 521 bits using ECDSA with the comment username@hostname. The key is saved in the file C:\mypath\sshPrivateKey.pri and is not encrypted.
```

---

### Parameters
#### **Algorithm**
The algorithm used to generate the SSH key.
Valid Values:

* DSA
* ED25519
* ECDSA
* RSA

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Comment**
The comment at the end of a public key. No space allowed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Format**
The format used to store the private key.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Passphrase**
Passphrase used to protected the private key file. An empty SecureString is accepted, meaning no encryption will occur.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |1       |false        |

#### **SavePrivateKey**
Save the private key in a file at the specified path. The supported extensions are: PKCS#1/OpenSSL (*.key), PKCS#8 (*.pri) and PuTTY (*ppk)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SavePublicKey**
Save the public key in a file at the specified path. The supported extension is (*.pub).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Size**
The number of bits in the key for RSA and ECDSA algorithms. For RSA, the default value is 2048 and the valid values are: 1024, 2048, 3072, 4096, 6144 and 8192.  For ECDSA, the default value is 256 and the valid values are: 256, 384 and 521.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSSHKey

---

### Notes
For more information, type "Get-Help New-RDMSSHKey -detailed". For technical information, type "Get-Help New-RDMSSHKey -full".

---

### Syntax
```PowerShell
New-RDMSSHKey [-Format] <String> [-SavePrivateKey] <String> [-Algorithm] <String> [[-Comment] <String>] [[-Size] <Int32>] [<CommonParameters>]
```
```PowerShell
New-RDMSSHKey [-Format] <String> [-Passphrase] <SecureString> [-SavePrivateKey] <String> [-Algorithm] <String> [[-Comment] <String>] [[-Size] <Int32>] [<CommonParameters>]
```
```PowerShell
New-RDMSSHKey [[-SavePublicKey] <String>] [-Algorithm] <String> [[-Comment] <String>] [[-Size] <Int32>] [<CommonParameters>]
```
