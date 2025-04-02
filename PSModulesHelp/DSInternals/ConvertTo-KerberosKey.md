ConvertTo-KerberosKey
---------------------

### Synopsis
Computes Kerberos keys from a given password using Kerberos version 5 Key Derivation Functions.

---

### Description

Supports the derivation of AES256, AES128 and DES encryption keys. To calculate the RC4 key, the ConvertTo-NTHash cmdlet should be used instead.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-KerberosKey.md)

* [ConvertTo-NTHash](ConvertTo-NTHash)

* [ConvertTo-LMHash](ConvertTo-LMHash)

---

### Examples
> Example 1

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
PS C:\> ConvertTo-KerberosKey -Password $pwd -Salt 'CONTOSO.COMAdministrator'
<# Sample Output:

AES256_CTS_HMAC_SHA1_96
  Key: 660e61042b190b5724c62bb473facca12058fb9ad3c03c0d2809f839c0352502
  Iterations: 4096

AES128_CTS_HMAC_SHA1_96
  Key: bd75e98362b16649ffbaed630d5341d0
  Iterations: 4096

DES_CBC_MD5
  Key: aed02c52204ca2ce
  Iterations: 4096
#>
Applies 3 different kerberos key derivation functions to the specified password and salt.
```

---

### Parameters
#### **Iterations**
Specifies the iteration count parameter of the string-to-key functions.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |2       |False        |i      |

#### **Password**
Specifies an input password from which kerberos keys will be derived.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[SecureString]`|true    |0       |False        |p      |

#### **Salt**
Specifies the salt parameter of the string-to-key functions.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |False        |s      |

---

### Inputs
None

---

### Outputs
* DSInternals.Common.Data.KerberosKeyDataNew

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-KerberosKey [-Password] <SecureString> [-Salt] <String> [[-Iterations] <Int32>] [<CommonParameters>]
```
