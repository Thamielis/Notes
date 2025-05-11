Open-Port
---------

### Synopsis
Opens ports on the Windows Firewall

---

### Description

Opens ports on the Windows Firewall on the local machine

---

### Related Links
* [Close-Port](Close-Port)

---

### Examples
> EXAMPLE 1

```PowerShell
Open-Port 500
```

---

### Parameters
#### **Port**
The port numbers to open

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[UInt32[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Name**
The name of the opened port.  Defaults to Port$PortNumber, i.e. Port21

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Protocol**
The protocol for the port, either TCP or UDP.  The Default is TCP.
Valid Values:

* TCP
* UDP

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **FromAddress**
The address pattern than can access the computer from that port

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Open-Port [-Port] <UInt32[]> [[-Name] <String>] [[-Protocol] <String>] [[-FromAddress] <String>] [<CommonParameters>]
```
