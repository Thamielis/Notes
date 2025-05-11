Update-Wmi
----------

### Synopsis
Stores data in WMI

---

### Description

Stores data in the WMI repository

---

### Related Links
* [Select-Wmi](Select-Wmi)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem | 
    Select-Object Name, LastWriteTime, LastAccessTime, CreationTime | 
    Update-Wmi
```

---

### Parameters
#### **InputObject**
Any input object

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |named   |true (ByValue)|

#### **Namespace**
The namespace the object will be stored in

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ClassName**
The name of the class.  If not provided, the ClassName will be taken from the object.  Illegal characters in WMI class names (like ., :, or /) will be converted into _dot_, _colon_, and _slash_ respectively.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Key**
At least one property must be registered as a key

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Force**
If set, will update existing instances.  If not set, only new data will be added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Update-Wmi -InputObject <PSObject> [-Namespace <String>] [-ClassName <String>] [-Key] <String[]> [-Force] [<CommonParameters>]
```
