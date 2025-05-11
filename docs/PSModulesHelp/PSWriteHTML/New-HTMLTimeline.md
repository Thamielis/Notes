New-HTMLTimeline
----------------

### Synopsis
Creates a new HTML timeline with customizable content.

---

### Description

This function creates an HTML timeline with the specified content. The timeline can be used to display a sequence of events or steps in a visually appealing manner.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTimeline -Content {
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 1" }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 2" }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 3" }
}
Creates an HTML timeline with three events.
```

---

### Parameters
#### **Content**
Specifies the content of the HTML timeline as a script block.

|Type           |Required|Position|PipelineInput|Aliases      |
|---------------|--------|--------|-------------|-------------|
|`[ScriptBlock]`|false   |1       |false        |TimeLineItems|

---

### Syntax
```PowerShell
New-HTMLTimeline [[-Content] <ScriptBlock>] [<CommonParameters>]
```
