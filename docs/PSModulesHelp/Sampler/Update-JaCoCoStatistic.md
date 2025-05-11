Update-JaCoCoStatistic
----------------------

### Synopsis
Update the Statistics of a freshly merged JaCoCoReports.

---

### Description

When you merge two or several JaCoCoReports together
using the Merge-JaCoCoReport, the calculated statistics
of the Original document are not updated.

This Command will re-calculate the JaCoCo statistics and
update the Document.

For the Package, Class, Method of all source files and the total it will update:
- the Instruction Covered
- the Instruction Missed
- the Line Covered
- the Line Missed
- the Method Covered
- the Method Missed
- the Class Covered
- the Class Missed

---

### Examples
> EXAMPLE 1

```PowerShell
Update-JaCoCoStatistic -Document (Merge-JaCoCoReport $file1 $file2)
```

---

### Parameters
#### **Document**
JaCoCo report XML document that needs its statistics recalculated.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[XmlDocument]`|true    |1       |false        |

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Notes
See also Merge-JaCoCoReport
Thanks to Yorick (@ykuijs) for this great feature!

---

### Syntax
```PowerShell
Update-JaCoCoStatistic [-Document] <XmlDocument> [<CommonParameters>]
```
