EmailServer
-----------

### Synopsis

EmailServer [[-Server] <string>] [[-Port] <int>] [[-UserName] <string>] [[-Password] <string>] [-PasswordAsSecure] [-PasswordFromFile] [-SSL] [-UseDefaultCredential] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Password**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **PasswordAsSecure**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PasswordFromFile**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Port**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |1       |false        |

#### **SSL**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Server**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **UseDefaultCredential**

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[switch]`|false   |Named   |false        |UseDefaultCredentials|

#### **UserName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

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
{@{name=EmailServer; CommonParameters=True; parameter=System.Object[]}}
```
