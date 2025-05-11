Clear-IECachedData
------------------

### Synopsis
Pretty easy to grasp... This function clears data cached by IE

---

### Description

Clears all, or selected cache data stored by IE

---

### Examples
> EXAMPLE 1

```PowerShell
Clear-IECachedData -TempIEFiles -Cookies -History -FormData -Passwords -All -AddOnSettings
Describe what this call does
```

---

### Parameters
#### **TempIEFiles**
Delete Temporary Internet Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Cookies**
Delete Cookies

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **History**
Delete History

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FormData**
Delete Form Data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Passwords**
Delete Passwords

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **All**
Delete All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AddOnSettings**
Delete Files and Settings Stored by Add-Ons

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
N/A

---

### Outputs
* N/A

---

### Syntax
```PowerShell
Clear-IECachedData [-TempIEFiles] [-Cookies] [-History] [-FormData] [-Passwords] [-All] [-AddOnSettings] [<CommonParameters>]
```
