Search-CertificateStore
-----------------------

### Synopsis
Search the certificate provider for certificates that match the specified
Enhanced Key Usage (EKU.)

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Search-CertificateStore "Encrypting File System"
Searches the certificate store for Encrypting File System certificates
```

---

### Parameters
#### **EkuName**
The friendly name of an Enhanced Key Usage
(such as 'Code Signing')

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Search-CertificateStore [-EkuName] <Object> [<CommonParameters>]
```
