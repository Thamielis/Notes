New-HTMLTab
-----------

### Synopsis
Creates a new HTML tab with customizable content and icons.

---

### Description

The New-HTMLTab function creates a new HTML tab with the specified content, heading, and icon. It supports different parameter sets for FontAwesomeBrands, FontAwesomeRegular, and FontAwesomeSolid icons.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTab -HtmlData { Get-Process } -Heading "Processes" -Name "ProcessTab" -IconBrands "windows"
Creates a new tab displaying the list of processes with a Windows icon.
```
> EXAMPLE 2

```PowerShell
New-HTMLTab -HtmlData { Get-Service } -Heading "Services" -Name "ServiceTab" -IconRegular building
Creates a new tab displaying the list of services with a hard drive icon.
```
> EXAMPLE 3

```PowerShell
New-HTMLTab -HtmlData { Get-EventLog -LogName System } -Heading "System Events" -Name "EventTab" -IconSolid "exclamation-triangle"
Creates a new tab displaying the system events log with an exclamation triangle icon.
```

---

### Parameters
#### **HtmlData**
The HTML content to be displayed within the tab. This should be provided as a ScriptBlock.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Heading**
The heading or title of the tab.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |TabHeading|

#### **Name**
The name of the tab.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |TabName|

#### **IconBrands**
The icon to be displayed for FontAwesomeBrands. Use tab completion to select from available options.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
The icon to be displayed for FontAwesomeRegular. Use tab completion to select from available options.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSolid**
The icon to be displayed for FontAwesomeSolid. Use tab completion to select from available options.

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
New-HTMLTab [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconBrands <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLTab [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconSolid <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLTab [-HtmlData <ScriptBlock>] [-Heading <String>] [-Name <String>] [-IconRegular <String>] [-TextSize <Object>] [-TextColor <String>] [-IconSize <Object>] [-IconColor <String>] [-TextTransform <String>] [-AnchorName <String>] [<CommonParameters>]
```
