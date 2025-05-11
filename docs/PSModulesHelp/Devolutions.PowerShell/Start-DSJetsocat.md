Start-DSJetsocat
----------------

### Synopsis

---

### Description

---

### Parameters
#### **ListenerAddress**
Jetsocat listener binding address

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ListenerMode**
Jetsocat listener mode
Valid Values:

* Socks5Proxy
* HttpProxy
* TcpForward

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[JetsocatListenerMode]`|true    |2       |false        |

#### **Token**
Token of the gateway

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[TokenContainer]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Start-DSJetsocat -detailed". For technical information, type "Get-Help Start-DSJetsocat -full".

---

### Syntax
```PowerShell
Start-DSJetsocat [-Token] <TokenContainer> [-ListenerAddress] <String> [-ListenerMode] <Socks5Proxy | HttpProxy | TcpForward> [<CommonParameters>]
```
