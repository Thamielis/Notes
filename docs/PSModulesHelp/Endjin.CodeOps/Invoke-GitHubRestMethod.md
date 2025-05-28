Invoke-GitHubRestMethod
-----------------------

### Synopsis

Invoke-GitHubRestMethod [-Uri] <uri> [[-Verb] <string>] [[-Body] <hashtable>] [[-Token] <string>] [[-Headers] <hashtable>] [[-HttpErrorStatusCodesToIgnore] <int[]>] [[-MaxRetries] <int>] [[-RetryBackOffBaseFactor] <float>] [[-InitialBackOffSeconds] <int>] [-AllPages] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AllPages**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Body**

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[hashtable]`|false   |2       |false        |

#### **Headers**

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[hashtable]`|false   |4       |false        |

#### **HttpErrorStatusCodesToIgnore**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |5       |false        |

#### **InitialBackOffSeconds**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |8       |false        |

#### **MaxRetries**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |6       |false        |

#### **RetryBackOffBaseFactor**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[float]`|false   |7       |false        |

#### **Token**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **Uri**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[uri]`|true    |0       |false        |

#### **Verb**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

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
{@{name=Invoke-GitHubRestMethod; CommonParameters=True; parameter=System.Object[]}}
```
