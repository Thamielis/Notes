Set-RDMSecurityGroupProperty
----------------------------

### Synopsis
Set the value of property given to a security group.

---

### Description

Protected values will always return null.

Non value types will always return ".ToString()".

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMSecurityGroupProperty -SecurityGroup "$securityGroup" -Property "Description" -Value "My New Description"
Set the description value for  the security group given.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSecurityGroup; Set-RDMSecurityGroupProperty -Group $list[1] -Property "Description" -Value "My description"
Retrieves the list of available security groups and then sets the description value of the the second element in the list.
```

---

### Parameters
#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **SecurityGroup**
Specifies the security group.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[PSSecurityGroupInfo]`|true    |1       |true (ByValue)|

#### **Value**
New value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMSecurityGroupProperty -detailed". For technical information, type "Get-Help Set-RDMSecurityGroupProperty -full".

---

### Syntax
```PowerShell
Set-RDMSecurityGroupProperty [-SecurityGroup] <PSSecurityGroupInfo> [-Property] <String> [-Value] <Object> [<CommonParameters>]
```
