New-VBRAmazonEC2Tag
-------------------

### Synopsis
Defines AWS tags.

---

### Description

This cmdlet creates the VBRAmazonEC2Tag object that contains settings of AWS tags.

---

### Examples
> Defining AWS Tags

```PowerShell
New-VBRAmazonEC2Tag -Key webserver -Value production
This command defines AWS tags.
```

---

### Parameters
#### **Key**
Specifies a key for the AWS tag.
The cmdlet will create the cmdlet with the specified key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Value**
Specifies a value for the the AWS tag.
The cmdlet will create the cmdlet with the specified value.

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
New-VBRAmazonEC2Tag -Key <String> -Value <String> [<CommonParameters>]
```
