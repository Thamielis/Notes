ConvertTo-LMHash
----------------

### Synopsis
Calculates LM hash of a given password.

---

### Description

Applies the Lan Manager one-way function (LM OWF) to a given cleartext password and returns the resulting hash.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-LMHash.md)

* [ConvertTo-NTHash](ConvertTo-NTHash)

* [ConvertTo-KerberosKey](ConvertTo-KerberosKey)

---

### Examples
> Example 1

```PowerShell
PS C:\> ConvertTo-LMHash

cmdlet ConvertTo-LMHash at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
Password: ********
727e3576618fa1754a3b108f3fa6cb6d
Reads a password from the command line and calculates its LM hash.
```
> Example 2

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
PS C:\> ConvertTo-LMHash -Password $pwd
727e3576618fa1754a3b108f3fa6cb6d
Calculates the LM hash of password Pa$$w0rd .
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
ConvertTo-LMHash [-Password] <SecureString> [<CommonParameters>]
```
