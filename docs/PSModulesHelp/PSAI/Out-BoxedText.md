Out-BoxedText
-------------

### Synopsis
Displays text inside a boxed frame with optional title.

---

### Description

This function displays the provided text inside a boxed frame with an optional title. 
The box and title are displayed in the specified box color, while the text is displayed in the specified text color.

It handles text wrapping to ensure the box is drawn correctly around the wrapped text.

---

### Examples
> EXAMPLE 1

```PowerShell
Out-BoxedText -Text "Paris" -Title "Agent" -BoxColor DarkBlue -TextColor White
```
> EXAMPLE 2

```PowerShell
Out-BoxedText -Text "Follow up, Enter to copy & quit, Ctrl+C to quit." -Title "Next Steps" -BoxColor Cyan -TextColor Yellow
```
> EXAMPLE 3

```PowerShell
Out-BoxedText -Text "Copied to clipboard." -Title "Information" -BoxColor Green -TextColor Black
```

---

### Parameters
#### **Text**
The text to be displayed inside the box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Title**
The optional title to be displayed at the top of the box.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BoxColor**
The color of the box and title. Default is White.
Valid Values:

* Black
* DarkBlue
* DarkGreen
* DarkCyan
* DarkRed
* DarkMagenta
* DarkYellow
* Gray
* DarkGray
* Blue
* Green
* Cyan
* Red
* Magenta
* Yellow
* White

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ConsoleColor]`|false   |3       |false        |

#### **TextColor**
The color of the text inside the box. Default is Gray.
Valid Values:

* Black
* DarkBlue
* DarkGreen
* DarkCyan
* DarkRed
* DarkMagenta
* DarkYellow
* Gray
* DarkGray
* Blue
* Green
* Cyan
* Red
* Magenta
* Yellow
* White

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ConsoleColor]`|false   |4       |false        |

#### **MaxWidth**
The maximum width for the text wrapping and box. Default is 80.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

---

### Syntax
```PowerShell
Out-BoxedText [-Text] <String> [[-Title] <String>] [[-BoxColor] {Black | DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow | Gray | DarkGray | Blue | Green | Cyan | Red | Magenta | Yellow | White}] [[-TextColor] {Black | DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow | Gray | DarkGray | Blue | Green | Cyan | Red | Magenta | Yellow | White}] [[-MaxWidth] <Int32>] [<CommonParameters>]
```
