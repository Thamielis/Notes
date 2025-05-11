Invoke-GPOZaurrSupport
----------------------

### Synopsis
Invokes GPOZaurrSupport function to retrieve Group Policy information.

---

### Description

This function retrieves Group Policy information using either HTML, XML, or Object format. It can be run locally or on a remote computer.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GPOZaurrSupport -Type HTML -ComputerName "RemoteComputer" -UserName "Admin" -Path "C:\Temp\GPOReport.html"
Retrieves Group Policy information in HTML format from a remote computer and saves it to a specified path.
```
> EXAMPLE 2

```PowerShell
Invoke-GPOZaurrSupport -Type XML -Path "C:\Temp\GPOReport.xml" -Online
Retrieves the latest Group Policy information in XML format and saves it to a specified path.
```

---

### Parameters
#### **Type**
Specifies the type of output format. Valid values are 'NativeHTML', 'HTML', 'XML', or 'Object'. Default is 'HTML'.
Valid Values:

* NativeHTML
* HTML
* XML
* Object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ComputerName**
Specifies the name of the remote computer to retrieve Group Policy information from.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Server |

#### **UserName**
Specifies the username to run the function as on the remote computer.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |3       |false        |User   |

#### **Path**
Specifies the path to save the output file. If not provided, a temporary file will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Splitter**
Specifies the delimiter for splitting output data. Default is a new line.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **PreventShow**
Prevents displaying the output in the console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Online**
Runs the function online to retrieve the latest Group Policy information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-GPOZaurrSupport [[-Type] <String>] [[-ComputerName] <String>] [[-UserName] <String>] [[-Path] <String>] [[-Splitter] <String>] [-PreventShow] [-Online] [<CommonParameters>]
```
