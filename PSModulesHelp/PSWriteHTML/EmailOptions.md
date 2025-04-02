EmailOptions
------------

### Synopsis

EmailOptions [[-Priority] <string>] [[-DeliveryNotifications] <Object>] [[-Encoding] <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DeliveryNotifications**

Valid Values:

* None
* OnSuccess
* OnFailure
* Delay
* Never

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Encoding**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Priority**

Valid Values:

* Low
* Normal
* High

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

---

### Inputs
None

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
{@{name=EmailOptions; CommonParameters=True; parameter=System.Object[]}}
```
