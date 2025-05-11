Convert-Office365License
------------------------

### Synopsis
Converts Office 365 licenses between their names and SKUs.

---

### Description

This function allows for the conversion of Office 365 licenses between their names and SKUs. It provides flexibility to handle multiple values for licenses.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-Office365License -License 'VISIOCLIENT','PROJECTONLINE_PLAN_1','test','tenant:VISIOCLIENT'
Converts the specified licenses to their corresponding SKUs.
```
> EXAMPLE 2

```PowerShell
Convert-Office365License -License "Office 365 A3 for faculty", "Project Plan 3 (for Department)", 'test' -ToSku
Converts the specified license names to their corresponding SKUs.
```

---

### Parameters
#### **License**
Specifies the Office 365 license SKU or name to convert. Supports multiple values.

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[Array]`|false   |1       |true (ByValue)|

#### **ToSku**
Indicates whether to convert the license name to SKU.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |SKU    |

#### **Separator**
Specifies the separator to use when returning multiple values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReturnArray**
Indicates whether to return the result as an array.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
For more information on Office 365 licensing, refer to: https://learn.microsoft.com/en-us/azure/active-directory/enterprise-users/licensing-service-plan-reference

---

### Syntax
```PowerShell
Convert-Office365License [[-License] <Array>] [-ToSku] [-Separator <String>] [-ReturnArray] [<CommonParameters>]
```
