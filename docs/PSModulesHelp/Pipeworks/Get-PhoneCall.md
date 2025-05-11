Get-PhoneCall
-------------

### Synopsis
Gets information about phone calls

---

### Description

Gets information about phone calls sent to or from any Twilio Number

---

### Related Links
* [Send-PhoneCall](Send-PhoneCall)

* [Get-Web](Get-Web)

* [http://twilio.com/](http://twilio.com/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PhoneCall
```

---

### Parameters
#### **CallSid**
The call identifier

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|Sid    |

#### **Credential**
The Twilio credential

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

#### **Status**
The status of the phone call
Valid Values:

* queued
* ringing
* in-progress
* completed
* failed
* busy
* no-answer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **To**
The number the phone call was sent to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **From**
The number the phone call came from

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Setting**
Twilio connection settings

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |6       |true (ByPropertyName)|

#### **IncludeRecording**
If set, will include the recording information with the call

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeTranscript**
If set, will include transcription information with the call

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-PhoneCall [[-CallSid] <String>] [[-Credential] <PSCredential>] [[-Status] <String>] [[-To] <String>] [[-From] <String>] [[-Setting] <String[]>] [-IncludeRecording] [-IncludeTranscript] [<CommonParameters>]
```
