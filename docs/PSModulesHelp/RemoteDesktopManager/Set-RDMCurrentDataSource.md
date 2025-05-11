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
Set-RDMCurrentDataSource [[-DataSource] <PSDataSource>] [[-Username] <String>] [[-Password] <SecureString>] [<CommonParameters>]
```
```PowerShell
Set-RDMCurrentDataSource [-ID] <Guid> [[-Username] <String>] [[-Password] <SecureString>] [<CommonParameters>]
```
