Close-Port
----------

### Synopsis
Opens ports on the Windows Firewall

---

### Description

Opens ports on the Windows Firewall on the local machine

---

### Related Links
* [Open-Port](Open-Port)

---

### Examples
> EXAMPLE 1

```PowerShell
Close-Port 500
```

---

### Parameters
#### **Port**
The port numbers to close

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[UInt32[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Protocol**
The protocol to close.  The Default is TCP.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Close-Port [-Port] <UInt32[]> [[-Protocol] <String[]>] [<CommonParameters>]
```
