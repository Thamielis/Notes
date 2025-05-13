Set-AzOAISecrets
----------------

### Synopsis
Sets the Azure OAI secrets.

---

### Description

This function sets the Azure OAI (OpenAPI Service) secrets by storing the provided values in the script scope.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-AzOAISecrets -apiURI "https://api.example.com" -apiKEY "myApiKey" -apiVersion "v1" -deploymentName "MyDeployment"
Sets the Azure OAI secrets with the specified values.
```

---

### Parameters
#### **apiURI**
The URI of the Azure OAI.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **apiKEY**
The API key for accessing the Azure OAI.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **apiVersion**
The version of the Azure OAI.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

#### **deploymentName**
The name of the deployment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

---

### Syntax
```PowerShell
Set-AzOAISecrets [-apiURI] <Object> [-apiKEY] <Object> [-apiVersion] <Object> [-deploymentName] <Object> [<CommonParameters>]
```
