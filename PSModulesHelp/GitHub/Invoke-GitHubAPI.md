Invoke-GitHubAPI
----------------

### Synopsis
Calls the GitHub API using the provided parameters.

---

### Description

This function is a wrapper around Invoke-RestMethod tailored for calling GitHub's API.
It automatically handles the endpoint URI construction, headers, and token authentication.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GitHubAPI -ApiEndpoint '/repos/user/repo/pulls' -Method GET
Gets all open pull requests for the specified repository.
```
> EXAMPLE 2

```PowerShell
Invoke-GitHubAPI -ApiEndpoint '/repos/user/repo/pulls' -Method GET -Body @{ state = 'open' }
Gets all open pull requests for the specified repository, filtered by the 'state' parameter.
```
> EXAMPLE 3

```PowerShell
Invoke-GitHubAPI -ApiEndpoint '/repos/user/repo/pulls' -Method GET -Body @{ state = 'open' } -Accept 'application/vnd.github.v3+json'
Gets all open pull requests for the specified repository, filtered by the 'state' parameter, and using the specified 'Accept' header.
```

---

### Parameters
#### **Method**
The HTTP method to be used for the API request. It can be one of the following: GET, POST, PUT, DELETE, or PATCH.
Valid Values:

* GET
* POST
* PUT
* DELETE
* PATCH

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **ApiBaseUri**
The base URI for the GitHub API. This is usually `https://api.github.com`, but can be adjusted if necessary.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ApiEndpoint**
The specific endpoint for the API call, e.g., '/repos/user/repo/pulls'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Body**
The body of the API request. This can be a hashtable or a string. If a hashtable is provided, it will be converted to JSON.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |false        |Query  |

#### **Accept**
The 'Accept' header for the API request. If not provided, the default will be used by GitHub's API.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HttpVersion**
Specifies the HTTP version used for the request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UploadFilePath**
The file path to be used for the API request. This is used for uploading files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DownloadFilePath**
The file path to be used for the API response. This is used for downloading files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uri**
The full URI for the API request. This is used for custom API calls.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ContentType**
The 'Content-Type' header for the API request. The default is 'application/vnd.github+json'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ApiVersion**
The GitHub API version to be used. By default, it pulls from a configuration script variable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-GitHubAPI [-Method <Object>] [-ApiBaseUri <String>] -ApiEndpoint <String> [-Body <Object>] [-Accept <String>] [-HttpVersion <String>] [-UploadFilePath <String>] [-DownloadFilePath <String>] [-ContentType <String>] [-ApiVersion <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Invoke-GitHubAPI [-Method <Object>] [-Body <Object>] [-Accept <String>] [-HttpVersion <String>] [-UploadFilePath <String>] [-DownloadFilePath <String>] -Uri <String> [-ContentType <String>] [-ApiVersion <String>] [-Context <Object>] [<CommonParameters>]
```
