New-HTMLWizardColor
-------------------

### Synopsis
Creates a new HTML Wizard Color configuration.

---

### Description

This function creates a new HTML Wizard Color configuration with customizable color settings for various elements in the wizard interface.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLWizardColor -BorderColor "#FF0000" -ToolbarBtnColor "#00FF00" -ToolbarBtnBackgroundColor "#0000FF"
Creates a new HTML Wizard Color configuration with specified border, toolbar button text, and toolbar button background colors.
```

---

### Parameters
#### **BorderColor**
Specifies the color for the border of the wizard interface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ToolbarBtnColor**
Specifies the color for the toolbar button text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ToolbarBtnBackgroundColor**
Specifies the background color for the toolbar buttons.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **AnchorDefaultPrimaryColor**
Specifies the primary color for default anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **AnchorDefaultSecondaryColor**
Specifies the secondary color for default anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **AnchorActivePrimaryColor**
Specifies the primary color for active anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **AnchorActiveSecondaryColor**
Specifies the secondary color for active anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **AnchorDonePrimaryColor**
Specifies the primary color for completed anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **AnchorDoneSecondaryColor**
Specifies the secondary color for completed anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **AnchorDisabledPrimaryColor**
Specifies the primary color for disabled anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **AnchorDisabledSecondaryColor**
Specifies the secondary color for disabled anchor elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **AnchorErrorPrimaryColor**
Specifies the primary color for anchor elements in error state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **AnchorErrorSecondaryColor**
Specifies the secondary color for anchor elements in error state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **AnchorWarningPrimaryColor**
Specifies the primary color for anchor elements in warning state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **AnchorWarningSecondaryColor**
Specifies the secondary color for anchor elements in warning state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **ProgressColor**
Specifies the color for the progress indicator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **ProgressBackgroundColor**
Specifies the background color for the progress indicator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |17      |false        |

#### **LoaderColor**
Specifies the color for the loader animation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |18      |false        |

#### **LoaderBackgroundColor**
Specifies the background color for the loader animation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **LoaderBackgroundWrapperColor**
Specifies the background color for the loader animation wrapper.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |20      |false        |

---

### Syntax
```PowerShell
New-HTMLWizardColor [[-BorderColor] <String>] [[-ToolbarBtnColor] <String>] [[-ToolbarBtnBackgroundColor] <String>] [[-AnchorDefaultPrimaryColor] <String>] [[-AnchorDefaultSecondaryColor] <String>] [[-AnchorActivePrimaryColor] <String>] [[-AnchorActiveSecondaryColor] <String>] [[-AnchorDonePrimaryColor] <String>] [[-AnchorDoneSecondaryColor] <String>] [[-AnchorDisabledPrimaryColor] <String>] [[-AnchorDisabledSecondaryColor] <String>] [[-AnchorErrorPrimaryColor] <String>] [[-AnchorErrorSecondaryColor] <String>] [[-AnchorWarningPrimaryColor] <String>] [[-AnchorWarningSecondaryColor] <String>] [[-ProgressColor] <String>] [[-ProgressBackgroundColor] <String>] [[-LoaderColor] <String>] [[-LoaderBackgroundColor] <String>] [[-LoaderBackgroundWrapperColor] <String>] [<CommonParameters>]
```
