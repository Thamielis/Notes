New-HTMLTimelineItem
--------------------

### Synopsis
Creates a new HTML timeline item with specified date, heading text, content text, and color.

---

### Description

This function generates an HTML timeline item with the provided information. It allows customization of the date, heading text, content text, and color of the timeline item.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTimelineItem -Date "2022-01-01" -HeadingText "Project Kickoff" -Text "Started the project development phase." -Color "Blue"
Creates a timeline item with a specific date, heading, content, and color.
```
> EXAMPLE 2

```PowerShell
New-HTMLTimelineItem -HeadingText "Meeting with Client" -Text "Discussed project requirements." -Color "Green"
Creates a timeline item with the current date, specified heading, content, and color.
```

---

### Parameters
#### **Date**
Specifies the date for the timeline item. Defaults to the current date if not specified.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |1       |false        |

#### **HeadingText**
Specifies the heading text for the timeline item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Text**
Specifies the content text for the timeline item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Color**
Specifies the color of the timeline item. If not provided, the default color is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Syntax
```PowerShell
New-HTMLTimelineItem [[-Date] <DateTime>] [[-HeadingText] <String>] [[-Text] <String>] [[-Color] <String>] [<CommonParameters>]
```
