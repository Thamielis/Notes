Set-RDMCurrentDataSource
------------------------

### Synopsis
Set current active data source.

---

### Description

Set current active data source.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMCurrentDataSource "{00000000-0000-0000-0000-000000000000}"
Set active data source to the data source with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMDataSource; Set-RDMCurrentDataSource $list[1].ID
Retrieves the list of available data sources and sets the current data source the the second element in the list.
```

---

### Parameters
#### **DataSource**
Specifies the datasource to set current

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|false   |1       |true (ByValue)|

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

#### **ID**
Specifies the GUID of the data source to set as the current.
The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Password**
Data source password

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[SecureString]`|false   |3       |true (ByValue)|

#### **Username**
Data source username

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
For more information, type "Get-Help Set-RDMCurrentDataSource -detailed". For technical information, type "Get-Help Set-RDMCurrentDataSource -full".

---

### Syntax
```PowerShell
Set-RDMCurrentDataSource [[-DataSource] <PSDataSource>] [[-Password] <SecureString>] [[-Username] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMCurrentDataSource [-ID] <Guid> [[-Password] <SecureString>] [[-Username] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
