Trigger
-------

### Synopsis

Trigger [[-Object] <Object>] [-Name <string>] [-User <TriggerUser>] [-Value <Object>] [<CommonParameters>]

Trigger [[-Object] <Object>] [-Name <string>] [-Group <TriggerGroup>] [-Value <Object>] [<CommonParameters>]

Trigger [[-Object] <Object>] [-Name <string>] [-Computer <TriggerComputer>] [-Value <Object>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Computer**

Valid Values:

* Always
* OrganizationalUnit
* GroupMembership
* Filter

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[TriggerComputer]`|false   |Named   |false        |

#### **Group**

Valid Values:

* Always
* OrganizationalUnit
* Filter

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[TriggerGroup]`|false   |Named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Object**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |0       |true (ByValue)|

#### **User**

Valid Values:

* Always
* OrganizationalUnit
* GroupMembership
* Filter

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[TriggerUser]`|false   |Named   |false        |

#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

---

### Inputs
System.Object

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
{@{name=Trigger; CommonParameters=True; parameter=System.Object[]}, @{name=Trigger; CommonParameters=True; parameter=System.Object[]}, @{name=Trigger; CommonParameters=True; parameter=System.Object[]}}
```
