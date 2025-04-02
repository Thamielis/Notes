Action
------

### Synopsis

Action [[-Object] <Object>] [-Name <string>] [-ActiveDirectory <ActionAD>] [-Value <Object>] [-WhatIf] [<CommonParameters>]

Action [[-Object] <Object>] [-Name <string>] [-Exchange <ActionExchange>] [-Value <Object>] [-WhatIf] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ActiveDirectory**

Valid Values:

* AccountAddGroupsSpecific
* AccountDisable
* AccountEnable
* AccountHideInGAL
* AccountShowInGAL
* AccountRemoveGroupsAll
* AccountRemoveGroupsSecurity
* AccountRemoveGroupsDistribution
* AccountRemoveGroupsSpecific
* AccountRemoveGroupsDomainLocal
* AccountRemoveGroupsGlobal
* AccountRemoveGroupsUniversal
* AccountRename
* AccountSnapshot

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[ActionAD]`|false   |Named   |false        |

#### **Exchange**

Valid Values:

* MailboxConvertToSharedMailbox
* MailboxEmailAddressPolicyEnable
* ContactConvertToMailContact

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ActionExchange]`|false   |Named   |false        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Object**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |0       |true (ByValue)|

#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
{@{name=Action; CommonParameters=True; parameter=System.Object[]}, @{name=Action; CommonParameters=True; parameter=System.Object[]}}
```
