Get-FilesInFolder
-----------------

### Synopsis
Retrieves a list of files in a specified folder with the option to filter by extension.

---

### Description

This function retrieves a list of files in the specified folder. By default, it includes all files with the '.evtx' extension, but you can specify a different extension using the $Extension parameter.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FilesInFolder -Folder "C:\Logs"
Description:
Retrieves all files with the '.evtx' extension in the "C:\Logs" folder.
```
> EXAMPLE 2

```PowerShell
Get-FilesInFolder -Folder "D:\Documents" -Extension '*.txt'
Description:
Retrieves all files with the '.txt' extension in the "D:\Documents" folder.
```

---

### Parameters
#### **Folder**
Specifies the folder path from which to retrieve files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Extension**
Specifies the file extension to filter by. Default value is '*.evtx'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-FilesInFolder [[-Folder] <String>] [[-Extension] <String>] [<CommonParameters>]
```
