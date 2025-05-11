Invoke-WindowsApi
-----------------

### Synopsis
Invoke a native Windows API call that takes and returns simple data types.

---

### Description

---

### Examples
# Prepare the parameter types and parameters for the CreateHardLink function

```PowerShell
PS > $filename = "c:\temp\hardlinked.txt"
PS > $existingFilename = "c:\temp\link_target.txt"
PS > Set-Content $existingFilename "Hard Link target"
PS > $parameterTypes = [string], [string], [IntPtr]
PS > $parameters = [string] $filename, [string] $existingFilename,
    [IntPtr]::Zero
## Call the CreateHardLink method in the Kernel32 DLL
PS > $result = Invoke-WindowsApi "kernel32" ([bool]) "CreateHardLink" `
    $parameterTypes $parameters
PS > Get-Content C:\temp\hardlinked.txt
Hard Link target
```

---

### Parameters
#### **DllName**
The name of the DLL that contains the Windows API, such as "kernel32"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ReturnType**
The return type expected from Windows API

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Type]`|false   |2       |false        |

#### **MethodName**
The name of the Windows API

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ParameterTypes**
The types of parameters expected by the Windows API

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Type[]]`|false   |4       |false        |

#### **Parameters**
Parameter values to pass to the Windows API

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |5       |false        |

---

### Syntax
```PowerShell
Invoke-WindowsApi [[-DllName] <String>] [[-ReturnType] <Type>] [[-MethodName] <String>] [[-ParameterTypes] <Type[]>] [[-Parameters] <Object[]>] [<CommonParameters>]
```
