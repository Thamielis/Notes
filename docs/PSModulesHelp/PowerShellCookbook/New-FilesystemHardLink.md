New-FilesystemHardLink
----------------------

### Synopsis
Create a new hard link, which allows you to create a new name by which you
can access an existing file. Windows only deletes the actual file once
you delete all hard links that point to it.

---

### Description

---

### Examples
> EXAMPLE 1

"Hello" > test.txt
PS > dir test* | select name
Name
----
test.txt

PS > .\New-FilesystemHardLink.ps1 test.txt test2.txt
PS > type test2.txt
Hello
PS > dir test* | select name

Name
----
test.txt
test2.txt

---

### Parameters
#### **Path**
The existing file that you want the new name to point to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Destination**
The new filename you want to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
New-FilesystemHardLink [[-Path] <String>] [[-Destination] <String>] [<CommonParameters>]
```
