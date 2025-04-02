New-HTMLCarousel
----------------

### Synopsis

New-HTMLCarousel [[-Slide] <scriptblock>] [[-Mode] <string>] [[-Align] <string>] [[-PerView] <Object>] [[-Height] <string>] [[-Margin] <string>] [[-Speed] <int>] [[-MoveBy] <int>] [[-StartAt] <int>] [[-AutoPlayEvery] <int>] [[-AutoPlaySyncID] <string>] [[-ArrowTemplate] <string[]>] [[-PaginationTemplate] <string>] [[-CountTemplate] <string>] [-Loop] [-Pagination] [-MoveOnClick] [-AutoPlay] [-AutoPlayRewind] [-AutoPlayPauseOnFocus] [-AutoPlayPauseOnHover] [-DisableArrows] [-Count] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Align**

Valid Values:

* center
* start
* end
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **ArrowTemplate**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |11      |false        |

#### **AutoPlay**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Named   |false        |Stream |

#### **AutoPlayEvery**

|Type   |Required|Position|PipelineInput|Aliases    |
|-------|--------|--------|-------------|-----------|
|`[int]`|false   |9       |false        |StreamEvery|

#### **AutoPlayPauseOnFocus**

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[switch]`|false   |Named   |false        |StreamPauseOnFocus|

#### **AutoPlayPauseOnHover**

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[switch]`|false   |Named   |false        |StreamPauseOnHover|

#### **AutoPlayRewind**

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[switch]`|false   |Named   |false        |StreamRewind|

#### **AutoPlaySyncID**

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[string]`|false   |10      |false        |StreamSyncID|

#### **Count**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **CountTemplate**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |13      |false        |

#### **DisableArrows**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Height**

Valid Values:

* adaptive
* equal
* auto

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **Loop**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Margin**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |5       |false        |

#### **Mode**

Valid Values:

* Horizontal
* Vertical

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **MoveBy**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |7       |false        |

#### **MoveOnClick**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Pagination**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PaginationTemplate**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **PerView**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Slide**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Speed**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |6       |false        |

#### **StartAt**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |8       |false        |

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
{@{name=New-HTMLCarousel; CommonParameters=True; parameter=System.Object[]}}
```
