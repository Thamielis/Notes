Open-RDMQuickConnect
--------------------

### Synopsis
Open an session by specifying the host.

---

### Description

Open an ad-hoc session by specifying the host.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

---

### Examples
> EXAMPLE

PS C:\> Open-RDMQuickConnect -Host "MyHost" -Connection connection"
Open the host MyHost.

---

### Parameters
#### **Connection**
Specifies a connection template

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|false   |1       |true (ByValue)|

#### **Domain**
Specifies the domain of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |1       |true (ByValue)|

#### **Host**
Specifies the host of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Password**
Specifies the password of the host to open

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |4       |false        |

#### **TemplateID**
Specifies a template ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |4       |false        |

#### **Username**
Specifies the username of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Open-RDMQuickConnect -detailed". For technical information, type "Get-Help Open-RDMQuickConnect -full".

---

### Syntax
```PowerShell
Open-RDMQuickConnect [-Host] <String> [[-Username] <String>] [[-Password] <SecureString>] [[-Domain] <String>] [[-Connection] <PSConnection>] [[-TemplateID] <Guid>] [<CommonParameters>]
```
