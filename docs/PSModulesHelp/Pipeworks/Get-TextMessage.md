Get-TextMessage
---------------

### Synopsis
Gets text messages

---

### Description

Get text messages sent to a Twilio number

---

### Related Links
* [Twilio.com](Twilio.com)

* [Send-TextMessage](Send-TextMessage)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-TextMessage
```

---

### Parameters
#### **Credential**
The credential used to get the texts

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |1       |true (ByPropertyName)|

#### **Setting**
A setting storing the credential

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-TextMessage [[-Credential] <PSCredential>] [[-Setting] <String[]>] [<CommonParameters>]
```
