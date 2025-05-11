New-HTMLPanelStyle
------------------

### Synopsis
Creates a new HTML panel style with customizable options.

---

### Description

This function creates a new HTML panel style with the ability to set the border radius, remove shadow, and request configuration settings.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLPanelStyle -BorderRadius '10px' -RemoveShadow
Creates a new HTML panel style with a border radius of 10px and removes the shadow.
```
> EXAMPLE 2

```PowerShell
New-HTMLPanelStyle -BorderRadius '15px' -RequestConfiguration
Creates a new HTML panel style with a border radius of 15px and requests the configuration settings.
```

---

### Parameters
#### **BorderRadius**
Specifies the border radius for the HTML panel. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.
Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoveShadow**
Indicates whether to remove the shadow from the HTML panel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RequestConfiguration**
Specifies whether to request the configuration settings for the HTML panel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
File Name      : New-HTMLPanelStyle.ps1
Prerequisite   : This function requires the Get-ConfigurationCss and related functions.

---

### Syntax
```PowerShell
New-HTMLPanelStyle [-BorderRadius <String>] [-RemoveShadow] [-RequestConfiguration] [<CommonParameters>]
```
