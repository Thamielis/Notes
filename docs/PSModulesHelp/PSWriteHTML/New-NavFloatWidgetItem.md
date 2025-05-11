New-NavFloatWidgetItem
----------------------

### Synopsis
Creates a new navigation float item with specified parameters.

---

### Description

This function creates a new navigation float item with the provided parameters. It allows customization of the item's name, link, icon, color, and other properties.

---

### Examples
> EXAMPLE 1

```PowerShell
New-NavFloatWidgetItem -Name "Home" -Href "https://www.example.com" -IconBrands "fab fa-home" -IconColor "blue"
Creates a new navigation float item named "Home" that links to "https://www.example.com" with a blue home icon.
```
> EXAMPLE 2

```PowerShell
New-NavFloatWidgetItem -Name "About" -InternalPageID "about" -LinkHome
Creates a new navigation float item named "About" that links to the internal page with ID "about" and links to the home page.
```

---

### Parameters
#### **Name**
Specifies the name of the navigation float item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Href**
Specifies the URL link for the navigation float item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InternalPageID**
Specifies the internal page ID for the navigation float item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LinkHome**
Indicates whether the navigation float item should link to the home page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IconColor**
Specifies the color of the icon for the navigation float item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
Specifies the icon brand for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeBrands.Keys).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
Specifies the regular icon for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeRegular.Keys).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSolid**
ICON SOLID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconMaterial**
FontsMaterialIcon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Spinning**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SpinningReverse**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Bordered**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BorderedCircle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PullLeft**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PullRight**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Rotate**

Valid Values:

* 90
* 180
* 270

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FlipVertical**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FlipHorizontal**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-NavFloatWidgetItem -Name <String> [-Href <String>] [-InternalPageID <String>] [-LinkHome] [-IconColor <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-NavFloatWidgetItem -Name <String> [-Href <String>] [-InternalPageID <String>] [-LinkHome] [-IconColor <String>] [-IconMaterial <String>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <String>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```
```PowerShell
New-NavFloatWidgetItem -Name <String> [-Href <String>] [-InternalPageID <String>] [-LinkHome] [-IconColor <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-NavFloatWidgetItem -Name <String> [-Href <String>] [-InternalPageID <String>] [-LinkHome] [-IconColor <String>] [-IconBrands <String>] [<CommonParameters>]
```
