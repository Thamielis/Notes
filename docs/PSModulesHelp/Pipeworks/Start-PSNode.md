Start-PSNode
------------

### Synopsis
Starts a lightweight local server

---

### Description

Starts a lightweight local server that uses the HttpListener class to create a simple server.  

This server is unlike the Pipeworks in ASP.NET in many interesting ways:

- Unlike Pipeworks within ASP.NET which lets each user have their own runspace, PSNode puts all users in the same runspace.  
This makes it faster, and means all people connected share a lot of the same information (for better and worse).  
Additionally, this runspace does not contain any modules, but can load any modules you have.
- Unlike Pipeworks within ASP.NET, which runs in an Application Pool as the context of that restricted user, PSNode is always running as you and under and administrative account.
This means a lot.  On the good side, it means you can do things ASP.NET cannot, like popping up a window on the desktop.  On the darker side, it means that if you allow arbitrary code execution in what you put up on PSNode, you have an endpoint that can do anything to a box in the context of the current user.
- Unlike Pipeworks within ASP.NET, PSNode runs in any .exe
This also means a lot.  
PSNode may run within any process, and, because it is running in a process, certain components that require a permission associated with an interactive process will execute in PSNode and not in Pipeworks under ASP.NET    

PSNode was inspired by a presentation from Bruce Payette at the PowerShell Deep Dive @ TEC2011 in Frankfurt, Germany

---

### Related Links
* [Install-PSNode](Install-PSNode)

---

### Examples
> EXAMPLE 1

```PowerShell
Start-PSNode -Server http://localhost:9097/ -Command {
    "Hello World"
}
```
> EXAMPLE 2

```PowerShell
Start-PSNode -Server http://localhost:9092/ -AuthenticationType IntegratedWindowsAuthentication -Command {
    "Hello $($User.Identity.Name)"
}
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

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AuthenticationSchemes]`|false   |3       |false        |

#### **DoNotReturn**
If set, will not return

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsService**
If set, will run inside of a service.  You must be running as an administrator to install PSNode this way.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)

---

### Syntax
```PowerShell
Start-PSNode [-Server] <String> [-Command] <ScriptBlock> [[-AuthenticationType] {None | Digest | Negotiate | Ntlm | IntegratedWindowsAuthentication | Basic | Anonymous}] [-DoNotReturn] [-AsService] [<CommonParameters>]
```
