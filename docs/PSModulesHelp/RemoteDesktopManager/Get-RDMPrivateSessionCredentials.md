Get-RDMPrivateSessionCredentials
--------------------------------

### Synopsis
Returns the session credentials

---

### Description

Returns the session credentials

---

### Parameters
#### **GetID**
Get the credential ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **PSConnection**
Specifies the connection to get credentials from.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMPrivateSessionCredentials -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionCredentials -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionCredentials [-PSConnection] <PSConnection> [[-GetID]] [<CommonParameters>]
```
