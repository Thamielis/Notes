New-HTMLNavFloat
----------------

### Synopsis
Creates a new HTML floating navigation menu with customizable options.

---

### Description

This function creates a new HTML floating navigation menu with various customization options such as navigation links, title, tagline, colors, and button styling for hover effects.

---

### Parameters
#### **NavigationLinks**
Specifies the script block containing navigation links to be displayed in the menu.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
Specifies the title of the floating navigation menu.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Tagline**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |3       |false        |SubTitle|

#### **TitleColor**
Specifies the color of the title text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TaglineColor**
Specifies the color of the tagline text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ButtonLocationTop**
Specifies the top position of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **ButtonLocationLeft**
Specifies the left position of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **ButtonLocationRight**
Specifies the right position of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **ButtonLocationBottom**
Specifies the bottom position of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **ButtonColor**
Specifies the color of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **ButtonColorBackground**
Specifies the background color of the floating navigation menu button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **ButtonColorOnHover**
Specifies the color of the floating navigation menu button on hover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **ButtonColorBackgroundOnHover**
Specifies the background color of the floating navigation menu button on hover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

---

### Syntax
```PowerShell
New-HTMLNavFloat [[-NavigationLinks] <ScriptBlock>] [[-Title] <String>] [[-Tagline] <String>] [[-TitleColor] <String>] [[-TaglineColor] <String>] [[-ButtonLocationTop] <Object>] [[-ButtonLocationLeft] <Object>] [[-ButtonLocationRight] <Object>] [[-ButtonLocationBottom] <Object>] [[-ButtonColor] <String>] [[-ButtonColorBackground] <String>] [[-ButtonColorOnHover] <String>] [[-ButtonColorBackgroundOnHover] <String>] [<CommonParameters>]
```
