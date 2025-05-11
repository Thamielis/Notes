New-HTMLQRCode
--------------

### Synopsis
Creates an HTML QR code with specified parameters.

---

### Description

This function generates an HTML QR code based on the provided parameters. It allows customization of the QR code appearance and content.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLQRCode -Link "https://example.com" -Width 200 -Height 200 -Title "Example QR Code" -TitleColor "black" -Logo "C:\logo.png" -LogoWidth 50 -LogoHeight 50 -LogoInline
Creates a QR code with a specified link, dimensions, title, color, and logo embedded inline.
```
> EXAMPLE 2

```PowerShell
New-HTMLQRCode -Link "tel:1234567890" -Width 150 -Height 150 -Title "Contact Number" -TitleColor "blue" -Logo "C:\company_logo.png" -LogoWidth 30 -LogoHeight 30
Generates a QR code for a phone number with custom dimensions, title, color, and logo.
```

---

### Parameters
#### **Link**
The link or content to be encoded in the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Width**
The width of the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Height**
The height of the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Title**
The title or alt text for the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TitleColor**
The color of the title text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Logo**
The path to the logo image to be embedded in the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **LogoWidth**
The width of the logo image.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **LogoHeight**
The height of the logo image.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **LogoInline**
Indicates whether the logo should be embedded inline in the QR code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLQRCode [[-Link] <String>] [[-Width] <Object>] [[-Height] <Object>] [[-Title] <String>] [[-TitleColor] <String>] [[-Logo] <String>] [[-LogoWidth] <Object>] [[-LogoHeight] <Object>] [-LogoInline] [<CommonParameters>]
```
