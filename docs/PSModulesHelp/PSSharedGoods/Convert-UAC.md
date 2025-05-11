Convert-UAC
-----------

### Synopsis
Converts values from Events into proper format

---

### Description

Converts values from Events into proper format

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-UAC -UAC '%%1793'
Convert-UAC -UAC '1793'
Output: TEMP_DUPLICATE_ACCOUNT, NORMAL_ACCOUNT, RESERVED
Convert-UAC -UAC '1793', '1794'

Convert-UAC -UAC '121793'
Output: PASSWD_CANT_CHANGE, ENCRYPTED_TEXT_PWD_ALLOWED, TEMP_DUPLICATE_ACCOUNT, NORMAL_ACCOUNT, INTERDOMAIN_TRUST_ACCOUNT, WORKSTATION_TRUST_ACCOUNT, RESERVED, RESERVED, DONT_EXPIRE_PASSWORD

Convert-UAC -UAC 'C:\Onet33'
Output: Same input as output

Convert-UAC -UAC '121793' -OutputPerLine
Output: One entry per line
    PASSWD_CANT_CHANGE
    ENCRYPTED_TEXT_PWD_ALLOWED
    TEMP_DUPLICATE_ACCOUNT
    NORMAL_ACCOUNT
    INTERDOMAIN_TRUST_ACCOUNT
    WORKSTATION_TRUST_ACCOUNT
    RESERVED
    RESERVED
    DONT_EXPIRE_PASSWORD
```

---

### Parameters
#### **UAC**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Separator**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-UAC [[-UAC] <String[]>] [[-Separator] <String>] [<CommonParameters>]
```
