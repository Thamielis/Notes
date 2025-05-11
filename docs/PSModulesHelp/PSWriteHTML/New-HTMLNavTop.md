New-HTMLNavTop
--------------

### Synopsis
Creates a top navigation bar in HTML format with customizable options.

---

### Description

This function generates a top navigation bar in HTML format with customizable options such as navigation links, logo, colors, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLNavTop -NavigationLinks { 
    "Link 1", "Link 2", "Link 3" 
} -Logo "logo.png" -LogoLink "https://example.com" -LogoLinkHome -MenuItemsWidth '250px' -MenuColor 'Blue' -MenuColorBackground 'White' -HomeColor 'Red' -HomeColorBackground 'White' -HomeLink "https://example.com/home" -HomeLinkHome
Creates a top navigation bar with specified navigation links, logo, colors, and home link.
```

---

### Parameters
#### **NavigationLinks**
Specifies the script block containing the navigation links to be displayed.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Logo**
Specifies the path to the logo image.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **LogoLink**
Specifies the URL to link the logo to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **LogoLinkHome**
Indicates whether the logo should link to the home page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MenuItemsWidth**
Specifies the width of the menu items.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **MenuColor**
Specifies the color of the menu text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **MenuColorBackground**
Specifies the background color of the menu.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **HomeColor**
Specifies the color of the home link text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **HomeColorBackground**
Specifies the background color of the home link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **HomeLink**
Specifies the URL for the home link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **HomeLinkHome**
Indicates whether the home link should link to the home page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Convert**
Switch parameter to indicate if conversion is needed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLNavTop [[-NavigationLinks] <ScriptBlock>] [[-Logo] <String>] [[-LogoLink] <String>] [-LogoLinkHome] [[-MenuItemsWidth] <Object>] [[-MenuColor] <String>] [[-MenuColorBackground] <String>] [[-HomeColor] <String>] [[-HomeColorBackground] <String>] [[-HomeLink] <String>] [-HomeLinkHome] [-Convert] [<CommonParameters>]
```
