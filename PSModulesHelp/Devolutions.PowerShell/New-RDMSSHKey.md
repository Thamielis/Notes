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
|`[String]`|false   |named   |false        |

#### **Encryption**
The encryption used with the passphrase to save the private key in the file.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SshPkcs1Encryption]`|true    |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **Format**
The format used to store the private key.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **Passphrase**
Passphrase used to protected the private key file. An empty SecureString is accepted, meaning no encryption will occur.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |named   |false        |

#### **Round**
The number of rounds of key derivations. The default value is 64 rounds. The maximum value for the OpenSSH format is 1000 rounds. For PKCS8, the maximum number of rounds is 32768.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **SavePrivateKey**
Save the private key in a file at the specified path. The supported extensions are: PKCS#1/OpenSSL (*.key), PKCS#8 (*.pri) and PuTTY (*ppk)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SavePublicKey**
Save the public key in a file at the specified path. The supported extension is (*.pub).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Size**
The number of bits in the key for RSA and ECDSA algorithms. For RSA, the default value is 2048 and the valid values are: 1024, 2048, 3072, 4096, 6144 and 8192.  For ECDSA, the default value is 256 and the valid values are: 256, 384 and 521.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
New-RDMSSHKey -Format <OpenSSH> -Round <Int32> [-SavePrivateKey <String>] -Format <OpenSSH> -Round <Int32> -Passphrase <SecureString> [-SavePrivateKey <String>] [-SavePublicKey <String>] [<CommonParameters>]
```
```PowerShell
New-RDMSSHKey -Format <PKCS1> -Encryption <AES_128_CBC | DES_EDE3_CBC | AES_192_CBC | AES_256_CBC> [-SavePrivateKey <String>] -Format <PKCS1> -Encryption <AES_128_CBC | DES_EDE3_CBC | AES_192_CBC | AES_256_CBC> -Passphrase <SecureString> [-SavePrivateKey <String>] [-SavePublicKey <String>] [<CommonParameters>]
```
```PowerShell
New-RDMSSHKey -Format <PKCS8> -Encryption <MD5_DES | SHA1_DES | SHA1_RC4_128 | SHA1_3DES | SHA1_2DES> -Round <Int32> [-SavePrivateKey <String>] -Format <PKCS8> -Encryption <MD5_DES | SHA1_DES | SHA1_RC4_128 | SHA1_3DES | SHA1_2DES> -Round <Int32> -Passphrase <SecureString> [-SavePrivateKey <String>] [-SavePublicKey <String>] [<CommonParameters>]
```
```PowerShell
New-RDMSSHKey -Format <Putty> [-SavePrivateKey <String>] -Format <Putty> -Passphrase <SecureString> [-SavePrivateKey <String>] [-SavePublicKey <String>] [<CommonParameters>]
```
