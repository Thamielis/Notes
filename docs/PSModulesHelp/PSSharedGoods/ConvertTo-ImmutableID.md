ConvertTo-ImmutableID
---------------------

### Synopsis
Converts an Active Directory user's ObjectGUID to an ImmutableID.

---

### Description

This function takes an Active Directory user object or a GUID as input and converts the ObjectGUID to an ImmutableID, which is commonly used in Azure AD.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-ImmutableID -User $ADUser
Converts the ObjectGUID of the specified Active Directory user to an ImmutableID.
```
> EXAMPLE 2

```PowerShell
ConvertTo-ImmutableID -ObjectGUID "12345678-1234-1234-1234-1234567890AB"
Converts the specified GUID to an ImmutableID.
```

---

### Parameters
#### **User**
Specifies the Active Directory user object to convert. This parameter is mutually exclusive with the 'ObjectGUID' parameter.

|Type         |Required|Position|PipelineInput|Aliases|
|-------------|--------|--------|-------------|-------|
|`[ADAccount]`|false   |named   |false        |ADuser |

#### **ObjectGUID**
Specifies the GUID to convert to ImmutableID. This parameter is mutually exclusive with the 'User' parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |GUID   |

---

### Syntax
```PowerShell
ConvertTo-ImmutableID [-User <ADAccount>] [<CommonParameters>]
```
```PowerShell
ConvertTo-ImmutableID [-ObjectGUID <String>] [<CommonParameters>]
```
