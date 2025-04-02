New-VBRGoogleCloudComputeLabel
------------------------------

### Synopsis
Creates Google Cloud labels.

---

### Description

This cmdlet creates Google Cloud labels.
You can use these labels to categorize instances in Google Cloud.

---

### Examples
> Creating Google Cloud Label

```PowerShell
New-VBRGoogleCloudComputeLabel -Key "location" -Value "west"
This example shows how to create a new Google Cloud label with the location key and the west value of this key.
```

---

### Parameters
#### **Key**
Specifies a Google Cloud label key.
The cmdlet will create a label with this key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Value**
Specifies a key value for the Google Cloud label.
The cmdlet will create the label with the specified key value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
New-VBRGoogleCloudComputeLabel -Key <String> [-Value <String>] [<CommonParameters>]
```
