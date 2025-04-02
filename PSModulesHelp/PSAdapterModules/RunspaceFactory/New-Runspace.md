New-Runspace
------------

### Synopsis

New-Runspace [[-InitialSessionState] <initialsessionstate>] [[-Host] <PSHost>] [[-ConnectionInfo] <RunspaceConnectionInfo>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ConnectionInfo**

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[RunspaceConnectionInfo]`|false   |2       |true (ByPropertyName)|

#### **Host**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[PSHost]`|false   |1       |true (ByPropertyName)|

#### **InitialSessionState**

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[initialsessionstate]`|false   |0       |true (ByPropertyName)|

---

### Inputs
System.Management.Automation.Runspaces.InitialSessionState
System.Management.Automation.Host.PSHost
System.Management.Automation.Runspaces.RunspaceConnectionInfo

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-Runspace; CommonParameters=True; parameter=System.Object[]}}
```
