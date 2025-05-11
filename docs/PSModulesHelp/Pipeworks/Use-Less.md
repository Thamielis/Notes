Use-Less
--------

### Synopsis
Creates a .CSS file from a .LESS file

---

### Description

Uses DotLess to create a .CSS file from a .LESS file.

---

### Related Links
* [http://lesscss.org/](http://lesscss.org/)

* [http://www.dotlesscss.org/](http://www.dotlesscss.org/)

---

### Examples
> EXAMPLE 1

```PowerShell
Use-Less -LessCss ".example {width: 10 + 10 px}"
```

---

### Parameters
#### **LessCss**
The Less CSS content.  To learn how to use LessCSS, visit the [LessCSS website](http://lesscss.org/)
|LinesForInput 50

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Option**
If provided, will change variables in the LESS CSS file prior to compiling it.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |2       |true (ByPropertyName)|

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Use-Less [-LessCss] <String> [[-Option] <Hashtable>] [<CommonParameters>]
```
