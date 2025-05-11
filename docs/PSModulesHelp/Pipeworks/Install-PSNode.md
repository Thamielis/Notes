Install-PSNode
--------------

### Synopsis
Install a PSNode server on the local machine

---

### Description

Installs a PSNode server on a local machine

---

### Related Links
* [Start-PSNode](Start-PSNode)

* [Open-Port](Open-Port)

---

### Examples
> EXAMPLE 1

```PowerShell
Install-PSNode "http://*:9090" -Command { 'hello world' }
```

---

### Parameters
#### **Server**
The server url, ie. http://localhost:9090/

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Command**
The command to run within the server

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[ScriptBlock]`|true    |2       |true (ByPropertyName)|

#### **AuthenticationType**
The authentication type
Valid Values:

* None
* Digest
* Negotiate
* Ntlm
* IntegratedWindowsAuthentication
* Basic
* Anonymous

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[AuthenticationSchemes]`|false   |3       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Install-PSNode [-Server] <String> [-Command] <ScriptBlock> [[-AuthenticationType] {None | Digest | Negotiate | Ntlm | IntegratedWindowsAuthentication | Basic | Anonymous}] [<CommonParameters>]
```
