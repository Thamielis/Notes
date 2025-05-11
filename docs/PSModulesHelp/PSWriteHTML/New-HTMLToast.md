New-HTMLToast
-------------

### Synopsis
Creates a new HTML toast notification with customizable text, icons, and colors.

---

### Description

This function generates an HTML toast notification with options to set the text, text colors, icons, icon size, and various color settings for different elements of the notification.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLToast -TextHeader "Notification" -Text "This is a sample notification" -IconBrands "fa-github" -BarColorRight "Red"
Creates a new HTML toast notification with a header "Notification", main text "This is a sample notification", GitHub icon, and a red color for the right bar.
```
> EXAMPLE 2

```PowerShell
New-HTMLToast -TextHeader "Alert" -Text "Alert message here" -IconBrands "fa-exclamation-triangle" -IconColor "Orange" -BarColorLeft "Yellow" -BarColorRight "Red"
Creates a new HTML toast notification with a header "Alert", main text "Alert message here", warning triangle icon in orange color, yellow left bar, and red right bar.
```

---

### Parameters
#### **TextHeader**
Specifies the header text of the notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextHeaderColor**
Specifies the color of the header text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Text**
Specifies the main text content of the notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextColor**
Specifies the color of the main text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSize**
Specifies the size of the icon in pixels.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IconColor**
Specifies the color of the icon.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BarColorLeft**
Specifies the color of the left bar in the notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BarColorRight**
Specifies the color of the right bar in the notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
Specifies the icon to be used from the Font Awesome Brands collection.

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

---

### Syntax
```PowerShell
New-HTMLToast [-TextHeader <String>] [-TextHeaderColor <String>] [-Text <String>] [-TextColor <String>] [-IconSize <Int32>] [-IconColor <String>] [-BarColorLeft <String>] [-BarColorRight <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLToast [-TextHeader <String>] [-TextHeaderColor <String>] [-Text <String>] [-TextColor <String>] [-IconSize <Int32>] [-IconColor <String>] [-BarColorLeft <String>] [-BarColorRight <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLToast [-TextHeader <String>] [-TextHeaderColor <String>] [-Text <String>] [-TextColor <String>] [-IconSize <Int32>] [-IconColor <String>] [-BarColorLeft <String>] [-BarColorRight <String>] [-IconBrands <String>] [<CommonParameters>]
```
