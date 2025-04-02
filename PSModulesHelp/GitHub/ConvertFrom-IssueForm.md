ConvertFrom-IssueForm
---------------------

### Synopsis
Converts the issue form content into a hashtable or object.

---

### Description

Aligns with the issue form content structure and converts it into a hashtable or object.
Section titles become keys and their content becomes values.

---

### Examples
> EXAMPLE 1

@'
### Section 1
Content 1
Content 2
### Section 2
- [ ] Item 1
- [x] Item 2
'@ | ConvertFrom-IssueForm
Section 1            Section 2
---------            ---------
Content 1…           {[Item 2, True], [Item 1, False]}

Converts the issue form content into a hashtable.

---

### Parameters
#### **IssueForm**
The issue form content to parse.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **AsHashtable**
If set, the output will be a hashtable instead of an object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
ConvertFrom-IssueForm [-IssueForm] <String> [-AsHashtable] [<CommonParameters>]
```
