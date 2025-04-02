Set-GitHubConfiguration
-----------------------

### Synopsis
Change the value of a configuration property for the PowerShellForGitHub module,
for the session only, or globally for this user.

---

### Description

Change the value of a configuration property for the PowerShellForGitHub module,
for the session only, or globally for this user.

A single call to this method can set any number or combination of properties.

To change any of the boolean/switch properties to false, specify the switch,
immediately followed by ":$false" with no space.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubConfiguration -WebRequestTimeoutSec 120 -SuppressNoTokenWarning
Changes the timeout permitted for a web request to two minutes, and additionally tells
the module to never warn about no Access Token being configured.  These settings will be
persisted across future PowerShell sessions.
```
> EXAMPLE 2

```PowerShell
Set-GitHubConfiguration -DisableLogging -SessionOnly
Disables the logging of any activity to the logfile specified in LogPath, but for this
session only.
```
> EXAMPLE 3

```PowerShell
Set-GitHubConfiguration -ApiHostName "github.contoso.com"
Sets all requests to connect to a GitHub Enterprise server running at
github.contoso.com.
```

---

### Parameters
#### **ApiHostName**
The hostname of the GitHub instance to communicate with. Defaults to 'github.com'. Provide a
different hostname when using a GitHub Enterprise server. Do not include the HTTP/S prefix,
and do not include 'api'. For example, use "github.contoso.com".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ApplicationInsightsKey**
Change the Application Insights instance that telemetry will be reported to (if telemetry
hasn't been disabled via DisableTelemetry).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultOwnerName**
The owner name that should be used with a command that takes OwnerName as a parameter
when no value has been supplied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultPassThru**
Sets what the default PassThru behavior should be for commands that have a PassThru
switch.  By default, those commands will not return the result of the command unless
the user passes in -PassThru.  By setting this value to $true, those commands will
always behave as if -PassThru had been specified, unless you explicitly specify
-PassThru:$false on an individual command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultRepositoryName**
The repository name that should be used with a command that takes RepositoryName as a parameter
when no value has been supplied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DisableLogging**
Specify this switch to stop the module from logging all activity to a log file located
at the location specified by LogPath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisablePiiProtection**
Specify this switch to disable the hashing of potential PII data prior to submitting the
data to telemetry (if telemetry hasn't been disabled via DisableTelemetry).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisablePipelineSupport**
By default, this module will modify all objects returned by the API calls by adding
additional, consistent properties to those objects which ease pipelining those objects
into other functions.  This is highly convenient functionality.  You would only want to
disable this functionality if you are experiencing some edge case problems and are awaiting
a proper fix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSmarterObjects**
By default, this module will modify all objects returned by the API calls to update
any properties that can be converted to objects (like strings for Date/Time's being
converted to real DateTime objects).  Enable this property if you desire getting back
the unmodified version of the object from the API.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableTelemetry**
Specify this switch to stop the module from reporting any of its usage (which would be used
for diagnostics purposes).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableUpdateCheck**
Specify this switch to stop the daily update check with PowerShellGallery which can
inform you when there is a newer version of this module available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LogPath**
The location of the log file that all activity will be written to if DisableLogging remains
$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LogProcessId**
If specified, the Process ID of the current PowerShell session will be included in each
log entry.  This can be useful if you have concurrent PowerShell sessions all logging
to the same file, as it would then be possible to filter results based on ProcessId.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LogRequestBody**
If specified, the JSON body of the REST request will be logged to verbose output.
This can be helpful for debugging purposes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LogTimeAsUtc**
If specified, all times logged will be logged as UTC instead of the local timezone.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaximumRetriesWhenResultNotReady**
Some API requests may take time for GitHub to gather the results, and in the interim,
a 202 response is returned.  This value indicates the maximum number of times that the
query will be retried before giving up and failing.  The amount of time between each of
these requests is controlled by the RetryDelaySeconds configuration value.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MultiRequestProgressThreshold**
Some commands may require sending multiple requests to GitHub.  In some situations,
getting the entirety of the request might take 70+ requests occurring over 20+ seconds.
A progress bar will be shown (displaying which sub-request is being executed) if the number
of requests required to complete this command is greater than or equal to this configuration
value.
Set to 0 to disable this feature.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **RetryDelaySeconds**
The number of seconds to wait before retrying a command again after receiving a 202 response.
The number of times that a retry will occur is controlled by the
MaximumRetriesWhenResultNotReady configuration value.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **StateChangeDelaySeconds**
The number of seconds to wait before returning the result after executing a command that
may result in a state change on the server.  This is intended to only be used during test
execution in order to increase reliability.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **SuppressNoTokenWarning**
If an Access Token has not been configured, this module will provide a warning to the user
informing them of this, once per session.  If it is expected that this module will regularly
be used without configuring an Access Token, specify this switch to always suppress that
warning message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SuppressTelemetryReminder**
When telemetry is enabled, a warning will be printed to the console once per session
informing users that telemetry is occurring.  Setting this value will suppress that
message from showing up ever again.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WebRequestTimeoutSec**
The number of seconds that should be allowed before an API request times out.  A value of
0 indicates an infinite timeout, however experience has shown that PowerShell doesn't seem
to always honor inifinite timeouts.  Hence, this value can be configured if need be.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **SessionOnly**
By default, this method will store the configuration values in a local file so that changes
persist across PowerShell sessions.  If this switch is provided, the file will not be
created/updated and the specified configuration changes will only remain in memory/effect
for the duration of this PowerShell session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Set-GitHubConfiguration [-ApiHostName <String>] [-ApplicationInsightsKey <String>] [-DefaultOwnerName <String>] [-DefaultPassThru <String>] [-DefaultRepositoryName <String>] [-DisableLogging] [-DisablePiiProtection] [-DisablePipelineSupport] [-DisableSmarterObjects] [-DisableTelemetry] [-DisableUpdateCheck] [-LogPath <String>] [-LogProcessId] [-LogRequestBody] [-LogTimeAsUtc] [-MaximumRetriesWhenResultNotReady <Int32>] [-MultiRequestProgressThreshold <Int32>] [-RetryDelaySeconds <Int32>] [-StateChangeDelaySeconds <Int32>] [-SuppressNoTokenWarning] [-SuppressTelemetryReminder] [-WebRequestTimeoutSec <Int32>] [-SessionOnly] [-WhatIf] [-Confirm] [<CommonParameters>]
```
