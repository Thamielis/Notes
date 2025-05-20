New-PSMDHeader
--------------

### Synopsis
Generates a header wrapping around text.

---

### Description

Generates a header wrapping around text.
The output is an object that contains the configuration options to generate a header.
Use its ToString() method (or cast it to string) to generate the header.

---

### Examples
> EXAMPLE 1

```PowerShell
New-PSMDHeader -Text 'Example'
Will create a header labeled 'Example' that spans the entire screen.
```
> EXAMPLE 2

```PowerShell
New-PSMDHeader -Text 'Example' -Width 80
Will create a header labeled 'Example' with a total width of 80:
 #----------------------------------------------------------------------------#
 #                                  Example                                   #
 #----------------------------------------------------------------------------#
```
> EXAMPLE 3

New-PSMDHeader -Text 'Example' -Width 80 -BorderLeft " |" -BorderRight "| " -CornerLB " \" -CornerLT " /" -CornerRB "/" -CornerRT "\"
Will create a header labeled "Example with a total width of 80 and some custom border lines:
 /----------------------------------------------------------------------------\
 |                                  Example                                   |
 \----------------------------------------------------------------------------/

---

### Parameters
#### **Text**
The text to wrap into a header.
Can handle multiline text.
When passing a list of strings, each string will be wrapped into its own header.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

#### **BorderBottom**
The border used for the bottom of the frame. Use a single letter, such as "-"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderLeft**
The border used for the left side of the frame.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderRight**
The border used for the right side of the frame.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderTop**
The border used for the top of the frame. Use a single letter, such as "-"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CornerLB**
The symbol used for the left-bottom corner of the frame

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CornerLT**
The symbol used for the left-top corner of the frame

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CornerRB**
The symbol used for the right-bottom corner of the frame

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CornerRT**
The symbol used for the right-top corner of the frame

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxWidth**
Whether to align the frame's total width to the window width.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Padding**
Whether the text should be padded.
Only applies to left/right aligned text.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **TextAlignment**
Default: Center
Whether the text should be aligned left, center or right.
Valid Values:

* Left
* Center
* Right

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[TextAlignment]`|false   |named   |false        |

#### **Width**
Total width of the header.
Defaults to entire screen.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-PSMDHeader [-Text] <String[]> [-BorderBottom <String>] [-BorderLeft <String>] [-BorderRight <String>] [-BorderTop <String>] [-CornerLB <String>] [-CornerLT <String>] [-CornerRB <String>] [-CornerRT <String>] [-MaxWidth] [-Padding <Int32>] [-TextAlignment {Left | Center | Right}] [-Width <Int32>] [<CommonParameters>]
```
