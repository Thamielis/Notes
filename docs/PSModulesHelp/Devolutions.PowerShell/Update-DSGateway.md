Update-DSGateway
----------------

### Synopsis
Update a gateway

---

### Description

Update a gateway. Use the parameters to modify the gateway. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewayLogs](Get-DSGatewayLogs)

* [Get-DSGatewaySession](Get-DSGatewaySession)

* [New-DSGateway](New-DSGateway)

* [Remove-DSGateway](Remove-DSGateway)

* [Test-DSGateway](Test-DSGateway)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $response = Get-DSGateway -Name "Old default gateway" -AsLegacyResponse;
        $gateway = $response.Data[0];
        Update-DSGateway -Name "Standard Gateway" -Description "Not the default anymore" -IsDefault $false
Update the gateway named "Old default gateway" by removing its default status. A new description will indicate the change.
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
|`[String]`|false   |named   |false        |

#### **ForceIpAddressForRdpConnections**
Force using IP address for RDP connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **GatewayID**
ID of the gateway to update.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **HealthCheckInterval**
Health check interval in minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IsDefault**
Set as the default gateway

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Name**
Gateway's name. The value will be trimmed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TCPListeningPort**
Port used for RDP sessions, and eventually the SSH sessions.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **TokenDuration**
Generated token duration in minutes. Must be between 1 and 120 minutes.

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
For more information, type "Get-Help Update-DSGateway -detailed". For technical information, type "Get-Help Update-DSGateway -full".

---

### Syntax
```PowerShell
Update-DSGateway -GatewayID <Guid> [<CommonParameters>]
```
