New-HTMLWizardStep
------------------

### Synopsis
Creates a new HTML wizard step with customizable options.

---

### Description

This function creates a new HTML wizard step with various customization options such as setting the HTML data, tab heading, tab name, and icons.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\example.html" } -Heading "Step 1" -Name "First Tab" -IconBrands "fa fa-facebook"
Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Brands icon.
```
> EXAMPLE 2

```PowerShell
New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\another.html" } -Heading "Step 2" -Name "Second Tab" -IconRegular "fa fa-github"
Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Regular icon.
```

---

### Parameters
#### **HtmlData**
Specifies the HTML data to be displayed in the wizard step.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Heading**
Specifies the heading text for the tab.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |TabHeading|

#### **Name**
Specifies the name of the tab.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |TabName|

#### **IconBrands**
Specifies the icon for the tab from the FontAwesome Brands collection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
Specifies the icon for the tab from the FontAwesome Regular collection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSolid**
Specifies the icon for the tab from the FontAwesome Solid collection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **TextColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **IconColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AnchorName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLWizardStep [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconBrands <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLWizardStep [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconSolid <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLWizardStep [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconRegular <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
