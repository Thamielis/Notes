New-HTMLFrame
-------------

### Synopsis
Allows to inline other HTML files into the current HTML file.

---

### Description

Allows to inline other HTML files into the current HTML file. This can be useful if we want to display content from another file.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML {
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto -Height 1500px
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-Maps\Example-Maps.html"
    } -HeaderText 'Test' -Height 100vh
} -Online -TitleText 'Test Inline' -ShowHTML -FilePath "$PSScriptRoot\Example-InlineHTML01.html" -AddComment
```

---

### Parameters
#### **Id**
ID of the HTML element. By default it's auto-generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Name**
Name of the HTML element. By default it's empty.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **SourcePath**
Path to a file with HTML file to display within iFrame

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Scrolling**
The HTML <iframe> scrolling Attribute is used to specify that whether the scrollbar will be displayed or not in the <Iframe> Element. Basically the scrollbar is used when the content is large than the Iframe Element.
Available options are:
* auto: It has a default value. The scrollbar appears when needed.
* yes: This value shows the scrollbar in the Iframe Element.
* no: This value does not show the scrollbar in the Iframe Element.
Valid Values:

* No
* Yes
* Auto

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Height**
Set the height of the iFrame to static value. This should be used when not using iFrameResizer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **FrameBorder**
Set the frameborder attribute of the <iframe> element. This attribute specifies whether the frame should have a border. The default value is 0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **UseiFrameResizer**
Forces HTML inline feature to use iFrameResizer instead of native functionality. For fully functional feature it requires modifying the source HTML file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableLogging**
Enable logging to Console for debugging purposes when using iFrameResizer (requires UseiFrameResizer).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLFrame [[-Id] <String>] [[-Name] <String>] [[-SourcePath] <String>] [[-Scrolling] <String>] [[-Height] <Object>] [[-FrameBorder] <Object>] [-UseiFrameResizer] [-EnableLogging] [<CommonParameters>]
```
