Invoke-OAIUploadFile
--------------------

### Synopsis
Uploads a file to a specified URL using the OpenAI API.

---

### Description

The Invoke-OAIUploadFile function uploads a file to a specified URL using the OpenAI API. It supports uploading files for fine-tuning or for use with assistants.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-OAIUploadFile -Path 'C:\Files\my_file.txt' -Purpose 'fine-tune'
Uploads the file 'my_file.txt' for fine-tuning using the OpenAI API.
```
> EXAMPLE 2

```PowerShell
Get-ChildItem 'C:\Files' | Invoke-OAIUploadFile -Purpose 'assistants'
Uploads all files in the 'C:\Files' directory for use with assistants using the OpenAI API.
```

---

### Parameters
#### **Path**
Specifies the path of the file to upload. This parameter accepts pipeline input by property name.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Object]`|false   |1       |true (ByPropertyName)|FullName|

#### **Purpose**
Specifies the purpose of the file upload. Valid values are 'fine-tune' and 'assistants'. The default value is 'assistants'.
Valid Values:

* fine-tune
* assistants
* vision

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Invoke-OAIUploadFile [[-Path] <Object>] [[-Purpose] <Object>] [<CommonParameters>]
```
