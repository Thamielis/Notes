Invoke-GHGraphQl
----------------

### Synopsis
A wrapper around Invoke-WebRequest that understands the GitHub GraphQL API.

---

### Description

A very heavy wrapper around Invoke-WebRequest that understands the GitHub QraphQL API.
It also understands how to parse and handle errors from the GraphQL calls.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GHGraphQl
```

---

### Parameters
#### **Description**
A friendly description of the operation being performed for logging.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Body**
This parameter forms the body of the request. It will be automatically
encoded to UTF8 and sent as Content Type: "application/json; charset=UTF-8"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
GraphQL Api as opposed to requesting a new one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TelemetryEventName**
If provided, the successful execution of this GraphQL command will be logged to telemetry
using this event name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TelemetryProperties**
If provided, the successful execution of this GraphQL command will be logged to telemetry
with these additional properties.  This will be silently ignored if TelemetryEventName
is not provided as well.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

#### **TelemetryExceptionBucket**
If provided, any exception that occurs will be logged to telemetry using this bucket.
It's possible that users will wish to log exceptions but not success (by providing
TelemetryEventName) if this is being executed as part of a larger scenario.  If this
isn't provided, but TelemetryEventName *is* provided, then TelemetryEventName will be
used as the exception bucket value in the event of an exception.  If neither is specified,
no bucket value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
This wraps Invoke-WebRequest as opposed to Invoke-RestMethod because we want access
to the headers that are returned in the response, and Invoke-RestMethod drops those headers.

---

### Syntax
```PowerShell
Invoke-GHGraphQl [[-Description] <String>] [-Body] <String> [[-AccessToken] <String>] [[-TelemetryEventName] <String>] [[-TelemetryProperties] <Hashtable>] [[-TelemetryExceptionBucket] <String>] [<CommonParameters>]
```
