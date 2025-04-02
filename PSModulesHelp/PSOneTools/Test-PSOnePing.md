Test-PSOnePing
--------------

### Synopsis
Sends a ping (ICMP) to a computer

---

### Description

Sends a ping (ICMP) to a computer

---

### Related Links
* [https://powershell.one/tricks/network/ping](https://powershell.one/tricks/network/ping)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-PSOnePing -ComputerName 127.0.0.1, microsoft.com, powershell.one -Timeout 2000
Pings three computers with a maximum timeout of 2000 milliseconds
```
> EXAMPLE 2

```PowerShell
'127.0.0.1', 'microsoft.com', 'powershell.one' | Test-PSOnePing -Timeout 2000 
Pings three computers with a maximum timeout of 2000 milliseconds
```
> EXAMPLE 3

```PowerShell
Get-ADComputer -Filter * | Select-Object -ExpandProperty Name | Test-PSOnePing -Timeout 2000
Pings all computers received from Get-ADComputer with a maximum timeout of 2000 milliseconds
Module "ActiveDirectory" required for Get-ADComputer
```

---

### Parameters
#### **ComputerName**
Computername or IP address to ping

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

#### **Timeout**
Timeout in milliseconds

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

---

### Syntax
```PowerShell
Test-PSOnePing [-ComputerName] <String[]> [[-Timeout] <Int32>] [<CommonParameters>]
```
