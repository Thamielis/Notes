Test-PSVersion
--------------

### Synopsis
Test the PowerShell Version

---

### Description

This function exists so I can do things differently on older versions of PowerShell.
But the reason I test in a function is that I can mock the Version to test the alternative code.

---

### Examples
> EXAMPLE 1

if(Test-PSVersion -ge 3.0) {
   ls | where Length -gt 12mb
} else {
   ls | Where { $_.Length -gt 12mb }
}
This is just a trivial example to show the usage (you wouldn't really bother for a where-object call)

---

### Parameters
#### **Version**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |1       |false        |

#### **lt**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |2       |false        |

#### **le**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |3       |false        |

#### **gt**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |4       |false        |

#### **ge**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |5       |false        |

#### **eq**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |6       |false        |

#### **ne**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |7       |false        |

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

---

### Syntax
```PowerShell
Test-PSVersion [[-Version] <Version>] [[-lt] <Version>] [[-le] <Version>] [[-gt] <Version>] [[-ge] <Version>] [[-eq] <Version>] [[-ne] <Version>] [<CommonParameters>]
```
