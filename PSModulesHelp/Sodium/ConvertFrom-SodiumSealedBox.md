ConvertFrom-SodiumSealedBox
---------------------------

### Synopsis
Decrypts a base64-encoded, Sodium SealedBox-encrypted string.

---

### Description

Converts a base64-encoded, Sodium SealedBox-encrypted string into its original plaintext form.
Uses the provided public and private keys to decrypt the sealed message.

---

### Related Links
* [https://psmodule.io/Sodium/Functions/ConvertFrom-SodiumSealedBox/](https://psmodule.io/Sodium/Functions/ConvertFrom-SodiumSealedBox/)

* [https://doc.libsodium.org/public-key_cryptography/sealed_boxes](https://doc.libsodium.org/public-key_cryptography/sealed_boxes)

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    SealedBox       = $encryptedMessage
    PublicKey       = $publicKey
    PrivateKey      = $privateKey
}
ConvertFrom-SodiumSealedBox @params
Output:
```powershell
Secret message revealed!
```

Decrypts the given encrypted message using the specified public and private keys and returns the original string.
```
> EXAMPLE 2

```PowerShell
$encryptedMessage | ConvertFrom-SodiumSealedBox -PublicKey $publicKey -PrivateKey $privateKey
Output:
```powershell
Confidential Data
```

Uses pipeline input to decrypt the given encrypted message with the specified keys.
```

---

### Parameters
#### **SealedBox**
The base64-encoded encrypted secret string to decrypt.

|Type      |Required|Position|PipelineInput                 |Aliases   |
|----------|--------|--------|------------------------------|----------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|CipherText|

#### **PublicKey**
The base64-encoded public key used for decryption.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **PrivateKey**
The base64-encoded private key used for decryption.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Returns the original plaintext string after decryption.
If decryption fails, an exception is thrown.

---

### Syntax
```PowerShell
ConvertFrom-SodiumSealedBox [-SealedBox] <String> [-PublicKey] <String> [-PrivateKey] <String> [<CommonParameters>]
```
