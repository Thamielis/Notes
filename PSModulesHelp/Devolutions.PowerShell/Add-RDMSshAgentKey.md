Add-RDMSshAgentKey
------------------

### Synopsis

---

### Description

---

### Parameters
#### **CertificateText**
Content of a SSH certificate file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **KeyText**
Content of a private key file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Password**
Password to access the file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMSshAgentKey -detailed". For technical information, type "Get-Help Add-RDMSshAgentKey -full".

---

### Syntax
```PowerShell
Add-RDMSshAgentKey [-KeyText] <String> [[-CertificateText] <String>] [[-Password] <String>] [<CommonParameters>]
```
