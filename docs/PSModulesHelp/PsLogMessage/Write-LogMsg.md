Write-LogMsg
------------

### Synopsis
Prepend a prefix to a log message, write the message to an output stream, and write the message to a text file.
Writes a message to a log file and/or PowerShell output stream

---

### Description

Prepends the log message with:
    a current timestamp
    the current hostname
    the current username
    the current command (function or file name)
    the current location (line number in the code)

Tab-delimits these fields for a compromise between readability and parseability

Adds the log message to a ConcurrentQueue which was passed to the $Buffer parameter

Optionally writes the message to a log file

Optionally writes the message to a PowerShell output stream

---

### Parameters
#### **Text**
Message to log

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **Suffix**
Suffix to append to the end of the string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AddPrefix**
Add a prefix to the message including the date, hostname, current user, and info about the current call stack

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **LogFile**
Text file to append the log message to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PassThru**
Output the message to the pipeline

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Expand**
Splats for the command at the end of the -Text parameter.
E.g.
    Write-LogMsg -Text 'Get-Process' -Expand @{Name = 'explorer'}
Has a resultant $Text value of:
    Get-Process -Name explorer

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |named   |false        |

#### **Type**
Output stream to send the message to
Valid Values:

* Silent
* Quiet
* Success
* Debug
* Verbose
* Output
* Host
* Warning
* Error
* Information
* 

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ThisHostname**
Hostname to use in the log messages and/or output object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhoAmI**
Hostname to use in the log messages and/or output object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Buffer**
Log messages which have not yet been written to disk

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|true    |named   |false        |

#### **ExpandKeyMap**
Used to override key-value pairs in the Expand parameter.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ParamStringMap**

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Cache**
In-process cache to reduce calls to other processes or disk, and store repetitive parameters for better readability of code and logs

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|true    |named   |false        |

#### **ExpansionMap**
Used to override key-value pairs in the Expand parameter.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

---

### Inputs
[System.String[]]$Text parameter

---

### Outputs
* [System.String] Resulting log line, returned if the -PassThru or -Type Output parameters were used

---

### Syntax
```PowerShell
Write-LogMsg [[-Text] <String[]>] [-Suffix <String>] [-AddPrefix <Boolean>] [-LogFile <String>] [-PassThru <Boolean>] [-Expand <Hashtable[]>] [-Type <String>] [-ThisHostname <String>] [-WhoAmI <String>] -Buffer <PSReference> [-ExpandKeyMap <Hashtable>] [-ParamStringMap <Hashtable>] [<CommonParameters>]
```
```PowerShell
Write-LogMsg [[-Text] <String[]>] [-Suffix <String>] [-AddPrefix <Boolean>] [-LogFile <String>] [-PassThru <Boolean>] [-Expand <Hashtable[]>] -Cache <PSReference> [-ExpansionMap <Hashtable>] [<CommonParameters>]
```
