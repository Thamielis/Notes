Invoke-GHRestMethodMultipleResult
---------------------------------

### Synopsis
A special-case wrapper around Invoke-GHRestMethod that understands GET URI's
which support the 'top' and 'max' parameters.

---

### Description

A special-case wrapper around Invoke-GHRestMethod that understands GET URI's
which support the 'top' and 'max' parameters.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Invoke-GHRestMethodMultipleResult -UriFragment "repos/PowerShell/PowerShellForGitHub/issues?state=all" -Description "Get all issues"
Gets the first set of issues associated with this project,
with the console window showing progress while awaiting the response
from the REST request.

---

### Parameters
#### **UriFragment**
The unique, tail-end, of the REST URI that indicates what GitHub REST action will
be performed.  This should *not* include the 'top' and 'max' parameters.  These
will be automatically added as needed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Description**
A friendly description of the operation being performed for logging and console
display purposes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **AcceptHeader**
Specify the media type in the Accept header.  Different types of commands may require
different media types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **AdditionalHeader**
Allows the caller to specify any number of additional headers that should be added to
all of the requests made.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |4       |false        |

#### **ApiVersion**
Indicates the version of this API that should be used. Format is: 'yyyy-MM-dd'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api as opposed to requesting a new one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **TelemetryEventName**
If provided, the successful execution of this REST command will be logged to telemetry
using this event name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **TelemetryProperties**
If provided, the successful execution of this REST command will be logged to telemetry
with these additional properties.  This will be silently ignored if TelemetryEventName
is not provided as well.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |8       |false        |

#### **TelemetryExceptionBucket**
If provided, any exception that occurs will be logged to telemetry using this bucket.
It's possible that users will wish to log exceptions but not success (by providing
TelemetryEventName) if this is being executed as part of a larger scenario.  If this
isn't provided, but TelemetryEventName *is* provided, then TelemetryEventName will be
used as the exception bucket value in the event of an exception.  If neither is specified,
no bucket value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **SinglePage**
By default, this function will automatically call any follow-up "nextLinks" provided by
the return value in order to retrieve the entire result set.  If this switch is provided,
only the first "page" of results will be retrieved, and the "nextLink" links will not be
followed.
WARNING: This might take a while depending on how many results there are.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [PSCustomObject[]] - The result of the REST operation, in whatever form it comes in.

---

### Syntax
```PowerShell
Invoke-GHRestMethodMultipleResult [-UriFragment] <String> [-Description] <String> [[-AcceptHeader] <String>] [[-AdditionalHeader] <Hashtable>] [[-ApiVersion] <String>] [[-AccessToken] <String>] [[-TelemetryEventName] <String>] [[-TelemetryProperties] <Hashtable>] [[-TelemetryExceptionBucket] <String>] [-SinglePage] [<CommonParameters>]
```
