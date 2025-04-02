Invoke-Snitch
-------------

### Synopsis
Describe purpose of "Invoke-Snitch" in 1-2 sentences.

---

### Description

Add a more complete description of what the function does.

---

### Related Links
* [URLs to related sites
The first link is opened by Get-Help -Online Invoke-Snitch](URLs to related sites
The first link is opened by Get-Help -Online Invoke-Snitch)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-Snitch -strMessage Value
Describe what this call does
```

---

### Parameters
#### **strMessage**
This is a required variable. Message that is sent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
Requires a string message.

---

### Outputs
* Void.

---

### Notes
Requires that you set, somewhere in your environment: smtphost, emailto, emailfrom, and emailsubject

---

### Syntax
```PowerShell
Invoke-Snitch [-strMessage] <String> [<CommonParameters>]
```
