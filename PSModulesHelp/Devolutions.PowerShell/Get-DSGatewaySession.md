Get-DSGatewaySession
--------------------

### Synopsis
Get a gateway's sessions

---

### Description

Get a gateway's sessions. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewayLogs](Get-DSGatewayLogs)

* [New-DSGateway](New-DSGateway)

* [Remove-DSGateway](Remove-DSGateway)

* [Test-DSGateway](Test-DSGateway)

* [Update-DSGateway](Update-DSGateway)

---

### Examples
> EXAMPLE

PS C:\> $response = Get-DSGatewaySession -GatewayID "08a521fe-14f7-4ae5-b2b9-d9f6164c15e8" -AsLegacyResponse;
        $gateway  = $response.Data;
        $gwSessions -GatewayID $gateway.Id
Get all sessions of the specified gateway.

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GatewayID**
Gateway's ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.ApiWrapper.Models.Gateway.GatewaySession[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.GatewaySession, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSGatewaySession -detailed". For technical information, type "Get-Help Get-DSGatewaySession -full".

---

### Syntax
```PowerShell
Get-DSGatewaySession -GatewayID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
