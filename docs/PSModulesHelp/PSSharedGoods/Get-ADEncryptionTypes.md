Get-ADEncryptionTypes
---------------------

### Synopsis
Retrieves the supported encryption types based on the specified value.

---

### Description

This function returns the list of encryption types supported by Active Directory based on the provided value. Each encryption type is represented by a string.

---

### Examples
> EXAMPLE 1

Get-ADEncryptionTypes -Value 24
Retrieves the following encryption types:
- AES128-CTS-HMAC-SHA1-96
- AES256-CTS-HMAC-SHA1-96

---

### Parameters
#### **Value**
Specifies the integer value representing the encryption types to retrieve.

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[Int32]`|false   |1       |true (ByValue)|

---

### Notes
This function is designed to provide information about encryption types supported by Active Directory.

---

### Syntax
```PowerShell
Get-ADEncryptionTypes [[-Value] <Int32>] [<CommonParameters>]
```
