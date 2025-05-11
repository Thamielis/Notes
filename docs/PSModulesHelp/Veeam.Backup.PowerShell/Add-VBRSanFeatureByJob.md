Add-VBRSanFeatureByJob
----------------------

### Synopsis
WARNING!
This cmdlet is for internal use only.

---

### Description

---

### Parameters
#### **FeatureId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **JobId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **RetentionCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **UseAsDataSource**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|true    |named   |False        |

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
Add-VBRSanFeatureByJob -FeatureId <Guid> -JobId <Guid> -RetentionCount <Int32> -UseAsDataSource <Boolean> [<CommonParameters>]
```
