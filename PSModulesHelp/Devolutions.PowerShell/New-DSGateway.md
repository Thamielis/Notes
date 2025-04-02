New-DSGateway
-------------

### Synopsis
Create a gateway

---

### Description

Create a gateway. Use the parameters to create the gateway. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewayLogs](Get-DSGatewayLogs)

* [Get-DSGatewaySession](Get-DSGatewaySession)

* [Remove-DSGateway](Remove-DSGateway)

* [Test-DSGateway](Test-DSGateway)

* [Update-DSGateway](Update-DSGateway)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> New-DSGateway -Name "New Gateway" -DevolutionsGatewayUrl "http://localhost" -TCPListeningPort 8181.
Create a gateway with minimal information.
```
> EXAMPLE 2

```PowerShell
PS C:\> New-DSGateway -Name "New Default Gateway" -DevolutionsGatewayUrl "http://localhost" -TCPListeningPort 8181 -Description "A simple description" -IsDefault -ForceIpAddressForRdpConnections -TokenDuration 60 -HealthCheckInterval 240.
Create the new default gateway.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
Description of the gateway

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DevolutionsGatewayUrl**
URL to reach the Devolutions Gateway. Must be a valid URI and unique to this gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ForceIpAddressForRdpConnections**
Force using IP address for RDP connections.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HealthCheckInterval**
Health check interval in minutes. By default, it is set to 60 minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IsDefault**
Set as the default gateway

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
Gateway's name. The value will be trimmed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TCPListeningPort**
Port used for RDP sessions, and eventually the SSH sessions.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **TokenDuration**
Generated token duration in minutes. Must be between 1 and 120 minutes. By default, it is set to 5 minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSGateway -detailed". For technical information, type "Get-Help New-DSGateway -full".

---

### Syntax
```PowerShell
New-DSGateway -Name <String> [-Description <String>] [-IsDefault] -DevolutionsGatewayUrl <String> -TCPListeningPort <Int32> [-TokenDuration <Int32>] [-HealthCheckInterval <Int32>] [-ForceIpAddressForRdpConnections] [-AsLegacyResponse] [<CommonParameters>]
```
