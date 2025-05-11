Write-CSS
---------

### Synopsis
Writes CSS styles

---

### Description

Writes CSS style tags, CSS attributes, and links to external stylesheets

---

### Related Links
* [New-WebPage](New-WebPage)

* [Out-HTML](Out-HTML)

* [Write-Link](Write-Link)

---

### Examples
Create a new CSS Style named reallyimportant

```PowerShell
Write-CSS -Name '#ReallyImportant' -Style @{
    "font-size" = "x-large"
    "font-weight"="bold"
}
```
> EXAMPLE 2

```PowerShell
Write-CSS -OutputAttribute -Style @{
    "font-size" = "x-large"
    "font-weight"="bold"
}
```
> EXAMPLE 3

```PowerShell
Write-CSS -ExternalStyleSheet MyStyleSheet.css
```
> EXAMPLE 4

```PowerShell
Write-CSS -Css @{
    "a"=@{
        "font-size"="x-large"
    }
}
```

---

### Parameters
#### **Name**
The name of the css style

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Style**
The css values for a named style or a style attribute

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|true    |2       |true (ByPropertyName)|

#### **Css**
A CSS table, containing nested tables of styles

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|true    |named   |true (ByPropertyName)|

#### **NoStyleTag**
If set, will not output a style tag when outputting a CSS table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ExternalStyleSheet**
A path to an external syle sheet

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|true    |named   |true (ByPropertyName)|

#### **OutputAttribute**
If set, will output the attributes of a style

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-CSS [-Name] <String> [-Style] <Hashtable> [<CommonParameters>]
```
```PowerShell
Write-CSS [-Style] <Hashtable> -OutputAttribute [<CommonParameters>]
```
```PowerShell
Write-CSS -Css <Hashtable> [-NoStyleTag] [<CommonParameters>]
```
```PowerShell
Write-CSS -ExternalStyleSheet <Uri> [<CommonParameters>]
```
