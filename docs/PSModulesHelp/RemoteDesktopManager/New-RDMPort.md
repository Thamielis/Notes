New-RDMPort
-----------

### Synopsis
Generate port number(s) based on the specified parameters.

---

### Description

Generate port number(s) based on the specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $port = New-RDMPort -Minimum 50 -Maximum 2048 -IncludeWellKnownPorts -IncludeRegisteredPorts -IncludePortsUsedByOthersSessions
Generate a port between 50 and 2048. The port can be already used by another session, or be a well known or registered port.
```
> EXAMPLE 2

```PowerShell
PS C:\> $port = New-RDMPort -Minimum 10 -Maximum 15 -IncludeWellKnownPorts -IncludeRegisteredPorts -ExcludePort 11,12,13
The port will have a value of either 10, 14 or 15. If another session use one of the ports, that port will be excluded from the possibilities.
```
> EXAMPLE 3

PS C:\> $ports = New-RDMPort -Count 10
10 ports will be generated and stored in $ports.
> EXAMPLE 4

```PowerShell
PS C:\> $sess = Get-RDMSession -Name ARemotePwsh; $sess.PowerShell.Port = New-RDMPort -Minimum 1024; Set-RDMSession -Session $sess -Refresh
The user fetch an existing remote powershell session called ARemotePwsh and change its port. The new port in at least 1024, not a well known port, not a registered port and unused by other sessions. The user save the modification.
```

---

### Parameters
#### **Count**
Number of ports to be generated. Default value is 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **ExcludePort**
Those ports will not be generated.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |1       |false        |

#### **IncludePortsUsedByOthersSessions**
Allows ports used by others sessions to be generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeRegisteredPorts**
Allows registered ports to be generated. For a list of registered ports, see: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeWellKnownPorts**
Allows well known ports to be generated. For a list of well known ports, see: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Well-known_ports

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Maximum**
Maximum port value generated. By default, the boundary is set at the absolute maximum 65 535.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **Minimum**
Minimum port value generated. By default, the boundary is set at 0. A recommended value is 1024.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMPort -detailed". For technical information, type "Get-Help New-RDMPort -full".

---

### Syntax
```PowerShell
New-RDMPort [[-Count] <Int32>] [[-ExcludePort] <Int32[]>] [[-IncludeWellKnownPorts]] [[-IncludeRegisteredPorts]] [[-IncludePortsUsedByOthersSessions]] [[-Maximum] <Int32>] [[-Minimum] <Int32>] [<CommonParameters>]
```
