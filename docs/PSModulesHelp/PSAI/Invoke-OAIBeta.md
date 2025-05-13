Invoke-OAIBeta
--------------

### Synopsis
Invokes an OpenAI API endpoint using the OpenAI-Beta header.

---

### Description

The Invoke-OAIBeta function is used to send requests to an OpenAI API endpoint. It supports various parameters such as the URI, HTTP method, request body, content type, output file, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-OAIBeta -Uri 'https://api.openai.com/v1/endpoint' -Method 'GET' -OutFile 'response.json'
This example sends a GET request to the specified API endpoint and saves the response content to a file named 'response.json'.
```

---

### Parameters
#### **Uri**
Specifies the URI of the OpenAI API endpoint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Method**
Specifies the HTTP method to be used for the request (e.g., GET, POST, PUT, DELETE).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Body**
Specifies the request body to be sent with the API request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **ContentType**
Specifies the content type of the request body. The default value is 'application/json'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **OutFile**
Specifies the path to save the response content to a file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **NotOpenAIBeta**
If specified, removes the 'OpenAI-Beta' header from the request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-OAIBeta [[-Uri] <Object>] [[-Method] <Object>] [[-Body] <Object>] [[-ContentType] <Object>] [[-OutFile] <Object>] [-NotOpenAIBeta] [<CommonParameters>]
```
