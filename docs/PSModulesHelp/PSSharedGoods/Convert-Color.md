Convert-Color
-------------

### Synopsis
This color converter gives you the hexadecimal values of your RGB colors and vice versa (RGB to HEX)

---

### Description

This color converter gives you the hexadecimal values of your RGB colors and vice versa (RGB to HEX). Use it to convert your colors and prepare your graphics and HTML web pages.

---

### Examples
> EXAMPLE 1

```PowerShell
.\convert-color -hex FFFFFF
Converts hex value FFFFFF to RGB
```
> EXAMPLE 2

```PowerShell
.\convert-color -RGB 123,200,255
Converts Red = 123 Green = 200 Blue = 255 to Hex value
```

---

### Parameters
#### **RGB**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **HEX**
Enter the Hex value to be converted. Do not use the '#' symbol. (Ex: 3333CC converts to Red: 51 Green: 51 Blue: 204)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Convert-Color [[-RGB] <Object>] [<CommonParameters>]
```
```PowerShell
Convert-Color [[-HEX] <String>] [<CommonParameters>]
```
