New-HTMLLogo
------------

### Synopsis
Creates a new HTML logo with specified parameters.

---

### Description

This function creates a new HTML logo using the provided parameters. It allows customization of the left and right logo names, strings, and the option to hide logos.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLLogo -LogoPath "C:\Logos\logo.png" -LeftLogoName "CompanyA" -RightLogoName "CompanyB" -LeftLogoString "Company A Logo" -RightLogoString "Company B Logo"
Creates a new HTML logo with custom left and right logo names and strings.
```
> EXAMPLE 2

```PowerShell
New-HTMLLogo -LogoPath "C:\Logos\logo.png" -HideLogos
Creates a new HTML logo with logos hidden.
```

---

### Parameters
#### **LogoPath**
The path to the logo.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **LeftLogoName**
The name of the left logo. Default is "Sample".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RightLogoName**
The name of the right logo. Default is "Alternate".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **LeftLogoString**
The string for the left logo.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **RightLogoString**
The string for the right logo.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **HideLogos**
Switch parameter to hide logos.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLLogo [[-LogoPath] <String>] [[-LeftLogoName] <String>] [[-RightLogoName] <String>] [[-LeftLogoString] <String>] [[-RightLogoString] <String>] [-HideLogos] [<CommonParameters>]
```
