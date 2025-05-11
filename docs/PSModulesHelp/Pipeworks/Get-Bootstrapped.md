Get-Bootstrapped
----------------

### Synopsis
Downloads a bootstrapper theme

---

### Description

Downloads a bootstrapper theme via the bootstraper builder hosted on Heroku

---

### Related Links
* [http://getbootstrap.com](http://getbootstrap.com)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Bootstrapped
```

---

### Parameters
#### **ForegroundColor**
The foreground color of the theme
|Color
|Default 0248b2

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **BackgroundColor**
The background color of the theme
|Color
|Default fafafa

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **LinkColor**
The color used for links in the theme
|Color
|Default 012456

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **FontFamily**
The fonts to use in the theme
|Default Segoe UI, Arial, sans-serif

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **FontSize**
The font size to use in the theme
|Default 15px

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **LineHeight**
The line height used in the theme.
|Default 21px

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **OutputObject**
If set, will output a property bag containing the settings and the theme. If this is omitted, the theme will be directly returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
The bootstrapper builder was replaced by Bootstrap after version 3.  
If this function continues to work, it is only because they continued to be nice about hosting the tool.

Since this change was made by Bootstrap, the primary option with a Pipeworks site uses a custom less.css page.

---

### Syntax
```PowerShell
Get-Bootstrapped [[-ForegroundColor] <String>] [[-BackgroundColor] <String>] [[-LinkColor] <String>] [[-FontFamily] <String>] [[-FontSize] <String>] [[-LineHeight] <String>] [-OutputObject] [<CommonParameters>]
```
