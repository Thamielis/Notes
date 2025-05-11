Send-TcpRequest
---------------

### Synopsis
Send a TCP request to a remote computer, and return the response.
If you do not supply input to this script (via either the pipeline, or the
-InputObject parameter,) the script operates in interactive mode.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$http = @"
  GET / HTTP/1.1
  Host:bing.com
  `n`n
"@
$http | Send-TcpRequest bing.com 80
```

---

### Parameters
#### **ComputerName**
The computer to connect to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Test**
A switch to determine if you just want to test the connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Port**
The port to use

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **UseSSL**
A switch to determine if the connection should be made using SSL

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
The input string to send to the remote host

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Delay**
The delay, in milliseconds, to wait between commands

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

---

### Syntax
```PowerShell
Send-TcpRequest [[-ComputerName] <String>] [-Test] [[-Port] <Int32>] [-UseSSL] [[-InputObject] <String>] [[-Delay] <Int32>] [<CommonParameters>]
```
