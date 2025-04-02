Get-ComObject
-------------

### Synopsis
Returns a list of COM objects with associated CLSID

---

### Description

This will allow you to search for full or partial CLSID. This is handy when troubleshooting DCOM
errors from the event logs

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComObject
Returns a list of COM objects and CLID
```
> EXAMPLE 2

```PowerShell
Get-ComObject -CLID abcd
Returns all COM objects that MATCH your string.
```

---

### Parameters
#### **CLSID**

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |1       |false        |ID<br/>GUID|

#### **ComputerName**

|Type        |Required|Position|PipelineInput |Aliases                                  |
|------------|--------|--------|--------------|-----------------------------------------|
|`[String[]]`|false   |2       |true (ByValue)|HostName<br/>Host<br/>System<br/>Computer|

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs
String

---

### Outputs
* PSCustomObject. In the event more than one object is returned, and array of PSCustomObject

---

### Syntax
```PowerShell
Get-ComObject [[-CLSID] <String>] [[-ComputerName] <String[]>] [-Credential <PSCredential>] [<CommonParameters>]
```
