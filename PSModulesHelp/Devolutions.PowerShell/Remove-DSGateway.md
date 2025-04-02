Remove-DSGateway
----------------

### Synopsis
Delete a gateway

---

### Description

Delete a gateway. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewayLogs](Get-DSGatewayLogs)

* [Get-DSGatewaySession](Get-DSGatewaySession)

* [New-DSGateway](New-DSGateway)

* [Test-DSGateway](Test-DSGateway)

* [Update-DSGateway](Update-DSGateway)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GatewayID**
ID of the gateway to delete

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Remove-DSGateway -detailed". For technical information, type "Get-Help Remove-DSGateway -full".

---

### Syntax
```PowerShell
Remove-DSGateway -GatewayID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
