Get-GitHubConfiguration
-----------------------

### Synopsis
Gets the currently configured value for the requested configuration setting.

---

### Description

Gets the currently configured value for the requested configuration setting.

Always returns the value for this session, which may or may not be the persisted
setting (that all depends on whether or not the setting was previously modified
during this session using Set-GitHubConfiguration -SessionOnly).

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Get-GitHubConfiguration -Name WebRequestTimeoutSec
Gets the currently configured value for WebRequestTimeoutSec for this PowerShell session
(which may or may not be the same as the persisted configuration value, depending on
whether this value was modified during this session with Set-GitHubConfiguration -SessionOnly).

---

### Parameters
#### **Name**
The name of the configuration whose value is desired.
Valid Values:

* ApiHostName
* ApplicationInsightsKey
* DefaultOwnerName
* DefaultPassThru
* DefaultRepositoryName
* DisableLogging
* DisablePiiProtection
* DisablePipelineSupport
* DisableSmarterObjects
* DisableTelemetry
* DisableUpdateCheck
* LogPath
* LogProcessId
* LogRequestBody
* LogTimeAsUtc
* MaximumRetriesWhenResultNotReady
* MultiRequestProgressThreshold
* RetryDelaySeconds
* StateChangeDelaySeconds
* SuppressNoTokenWarning
* SuppressTelemetryReminder
* TestConfigSettingsHash
* WebRequestTimeoutSec

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-GitHubConfiguration [-Name] <String> [<CommonParameters>]
```
