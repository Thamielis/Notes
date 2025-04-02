Test-ConfigurationCredentials
-----------------------------

### Synopsis
Tests the configuration credentials for any null or empty values.

---

### Description

This function tests the configuration credentials provided to ensure that no keys have null or empty values.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-ConfigurationCredentials -Configuration $Config -AllowEmptyKeys $true
Tests the configuration credentials in $Config allowing empty keys.
```
> EXAMPLE 2

```PowerShell
Test-ConfigurationCredentials -Configuration $Config -AllowEmptyKeys $false
Tests the configuration credentials in $Config without allowing empty keys.
```

---

### Parameters
#### **Configuration**
The configuration object containing the credentials to be tested.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **AllowEmptyKeys**
Specifies whether empty keys are allowed to be present in the configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Test-ConfigurationCredentials [[-Configuration] <Object>] [[-AllowEmptyKeys] <Object>] [<CommonParameters>]
```
