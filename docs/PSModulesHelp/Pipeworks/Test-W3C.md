Test-W3C
--------

### Synopsis
Tests compliance with the W3C standards

---

### Description

Validates a page's HTML5 compliance with the W3CValidator

---

### Related Links
* [Get-Web](Get-Web)

* [http://validator.w3.org/](http://validator.w3.org/)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-W3C "http://powershellpipeworks.com"
```

---

### Parameters
#### **Url**
The URL you'd like to validate

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|true    |1       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Test-W3C [-Url] <Uri> [<CommonParameters>]
```
