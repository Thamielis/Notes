Get-ADTrustAttributes
---------------------

### Synopsis
Retrieves and interprets Active Directory trust attributes based on the provided value.

---

### Description

This function retrieves and interprets Active Directory trust attributes based on the provided value. It decodes the binary value into human-readable trust attributes.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ADTrustAttributes -Value 1
Retrieves and interprets the trust attributes for the value 1.
```
> EXAMPLE 2

```PowerShell
1, 2, 4 | Get-ADTrustAttributes
Retrieves and interprets the trust attributes for the values 1, 2, and 4.
```

---

### Parameters
#### **Value**
Specifies the integer value representing the trust attributes.

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[Int32]`|false   |1       |true (ByValue)|

---

### Notes
This function provides a convenient way to decode Active Directory trust attributes.

---

### Syntax
```PowerShell
Get-ADTrustAttributes [[-Value] <Int32>] [<CommonParameters>]
```
