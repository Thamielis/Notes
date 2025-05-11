New-HTMLStatusItem
------------------

### Synopsis

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-Icon <Object>] [-Percentage <string>] [-FontColor <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconHex <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconSolid <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconRegular <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconBrands <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Icon**

Valid Values:

* Dead
* Bad
* Good

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **IconBrands**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **IconHex**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **IconRegular**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **IconSolid**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[string]`|false   |Named   |false        |ServiceName|

#### **Percentage**

Valid Values:

* 0%
* 10%
* 30%
* 70%
* 100%

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Status**

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[string]`|false   |Named   |false        |ServiceStatus|

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-HTMLStatusItem; CommonParameters=True; parameter=System.Object[]}, @{name=New-HTMLStatusItem; CommonParameters=True; parameter=System.Object[]}, @{name=Ne…
```
