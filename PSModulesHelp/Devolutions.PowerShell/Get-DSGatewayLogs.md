Get-DSGatewayLogs
-----------------

### Synopsis
Get a gateway's logs

---

### Description

Get a gateway's logs. The logs will be stored in the specified path. The Devolutions Gateway module is required.

---

### Related Links
* [Get-DSGateway](Get-DSGateway)

* [Get-DSGatewaySession](Get-DSGatewaySession)

* [New-DSGateway](New-DSGateway)

* [Remove-DSGateway](Remove-DSGateway)

* [Test-DSGateway](Test-DSGateway)

* [Update-DSGateway](Update-DSGateway)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $response = Get-DSGateway -All -AsLegacyResponse;
        $gateways  = $response.Data;
        $gateways | ForEach-Object {Get-DSGatewayLogs -GatewayID $_.Id -OutputPath "C:\my\path\filename_$_.Name.txt"}
Get logs for all gateways and create a file for each of them.
```

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

#### **OutputPath**
Path, including the file name and extension, where the file will be the saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]

---

### Notes
For more information, type "Get-Help Get-DSGatewayLogs -detailed". For technical information, type "Get-Help Get-DSGatewayLogs -full".

---

### Syntax
```PowerShell
Get-DSGatewayLogs -GatewayID <Guid> -OutputPath <String> [-AsLegacyResponse] [<CommonParameters>]
```
