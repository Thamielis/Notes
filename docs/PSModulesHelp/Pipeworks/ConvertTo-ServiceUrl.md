ConvertTo-ServiceUrl
--------------------

### Synopsis
Converts parameters into a full URL for a Pipeworks Service

---

### Description

Converts parameters into a full URL for a Pipeworks web service.  

This allows you to easily call another a Pipeworks web service with a uniform URL.

This can work because all Pipeworks services have a very uniform URL format:

ServiceUrl/Command/?Command_Parameter1=Value&Command_Parameter2=Value

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-ServiceUrl -ServiceUrl "http://powershellpipeworks.com/" -CommandName "Write-ScriptHTML" -Parameter @{
    Text = "'hello world'"
}
```

---

### Parameters
#### **ServiceUrl**
The root URL of the web service

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|false   |1       |true (ByPropertyName)|

#### **CommandName**
The name of the command in the Pipeworks module.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Parameter**
The name of the command in the Pipeworks module.

|Type         |Required|Position|PipelineInput        |Aliases   |
|-------------|--------|--------|---------------------|----------|
|`[Hashtable]`|true    |3       |true (ByPropertyName)|Parameters|

#### **AsXml**
If set, will get a URL to return the XML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
ConvertTo-ServiceUrl [[-ServiceUrl] <Uri>] [-CommandName] <String> [-Parameter] <Hashtable> [-AsXml] [<CommonParameters>]
```
