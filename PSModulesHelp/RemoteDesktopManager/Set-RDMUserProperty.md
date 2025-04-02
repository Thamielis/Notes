Set-RDMUserProperty
-------------------

### Synopsis
Set the value of property given to a user.

---

### Description

Set the value of property given to a user.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [New-RDMUser](New-RDMUser)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMuserProperty -User "$user" -Property "Description" -Value "My New Description"
Set the description value for the user given.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUser; Set-RDMUserProperty -User $list[1] -Property "Description" -Value "My description"
Retrieves the list of available users and then sets the description value of the the second element in the list.
```

---

### Parameters
#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **User**
Specifies the GUID of the user to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSUserInfo]`|true    |1       |true (ByValue)|

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
For more information, type "Get-Help Set-RDMUserProperty -detailed". For technical information, type "Get-Help Set-RDMUserProperty -full".

---

### Syntax
```PowerShell
Set-RDMUserProperty [-User] <PSUserInfo> [-Property] <String> [-Value] <Object> [<CommonParameters>]
```
