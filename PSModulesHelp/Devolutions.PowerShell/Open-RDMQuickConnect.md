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
|`[PSConnection]`|false   |5       |true (ByValue)|

#### **Domain**
Specifies the domain of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |4       |true (ByValue)|

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **Host**
Specifies the host of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Password**
Specifies the password of the host to open

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |3       |false        |

#### **TemplateID**
Specifies a template ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |6       |false        |

#### **Username**
Specifies the username of the host to open.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |2       |true (ByValue)|

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
Open-RDMQuickConnect [[-Connection] <PSConnection>] [[-Domain] <String>] [-Host] <String> [[-Password] <SecureString>] [[-TemplateID] <Guid>] [[-Username] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
