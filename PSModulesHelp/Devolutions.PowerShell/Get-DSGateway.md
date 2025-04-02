Get-DSGateway
-------------

### Synopsis
Get gateways

---

### Description

Get a single or multiple gateways. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewayLogs](Get-DSGatewayLogs)

* [Get-DSGatewaySession](Get-DSGatewaySession)

* [New-DSGateway](New-DSGateway)

* [Remove-DSGateway](Remove-DSGateway)

* [Test-DSGateway](Test-DSGateway)

* [Update-DSGateway](Update-DSGateway)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $gateways = Get-DSGateway -All;
        $gateways  = $response.Data
Get all gateways.
```
> EXAMPLE 2

```PowerShell
PS C:\> $gateway = Get-DSGateway -Name "A Common Name"
Get the gateway named "A Common Name".
```

---

### Parameters
#### **All**
Obtain all gateways.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GatewayID**
ID of the gateway to fetch.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **Name**
Name of the gateway to fetch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.ApiWrapper.Models.Gateway.Gateway[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.Gateway, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.Gateway, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSGateway -detailed". For technical information, type "Get-Help Get-DSGateway -full".

---

### Syntax
```PowerShell
Get-DSGateway -GatewayID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSGateway -Name <String> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSGateway -All [-AsLegacyResponse] [<CommonParameters>]
```
