New-NavItem
-----------

### Synopsis
Creates a new navigation item with specified parameters.

---

### Description

The New-NavItem function creates a new navigation item with the specified parameters, such as name, href, type, icon, and color.

---

### Examples
> EXAMPLE 1

```PowerShell
New-NavItem -Name "Home" -Href "/" -Type "Menu" -IconBrands "fa fa-home" -IconColor "blue"
Creates a new navigation item named "Home" with a link to the root ("/"), type "Menu", using a home icon from FontAwesome Brands with blue color.
```
> EXAMPLE 2

```PowerShell
New-NavItem -Name "About" -Href "/about" -Type "Grid" -IconRegular "far fa-address-card" -IconColor "green"
Creates a new navigation item named "About" with a link to "/about", type "Grid", using an address card icon from FontAwesome Regular with green color.
```
> EXAMPLE 3

```PowerShell
New-NavItem -Name "Contact" -Href "/contact" -Type "Menu" -FontMaterial "person" -IconColor "red"
Creates a new navigation item named "Contact" with a link to "/contact", type "Menu", using a person icon from Material Design Icons with red color.
```

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Text   |

#### **Href**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InternalPageID**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**

Valid Values:

* Grid
* Menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **IconColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
ICON BRANDS

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
ICON REGULAR

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
New-NavItem [-Name <String>] [-Href <String>] [-InternalPageID <String>] -Type <String> [-IconColor <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-NavItem [-Name <String>] [-Href <String>] [-InternalPageID <String>] -Type <String> [-IconColor <String>] [-IconMaterial <String>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <String>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```
```PowerShell
New-NavItem [-Name <String>] [-Href <String>] [-InternalPageID <String>] -Type <String> [-IconColor <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-NavItem [-Name <String>] [-Href <String>] [-InternalPageID <String>] -Type <String> [-IconColor <String>] [-IconBrands <String>] [<CommonParameters>]
```
