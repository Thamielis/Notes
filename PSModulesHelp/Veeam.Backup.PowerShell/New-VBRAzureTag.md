New-VBRAzureTag
---------------

### Synopsis
Defines Azure metadata tags.

---

### Description

This cmdlet defines the VBRAzureTag object. This object contains Azure metadata tags.

---

### Examples
> Defining Azure MetadataTags

```PowerShell
New-VBRAzureTag -Key Critically -Value High
This command defines Azure metadata tags.
```

---

### Parameters
#### **Key**
Specifies a key for the Azure metadata tag. The cmdlet will create the cmdlet with the specified key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Value**
Specifies a value for the the Azure metadata tag. The cmdlet will create the cmdlet with the specified value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRAzureTag -Key <String> -Value <String> [<CommonParameters>]
```
