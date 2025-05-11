Merge-JaCoCoReport
------------------

### Synopsis
Merge two JaCoCoReports into one.

---

### Description

When you run tests independently for the same module, you may want to
get a unified report of all the code paths that were tested.
For instance, you want to get a unified report when the runs
where done on Linux and Windows.

This function helps merge the results of two runs into one file.
If you have more than two reports, keep merging them.

---

### Examples
> EXAMPLE 1

```PowerShell
Merge-JaCoCoReport -OriginalDocument 'C:\src\MyModule\Output\JaCoCoRun_linux.xml' -MergeDocument 'C:\src\MyModule\Output\JaCoCoRun_windows.xml'
```

---

### Parameters
#### **OriginalDocument**
One of the JaCoCoReports you would like to merge.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[XmlDocument]`|true    |1       |false        |

#### **MergeDocument**
Second JaCoCoReports you would like to merge with the other one.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[XmlDocument]`|true    |2       |false        |

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Notes
See also Update-JaCoCoStatistic that will update the counter elements.
Thanks to Yorick (@ykuijs) for this great feature!

---

### Syntax
```PowerShell
Merge-JaCoCoReport [-OriginalDocument] <XmlDocument> [-MergeDocument] <XmlDocument> [<CommonParameters>]
```
