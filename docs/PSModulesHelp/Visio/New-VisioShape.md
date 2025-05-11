New-VisioShape
--------------

### Synopsis

New-VisioShape [-Master] <Master[]> -Position <Point[]> [-Cells <ShapeCells[]>] [<CommonParameters>]

New-VisioShape -Rectangle [-BoundingBox] <Rectangle> [-Cells <ShapeCells[]>] [<CommonParameters>]

New-VisioShape -Oval [-BoundingBox] <Rectangle> [-Cells <ShapeCells[]>] [<CommonParameters>]

New-VisioShape -Line -From <Point> -To <Point> [-Cells <ShapeCells[]>] [<CommonParameters>]

New-VisioShape -Polyline [-Points] <Point[]> [-Cells <ShapeCells[]>] [<CommonParameters>]

New-VisioShape -Bezier [-Points] <Point[]> [-Cells <ShapeCells[]>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Bezier**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |0       |false        |

#### **BoundingBox**

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Rectangle]`|true    |1       |false        |

#### **Cells**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ShapeCells[]]`|false   |Named   |false        |

#### **From**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Point]`|true    |Named   |false        |

#### **Line**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |0       |false        |

#### **Master**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Master[]]`|true    |0       |false        |

#### **Oval**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |0       |false        |

#### **Points**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Point[]]`|true    |1       |false        |

#### **Polyline**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |0       |false        |

#### **Position**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Point[]]`|true    |Named   |false        |

#### **Rectangle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|true    |0       |false        |

#### **To**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Point]`|true    |Named   |false        |

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
{@{name=New-VisioShape; CommonParameters=True; parameter=System.Object[]}, @{name=New-VisioShape; CommonParameters=True; parameter=System.Object[]}, @{name=New-VisioSha…
```
