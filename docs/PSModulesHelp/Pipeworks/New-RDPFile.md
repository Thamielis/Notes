New-RDPFile
-----------

### Synopsis
Creates a new Remote Desktop file

---

### Description

Creates a new Remote Desktop file that can connect with a credential

---

### Related Links
* [ConvertFrom-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertFrom-SecureString)

---

### Examples
> EXAMPLE 1

```PowerShell
New-RDPFile -ComputerName MyComputer
```

---

### Parameters
#### **ComputerName**
The computername

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|CN     |

#### **Credential**
The credential.  RDP files created with this credential will only work on this machine

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
New-RDPFile [-ComputerName] <String> [-Credential <PSCredential>] [<CommonParameters>]
```
