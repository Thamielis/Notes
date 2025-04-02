Invoke-NcCli
------------

### Synopsis
For using the private CLI passthrough with the ONTAP REST API

---

### Description

For using the private CLI passthrough with the ONTAP REST API. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Invoke-NcCli -Command "vserver show" -Query '{"vserver": "vs0"}' -Fields "type,rootvolume,subtype"
NcController : 10.236.154.53
Value         : "{
  "vserver": "vs0",
  "type": "data",
  "subtype": "default",
  "rootvolume": "root_vs0"
}"

```
> Example 2

```PowerShell
Invoke-NcCli -Command "vserver create" -Body '{"vserver": "vs0.example.com", "rootvolume": "root_vs0", "language": "en_US.UTF-8"}'
```
> Example 3

```PowerShell
Invoke-NcCli -Command "vserver modify" -Query '{"vserver": "vs0.example.com"}' -Body '{"comment": "Sales team access", "language": "c"}'
```
> Example 4

```PowerShell
Invoke-NcCli -Command "volume restrict" -Body '{"vserver": "vs0.example2.com", "volume": "root_vs0"}'
NcController : 10.236.154.53
Value         : "Volume "vs0.example2.com:root_vs0" is now restricted."

```
> Example 5

```PowerShell
Invoke-NcCli -Command "vserver delete" -Query '{"vserver": "vs0.example.com"}'
```

---

### Parameters
#### **Command**
A string representing the command to execute. This should not include any input or query parameters.Only the base command. E.g.: volume show.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Query**
JSON input for the list of parameters which are used to filter the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Body**
JSON input for any parameters required to execute the command. These would be passed to the API in the body and used as the required or optional command input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Fields**
Comma separated list of parameters which are required in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: System
Family: controller

---

### Syntax
```PowerShell
Invoke-NcCli -Command <String> [-Query <String>] [-Body <String>] [-Fields <String>] [<CommonParameters>]
```
