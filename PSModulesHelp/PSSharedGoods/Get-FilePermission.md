Get-FilePermission
------------------

### Synopsis
Retrieves and displays file permissions for the specified file or folder.

---

### Description

This function retrieves and displays the file permissions for the specified file or folder. It provides options to filter permissions based on inheritance, resolve access control types, and include extended information.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FilePermission -Path "C:\Example\File.txt"
Description:
Retrieves and displays the permissions for the "File.txt" file.
```
> EXAMPLE 2

```PowerShell
Get-FilePermission -Path "D:\Folder" -Inherited
Description:
Retrieves and displays only the inherited permissions for the "Folder" directory.
```
> EXAMPLE 3

```PowerShell
Get-FilePermission -Path "E:\Document.docx" -ResolveTypes -Extended
Description:
Retrieves and displays the resolved access control types and extended information for the "Document.docx" file.
```

---

### Parameters
#### **Path**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **Inherited**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NotInherited**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ResolveTypes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeACLObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHashTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ACLS**

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[FileSystemSecurity]`|false   |2       |false        |

---

### Notes
This function supports various options to customize the output and handle different permission scenarios.

---

### Syntax
```PowerShell
Get-FilePermission [[-Path] <Array>] [-Inherited] [-NotInherited] [-ResolveTypes] [-Extended] [-IncludeACLObject] [-AsHashTable] [[-ACLS] <FileSystemSecurity>] [<CommonParameters>]
```
