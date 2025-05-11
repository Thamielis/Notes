ConvertTo-NTHash
----------------

### Synopsis
Calculates NT hash of a given password.

---

### Description

Applies the NT one-way function (NT OWF) to a given cleartext password and returns the resulting hash, which is just the MD4 hash function applied to the UTF-16 encoded input.

This hash is sometimes called NTLM hash, because it is mainly used in the NTLM(v2) network authentication protocol.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-NTHash.md)

* [ConvertTo-LMHash](ConvertTo-LMHash)

* [ConvertTo-KerberosKey](ConvertTo-KerberosKey)

---

### Examples
> Example 1

```PowerShell
PS C:\> ConvertTo-NTHash

cmdlet ConvertTo-NTHash at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
Password: ********
92937945b518814341de3f726500d4ff
Reads a password from the command line and calculates its NT hash.
```
> Example 2

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
PS C:\> ConvertTo-NTHash -Password $pwd
92937945b518814341de3f726500d4ff
Calculates the NT hash of password Pa$$w0rd .
```

---

### Parameters
#### **Password**
Specifies a password in the form of a SecureString.

|Type            |Required|Position|PipelineInput |Aliases|
|----------------|--------|--------|--------------|-------|
|`[SecureString]`|true    |0       |True (ByValue)|p      |

---

### Inputs
System.Security.SecureString

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-NTHash [-Password] <SecureString> [<CommonParameters>]
```
