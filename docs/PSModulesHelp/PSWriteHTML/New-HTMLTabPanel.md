New-HTMLTabPanel
----------------

### Synopsis
Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

---

### Description

Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **Tabs**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Orientation**
Nav menu orientation. Default value is 'horizontal'.
Valid Values:

* horizontal
* vertical

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **DisableJustification**
Disable navigation menu justification

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableBackButtonSupport**
Disable the back button support

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableURLhash**
Disable selection of the tab based on url hash

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransitionAnimation**
Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
Valid Values:

* none
* fade
* slide-horizontal
* slide-vertical
* slide-swing

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TransitionSpeed**
Transion animation speed. Default 400

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **AutoProgress**
Enables auto navigation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoProgressInterval**
Auto navigate Interval (used only if "autoProgress" is enabled). Default 3500

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **DisableAutoProgressStopOnFocus**
Disable stop auto navigation on focus and resume on outfocus (used only if "autoProgress" is enabled)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Theme**

Valid Values:

* basic
* elite
* pills
* brick
* forge
* blocks

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Notes
Implementation based on: http://techlaboratory.net/jquery-smarttab
License: MIT

---

### Syntax
```PowerShell
New-HTMLTabPanel [[-Tabs] <ScriptBlock>] [[-Orientation] <String>] [-DisableJustification] [-DisableBackButtonSupport] [-DisableURLhash] [[-TransitionAnimation] <String>] [[-TransitionSpeed] <Int32>] [-AutoProgress] [[-AutoProgressInterval] <Int32>] [-DisableAutoProgressStopOnFocus] [[-Theme] <Object>] [<CommonParameters>]
```
