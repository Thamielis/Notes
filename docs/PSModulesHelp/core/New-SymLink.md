New-SymLink
-----------

### Synopsis
Creates symbolic links

---

### Description

This provides similar functionality to *nix ln command

---

### Examples
> EXAMPLE 1

```PowerShell
New-SymLnk -Link .\MyNewShortCut -Target '\\DataShareServer\MyShare'
```
> EXAMPLE 2

```PowerShell
ln .\shortcut ..\FileIcantLiveWithOut.txt
```

---

### Parameters
#### **Link**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Target**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
This function requires elevation

---

### Syntax
```PowerShell
New-SymLink [[-Link] <String>] [[-Target] <String>] [<CommonParameters>]
```
