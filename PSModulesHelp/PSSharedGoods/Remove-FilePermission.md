Remove-FilePermission
---------------------

### Synopsis
Removes specific or all access rules for a user or group from a file or folder.

---

### Description

This function removes specific or all access rules for a specified user or group from a file or folder. It can be used to manage file permissions effectively.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-FilePermission -Path "C:\Example\File.txt" -UserOrGroup "User1"
Removes access rules for "User1" from the file "File.txt".
```
> EXAMPLE 2

```PowerShell
Remove-FilePermission -Path "C:\Example\Folder" -All
Removes all access rules from the folder "Folder".
```

---

### Parameters
#### **Path**
Specifies the path of the file or folder from which to remove access rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **UserOrGroup**
Specifies the user or group for which access rules should be removed. If not specified, all access rules will be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether all access rules for the specified file or folder should be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Remove-FilePermission [[-Path] <String>] [[-UserOrGroup] <String>] [-All] [<CommonParameters>]
```
