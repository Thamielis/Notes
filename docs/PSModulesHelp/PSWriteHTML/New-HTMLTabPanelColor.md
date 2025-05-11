New-HTMLTabPanelColor
---------------------

### Synopsis
Creates a new HTML Tab Panel with customizable colors.

---

### Description

This function allows you to define colors for various elements of an HTML Tab Panel, such as background color, border color, anchor colors, and loader colors.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-HTMLTabPanelColor -BackgrounColor '#f0f0f0' -BorderColor '#cccccc' -AnchorDefaultPrimaryColor '#333333'
```

---

### Parameters
#### **BackgrounColor**
The background color of the tab panel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BorderWidth**
The width of the border. Default is '1px'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BorderStyle**
The style of the border. Choose from: 'solid', 'dotted', 'dashed', 'double', 'groove', 'ridge', 'inset', 'outset', 'none', 'hidden'. Default is 'solid'.
Valid Values:

* solid
* dotted
* dashed
* double
* groove
* ridge
* inset
* outset
* none
* hidden

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **BorderColor**
The color of the border. Default is '#eeeeee'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **AnchorDefaultPrimaryColor**
The primary color of default anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **AnchorDefaultSecondaryColor**
The secondary color of default anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **AnchorActivePrimaryColor**
The primary color of active anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **AnchorActiveSecondaryColor**
The secondary color of active anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **AnchorDisabledPrimaryColor**
The primary color of disabled anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **AnchorDisabledSecondaryColor**
The secondary color of disabled anchor links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **LoaderColor**
The color of the loader.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **LoaderBackgroundColor**
The background color of the loader.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **LoaderBackgroundWrapperColor**
The color of the loader background wrapper.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

---

### Notes
This function allows customization of colors for an HTML Tab Panel.

---

### Syntax
```PowerShell
New-HTMLTabPanelColor [[-BackgrounColor] <String>] [[-BorderWidth] <String>] [[-BorderStyle] <String>] [[-BorderColor] <String>] [[-AnchorDefaultPrimaryColor] <String>] [[-AnchorDefaultSecondaryColor] <String>] [[-AnchorActivePrimaryColor] <String>] [[-AnchorActiveSecondaryColor] <String>] [[-AnchorDisabledPrimaryColor] <String>] [[-AnchorDisabledSecondaryColor] <String>] [[-LoaderColor] <String>] [[-LoaderBackgroundColor] <String>] [[-LoaderBackgroundWrapperColor] <String>] [<CommonParameters>]
```
