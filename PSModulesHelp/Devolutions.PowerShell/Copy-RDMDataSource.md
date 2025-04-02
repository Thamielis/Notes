Copy-RDMDataSource
------------------

### Synopsis
Copy an existing data source

---

### Description

Copy an existing data source. The user can be prompted if the data source requires an MFA.
On a Windows OS, a policy can disable this cmdlet. In case of a SQL server with a custom login, it is possible to connect using different credentials.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMDataSource -Name 'CustomSQL' | Copy-RDMDataSource | Set-RDMCurrentDataSource
Connect to a copy of the data source 'CustomSQL'. If the user is prompted for the credentials, different credentials can be entered.
```

---

### Parameters
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
ID of the data source to copy

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
PSDataSource obtained from Get-RDMDataSource to copy

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|true    |1       |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource

Data source object to copy obtained from Get-RDMDataSource.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource

---

### Notes
For more information, type "Get-Help Copy-RDMDataSource -detailed". For technical information, type "Get-Help Copy-RDMDataSource -full".

---

### Syntax
```PowerShell
Copy-RDMDataSource [-ID] <Guid> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Copy-RDMDataSource [-InputObject] <PSDataSource> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
