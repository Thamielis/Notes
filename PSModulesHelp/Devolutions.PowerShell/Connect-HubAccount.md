Connect-HubAccount
------------------

### Synopsis
Connect to Hub.

---

### Description

If PSHubContext is provided, try to connect to Hub with it. If PSHubContext is not provided, create a PSHubContext with informations received and try to connect to Hub afterward.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $PSHubContext = [Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext]@{ApplicationKey="24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554"; ApplicationSecret="U4nmdOjqPAcL0GfbvNC2u8e0FCZjhEJFTnn6YHpIZDY="; Url="https://stagingv3.devolutions.xyz"}; Connect-HubAccount -PSHubContext $PSHubContext
The user creates the context with information he knows and uses it to connect to Hub.
```
> EXAMPLE 2

PS C:\> Connect-HubAccount -Url https://stagingv3.devolutions.xyz -ApplicationKey "24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554" -ApplicationSecret U4nmdOjqPAcL0GfbvNC2u8e0FCZjhEJFTnn6YHpIZDY=
The user etablishes a connection to Hub by passing the context's information directly to the cmdlet. The associated context is created at the same time.

---

### Parameters
#### **ApplicationKey**
Hub Application Key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ApplicationSecret**
Hub Application Secret

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **PSHubContext**
Hub Context

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSHubContext]`|true    |named   |false        |

#### **Url**
Hub Url

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Connect-HubAccount -detailed". For technical information, type "Get-Help Connect-HubAccount -full".

---

### Syntax
```PowerShell
Connect-HubAccount -PSHubContext <PSHubContext> [<CommonParameters>]
```
```PowerShell
Connect-HubAccount -Url <String> -ApplicationKey <String> -ApplicationSecret <String> [<CommonParameters>]
```
