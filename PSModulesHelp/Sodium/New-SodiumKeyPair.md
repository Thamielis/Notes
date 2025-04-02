New-SodiumKeyPair
-----------------

### Synopsis
Generates a new Sodium key pair.

---

### Description

This function creates a new cryptographic key pair using Sodium's PublicKeyBox.
The keys are returned as a PowerShell custom object, with both the public and private keys
encoded in base64 format.

If a seed is provided, the key pair is deterministically generated using a SHA-256 derived seed.
This ensures that the same input seed will always produce the same key pair.

---

### Related Links
* [https://psmodule.io/Sodium/Functions/New-SodiumKeyPair/](https://psmodule.io/Sodium/Functions/New-SodiumKeyPair/)

* [https://doc.libsodium.org/public-key_cryptography/public-key_signatures](https://doc.libsodium.org/public-key_cryptography/public-key_signatures)

---

### Examples
> EXAMPLE 1

New-SodiumKeyPair
Output:
```powershell
PublicKey                                    PrivateKey
---------                                    ----------
Ac0wdsq6lqLGktckJrasPcTbVRuUCU+OKzVpMno+v0g= PVXI64v00+aT2b2O6Q4l+SfMBUY2R/Nogsl2mp/hXAs=
```

Generates a new key pair and returns a custom object containing the base64-encoded
public and private keys.
> EXAMPLE 2

New-SodiumKeyPair -Seed "MySecureSeed"
Output:
```powershell
PublicKey                                    PrivateKey
---------                                    ----------
WQakMx2mIAQMwLqiZteHUTwmMP6mUdK2FL0WEybWgB8= ci5/7eZ0IbGXtqQMaNvxhJ2d9qwFxA8Kjx+vivSTXqU=
```

Generates a deterministic key pair using the given seed string. The same seed will produce
the same key pair every time.
> EXAMPLE 3

"MySecureSeed" | New-SodiumKeyPair
Output:
```powershell
PublicKey                                    PrivateKey
---------                                    ----------
WQakMx2mIAQMwLqiZteHUTwmMP6mUdK2FL0WEybWgB8= ci5/7eZ0IbGXtqQMaNvxhJ2d9qwFxA8Kjx+vivSTXqU=
```

Generates a deterministic key pair using the given seed string via pipeline. The same seed will produce
the same key pair every time.

---

### Parameters
#### **Seed**
A seed value to use for key generation.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
Returns a PowerShell custom object with the following properties:
- **PublicKey**:  The base64-encoded public key.
- **PrivateKey**: The base64-encoded private key.
If key generation fails, an exception is thrown.

---

### Syntax
```PowerShell
New-SodiumKeyPair [<CommonParameters>]
```
```PowerShell
New-SodiumKeyPair -Seed <String> [<CommonParameters>]
```
