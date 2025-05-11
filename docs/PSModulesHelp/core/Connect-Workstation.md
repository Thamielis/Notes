Connect-Workstation
-------------------

### Synopsis
Connect-Workstation [-ComputerName] <string> [-Credential] <pscredential> [-Authentication <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Authentication**

Valid Values:

* Default
* Basic
* CredSSP
* Digest
* Kerberos
* Negotiate
* NegotiateWithImplicitCredential

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ComputerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Pscredential]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Connect-Workstation [-ComputerName] <String> [-Credential] <Pscredential> [-Authentication <String>] [<CommonParameters>]
```
