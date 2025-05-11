New-VBRObjectStorageBackupTagMask
---------------------------------

### Synopsis
Defines a tag mask for for objects and prefixes in object storage.

---

### Description

This cmdlet creates the VBRObjectStorageBackupTagMask object. This object defines a tag mask for objects and prefixes in object storage. You can use this mask to exclude files from object storage backup job or include them to this job.

---

### Examples
> Defining Tag Mask for Object Within Object Storage Job

```PowerShell
$InclusionMask = New-VBRObjectStorageBackupTagMask -Name "tag" -Value "tag" -IsObjectTag
This command defines the tag mask for with object storage job.
```

---

### Parameters
#### **IsObjectTag**
Note: This parameter is required if you specify the tag for an individual object. Defines that the cmdlet will recognize the object tag. If you omit this parameter, the cmdlet will recognize the

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name of a tag. Note: This parameter is case-sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Value**
Specifies the value of a tag. Note: This parameter is case-sensitive.

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
New-VBRObjectStorageBackupTagMask [-IsObjectTag] -Name <String> -Value <String> [<CommonParameters>]
```
