New-RDMEntryDocumentation
-------------------------

### Synopsis
Create a documentation page for an entry

---

### Description

Create a documentation page for an entry. The entry must be fetched by Get-RDMEntry.
    The data source must support the documentation feature and be online. The user must have the rights to edit the documentation.

---

### Related Links
* [Get-RDMEntryDocumentation](Get-RDMEntryDocumentation)

* [Remove-RDMEntryDocumentation](Remove-RDMEntryDocumentation)

* [Set-RDMEntryDocumentation](Set-RDMEntryDocumentation)

---

### Parameters
#### **AsLastPage**
Set the page as the last one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsNewDefault**
Set the page as the new default one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Data**
Content of the documentation page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **InputObject**
Entry where the documentation page will be. Must be already saved.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **Name**
Name of the documentation page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Set**
Save the documentation page on the entry

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Type**
Type of the page. The supported types are Markdown, PlainText, and HTML.
Valid Values:

* Default
* Markdown
* PlainText
* Html

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[DocumentationType]`|true    |2       |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

Entry, obtained from Get-RDMEntry, that will contain the new documentation page.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage

---

### Notes
For more information, type "Get-Help New-RDMEntryDocumentation -detailed". For technical information, type "Get-Help New-RDMEntryDocumentation -full".

---

### Syntax
```PowerShell
New-RDMEntryDocumentation [-InputObject] <PSConnection> [-Type] <HTML | Markdown | PlainText> [-Name] <String> [-Data] <String> [-AsLastPage] [-AsNewDefault] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
