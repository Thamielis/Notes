Get-GitHubOutput
----------------

### Synopsis
Gets the GitHub output.

---

### Description

Gets the GitHub output from $env:GITHUB_OUTPUT and creates an object with key-value pairs, supporting both single-line and multi-line values

---

### Examples
> EXAMPLE 1

Get-GitHubOutput
MY_VALUE         result                       zen
--------         ------                       ---
qwe…             @{"MyOutput":"Hello, World!"} something else
Gets the GitHub output and returns an object with key-value pairs.
> EXAMPLE 2

Get-GitHubOutput -AsHashtable
Name                           Value
----                           -----
MyArray                        1 2 3
MyOutput                       Hello, World!
zen                            something else
result                         {[thisisatest, a simple value]}
mystuff                        {[MyOutput, Hello, World!]}
MY_VALUE                       qwe…

Gets the GitHub output and returns a hashtable.

---

### Parameters
#### **AsHashtable**
Returns the output as a hashtable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Path**
The path to the GitHub output file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Get-GitHubOutput [-AsHashtable] [[-Path] <String>] [<CommonParameters>]
```
