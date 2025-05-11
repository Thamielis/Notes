New-HTMLCarousel
----------------

### Synopsis
Creates a new HTML carousel element with customizable options.

---

### Description

This function creates a new HTML carousel element with the specified options such as slide content, mode (Horizontal/Vertical), alignment, number of slides per view, height, margin, looping, pagination, speed, starting slide, autoplay settings, arrow visibility, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLCarousel -Slide { "Slide Content Here" } -Mode Horizontal -Align center -PerView 3 -Height adaptive -Margin '10px' -Loop -Pagination -Speed 500 -MoveBy 1 -StartAt 0 -MoveOnClick -AutoPlay -AutoPlayEvery 3000 -AutoPlayRewind -AutoPlayPauseOnFocus -AutoPlayPauseOnHover -AutoPlaySyncID 'carousel1' -DisableArrows -ArrowTemplate @('left-arrow', 'right-arrow') -PaginationTemplate 'index' -Count -CountTemplate 'Slide {index} of {total}'
Creates a new HTML carousel with the specified options.
```

---

### Parameters
#### **Slide**
Specifies the content of the carousel slide as a script block.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Mode**
Specifies the mode of the carousel (Horizontal/Vertical). Default is Horizontal.
Valid Values:

* Horizontal
* Vertical

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Align**
Specifies the alignment of the carousel slides (center/start/end/justify).
Valid Values:

* center
* start
* end
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **PerView**
Specifies the number of slides per view.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Height**
Specifies the height of the carousel (adaptive/equal/auto).
Valid Values:

* adaptive
* equal
* auto

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Margin**
Specifies the margin between slides.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Loop**
Indicates whether the carousel should loop.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Pagination**
Indicates whether pagination should be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Speed**
Specifies the speed of the carousel animation.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **MoveBy**
Specifies the number of slides to move at a time.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

#### **StartAt**
Specifies the index of the slide to start at.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |9       |false        |

#### **MoveOnClick**
Indicates whether the carousel should move to the next slide on click.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoPlay**
Indicates whether autoplay is enabled.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Stream |

#### **AutoPlayEvery**
Specifies the interval for autoplay.

|Type          |Required|Position|PipelineInput|Aliases    |
|--------------|--------|--------|-------------|-----------|
|`[Nullable`1]`|false   |10      |false        |StreamEvery|

#### **AutoPlayRewind**
Indicates whether autoplay should rewind.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |false        |StreamRewind|

#### **AutoPlayPauseOnFocus**
Indicates whether autoplay should pause on focus.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |StreamPauseOnFocus|

#### **AutoPlayPauseOnHover**
Indicates whether autoplay should pause on hover.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |StreamPauseOnHover|

#### **AutoPlaySyncID**
Specifies the ID to sync autoplay with.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|false   |11      |false        |StreamSyncID|

#### **DisableArrows**
Indicates whether the arrow navigation should be disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrowTemplate**
Specifies custom arrow templates.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |12      |false        |

#### **PaginationTemplate**
Specifies the pagination template ('default'/'index'/'custom').

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **Count**
Indicates whether slide count should be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CountTemplate**
Specifies the template for displaying slide count.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

---

### Syntax
```PowerShell
New-HTMLCarousel [[-Slide] <ScriptBlock>] [[-Mode] <String>] [[-Align] <String>] [[-PerView] <Object>] [[-Height] <String>] [[-Margin] <String>] [-Loop] [-Pagination] [[-Speed] <Nullable`1>] [[-MoveBy] <Nullable`1>] [[-StartAt] <Nullable`1>] [-MoveOnClick] [-AutoPlay] [[-AutoPlayEvery] <Nullable`1>] [-AutoPlayRewind] [-AutoPlayPauseOnFocus] [-AutoPlayPauseOnHover] [[-AutoPlaySyncID] <String>] [-DisableArrows] [[-ArrowTemplate] <String[]>] [[-PaginationTemplate] <String>] [-Count] [[-CountTemplate] <String>] [<CommonParameters>]
```
