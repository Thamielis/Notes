New-HTMLNav
-----------

### Synopsis
Creates a new HTML navigation menu with customizable options.

---

### Description

This function creates a new HTML navigation menu with various customization options such as navigation links, logo, colors, and menu settings.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLNav -NavigationLinks { 'Home', 'About', 'Services' } -Logo 'logo.png' -LogoLink 'https://example.com' -TopBarBackGroundColor 'blue' -TopBarColor 'white' -LeftMenuBackgroundColor 'black' -LeftMenuColor 'white'
Creates a new HTML navigation menu with specified navigation links and custom logo, colors, and menu settings.
```

---

### Parameters
#### **NavigationLinks**
Specifies the script block containing navigation links to be displayed in the menu.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Logo**
Specifies the path to the logo image to be displayed in the menu.

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

#### **DisableBackgroundFading**
Switch to disable background fading when the side navigation drawer is open.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableClickToClose**
Switch to disable closing opened items when the user clicks outside of them.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableNavControls**
Switch to disable navigation controls for adjusting drawer width and height.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableStickyMenubar**
Switch to make the menubar static instead of sticky.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **StartMenuOpen**
Switch to determine if the menu should start open.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FixedMenu**
Switch to make the menu fixed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableHamburger**
Switch to disable the hamburger menu icon.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ResizeContent**
Switch to enable content resizing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MenuWidth**
Specifies the width of the menu (default is 270).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **MenuWidthExtended**
Specifies the extended width of the menu (default is 320).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **TopBarBackGroundColor**
Specifies the background color of the top bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **TopBarColor**
Specifies the text color of the top bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **LeftMenuBackgroundColor**
Specifies the background color of the left menu.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **LeftMenuColor**
Specifies the text color of the left menu.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Syntax
```PowerShell
New-HTMLNav [[-NavigationLinks] <ScriptBlock>] [[-Logo] <String>] [[-LogoLink] <String>] [-LogoLinkHome] [-DisableBackgroundFading] [-DisableClickToClose] [-DisableNavControls] [-DisableStickyMenubar] [-StartMenuOpen] [-FixedMenu] [-DisableHamburger] [-ResizeContent] [[-MenuWidth] <Int32>] [[-MenuWidthExtended] <Int32>] [[-TopBarBackGroundColor] <String>] [[-TopBarColor] <String>] [[-LeftMenuBackgroundColor] <String>] [[-LeftMenuColor] <String>] [<CommonParameters>]
```
