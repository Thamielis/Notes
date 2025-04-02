ConvertTo-OrgIdHash
-------------------

### Synopsis
Calculates OrgId hash of a given password. Used by Azure Active Directory Connect.

---

### Description

The OrgId hash is defined as PBKDF2( UTF-16( ToUpper( ToHex( MD4( UTF-16(plaintext))))), RND(10), 1000, HMAC-SHA256, 32).

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-OrgIdHash.md)

* [ConvertTo-NTHash](ConvertTo-NTHash)

---

### Examples
> Example 1

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
PS C:\> ConvertTo-OrgIdHash -Password $pwd
<# Sample Output:
v1;PPH1_MD4,60eaffd2c886b419df7a,1000,ab9c532104713157395a70da85cc8a1b418508753c6997f02341d541328ef16b;
#>
Calculates the OrgId hash from a cleartext password using a random salt.
```
> Example 2

```PowerShell
PS C:\> ConvertTo-OrgIdHash -NTHash 92937945b518814341de3f726500d4ff
<# Sample Output:
v1;PPH1_MD4,46c0c5d9095185ce5cf8,1000,6bb7b360d9105ed5157460b343d5d143e465a59195bc9b568718268c334ea4a9;
#>
Calculates the OrgId hash from a NT hash while using a random salt.
```
> Example 3

```PowerShell
PS C:\> ConvertTo-OrgIdHash -NTHash 92937945b518814341de3f726500d4ff -Salt a42b92067e4b8123101a
<# Sample Output:
v1;PPH1_MD4,a42b92067e4b8123101a,1000,f0fc762ea9051ef754652becd83ee5e54c1c857c1c0965abac5d85de9c143911;
#>
Calculates the OrgId hash from a NT hash while using the given salt.
```

---

### Parameters
#### **NTHash**
Provide a 16-byte NT Hash of user's password in hexadecimal format.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Byte[]]`|true    |0       |True (ByValue)|h      |

#### **Password**
Provide a password in the form of a SecureString.

|Type            |Required|Position|PipelineInput |Aliases|
|----------------|--------|--------|--------------|-------|
|`[SecureString]`|true    |0       |True (ByValue)|p      |

#### **Salt**
Provide a 10-byte salt in hexadecimal format.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Byte[]]`|false   |1       |True (ByValue)|s      |

---

### Inputs
System.Security.SecureString

System.Byte[]

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-OrgIdHash [-NTHash] <Byte[]> [[-Salt] <Byte[]>] [<CommonParameters>]
```
```PowerShell
ConvertTo-OrgIdHash [-Password] <SecureString> [[-Salt] <Byte[]>] [<CommonParameters>]
```
