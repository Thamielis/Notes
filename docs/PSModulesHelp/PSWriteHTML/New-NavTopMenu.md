New-NavTopMenu
--------------

### Synopsis
Creates a new navigation top menu item with customizable options.

---

### Description

The New-NavTopMenu function creates a new navigation top menu item with various customizable options such as icon, name, href, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-NavTopMenu -Name "Home" -Href "/home" -IconBrands "fa fa-home" -IconColor "blue"
Creates a new navigation top menu item named "Home" with a home icon from Font Awesome Brands in blue color.
```
> EXAMPLE 2

```PowerShell
New-NavTopMenu -Name "About" -Href "/about" -IconRegular "fa fa-info-circle" -IconColor "green"
Creates a new navigation top menu item named "About" with an info circle icon from Font Awesome Regular in green color.
```

---

### Parameters
#### **MenuItem**
Specifies the script block defining the menu item properties.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Name**
Specifies the name of the menu item. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Href**
Specifies the URL to navigate to when the menu item is clicked.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InternalPageID**
Specifies the internal page ID associated with the menu item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconColor**
Specifies the color of the icon.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
Specifies the icon for the menu item from the Font Awesome Brands collection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
Specifies the icon for the menu item from the Font Awesome Regular collection.

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
New-NavTopMenu [[-MenuItem] <ScriptBlock>] -Name <String> [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-NavTopMenu [[-MenuItem] <ScriptBlock>] -Name <String> [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconMaterial <String>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <String>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```
```PowerShell
New-NavTopMenu [[-MenuItem] <ScriptBlock>] -Name <String> [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-NavTopMenu [[-MenuItem] <ScriptBlock>] -Name <String> [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconBrands <String>] [<CommonParameters>]
```
