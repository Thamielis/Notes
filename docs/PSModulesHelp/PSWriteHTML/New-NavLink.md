New-NavLink
-----------

### Synopsis
Creates a new navigation link with customizable options for nested links.

---

### Description

The New-NavLink function creates a new navigation link with various customizable options such as nested links, name, name color, href, internal page ID, and icon color.

---

### Examples
> EXAMPLE 1

```PowerShell
New-NavLink -NestedLinks { New-NavLink -Name "Sublink 1" -Href "/sublink1" } -Name "Main Link" -NameColor "blue" -Href "/mainlink" -InternalPageID "main" -IconColor "green"
Creates a new navigation link named "Main Link" with a nested link named "Sublink 1" in blue name color, green icon color, navigating to "/mainlink" with internal page ID "main".
```
> EXAMPLE 2

```PowerShell
New-NavLink -NestedLinks { New-NavLink -Name "Sublink 2" -Href "/sublink2" } -Name "Another Link" -NameColor "red" -Href "/anotherlink" -InternalPageID "another" -IconColor "yellow"
Creates a new navigation link named "Another Link" with a nested link named "Sublink 2" in red name color, yellow icon color, navigating to "/anotherlink" with internal page ID "another".
```

---

### Parameters
#### **NestedLinks**
Specifies the script block defining the nested link properties.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Name**
Specifies the name of the navigation link. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **NameColor**
Specifies the color of the navigation link name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Href**
Specifies the URL to navigate to when the navigation link is clicked.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InternalPageID**
Specifies the internal page ID associated with the navigation link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconColor**
Specifies the color of the icon for the navigation link.

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
New-NavLink [[-NestedLinks] <ScriptBlock>] -Name <String> [-NameColor <String>] [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-NavLink [[-NestedLinks] <ScriptBlock>] -Name <String> [-NameColor <String>] [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconMaterial <String>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <String>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```
```PowerShell
New-NavLink [[-NestedLinks] <ScriptBlock>] -Name <String> [-NameColor <String>] [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-NavLink [[-NestedLinks] <ScriptBlock>] -Name <String> [-NameColor <String>] [-Href <String>] [-InternalPageID <String>] [-IconColor <String>] [-IconBrands <String>] [<CommonParameters>]
```
