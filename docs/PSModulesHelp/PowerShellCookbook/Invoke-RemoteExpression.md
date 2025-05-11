Invoke-RemoteExpression
-----------------------

### Synopsis
Invoke a PowerShell expression on a remote machine. Requires PsExec from
http://live.sysinternals.com/tools/psexec.exe. If the remote machine
supports PowerShell version two, use PowerShell remoting instead.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-RemoteExpression LEE-DESK { Get-Process }
Retrieves the output of a simple command from a remote machine
```
> EXAMPLE 2

(Invoke-RemoteExpression LEE-DESK { Get-Date }).AddDays(1)
Invokes a command on a remote machine. Since the command returns one of
PowerShell's primitive types (a DateTime object,) you can manipulate
its output as an object afterward.
> EXAMPLE 3

```PowerShell
Invoke-RemoteExpression LEE-DESK { Get-Process } | Sort Handles
Invokes a command on a remote machine. The command does not return one of
PowerShell's primitive types, but you can still use PowerShell's filtering
cmdlets to work with its structured output.
```

---

### Parameters
#### **ComputerName**
The computer on which to invoke the command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **ScriptBlock**
The scriptblock to invoke on the remote machine.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |2       |false        |

#### **Credential**
The username / password to use in the connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **NoProfile**
Determines if PowerShell should load the user's PowerShell profile
when invoking the command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-RemoteExpression [[-ComputerName] <Object>] [-ScriptBlock] <ScriptBlock> [[-Credential] <Object>] [-NoProfile] [<CommonParameters>]
```
