ConvertTo-SodiumSealedBox
-------------------------

### Synopsis
Encrypts a message using a sealed public key box.

---

### Description

This function encrypts a given message using a public key with the SealedPublicKeyBox method from the Sodium library.
The result is a base64-encoded sealed box that can only be decrypted by the corresponding private key.

---

### Related Links
* [https://psmodule.io/Sodium/Functions/ConvertTo-SodiumSealedBox/](https://psmodule.io/Sodium/Functions/ConvertTo-SodiumSealedBox/)

* [https://doc.libsodium.org/public-key_cryptography/sealed_boxes](https://doc.libsodium.org/public-key_cryptography/sealed_boxes)

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-SodiumSealedBox -Message "Hello world!" -PublicKey $publicKey
Output:
```powershell
hhCon4PO1X0TIPeh1i4GM6Wg9HSF5ge/x4L7p1vNd3lIdiJqNmBfswkcHipyM4HUr9wDLebjARVp5tsB
```

Encrypts the message "Hello world!" using the provided base64-encoded public key and returns a base64-encoded sealed box.
```
> EXAMPLE 2

```PowerShell
"Sensitive Data" | ConvertTo-SodiumSealedBox -PublicKey $publicKey
Output:
```powershell
p3PGL162uLCvrsCRLUDrc/Kfc5biGVzxRDg25ZdJoR9Y6ABZUKo8pvDoOGdchv0iBYQO2LP0Q6BkVbIDBUw=
```

Uses pipeline input to encrypt the provided message using the specified public key.
```

---

### Parameters
#### **Message**
The message string to be encrypted.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **PublicKey**
The base64-encoded public key used for encryption.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
The function returns a base64-encoded sealed box string that can only be decrypted by the corresponding private key.

---

### Syntax
```PowerShell
ConvertTo-SodiumSealedBox [-Message] <String> [-PublicKey] <String> [<CommonParameters>]
```
