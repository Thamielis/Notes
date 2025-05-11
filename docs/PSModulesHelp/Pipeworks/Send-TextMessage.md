Send-TextMessage
----------------

### Synopsis
Sends text messages

---

### Description

Sends text messages with twilio

---

### Related Links
* [Twilio.com](Twilio.com)

* [Get-TextMessage](Get-TextMessage)

---

### Examples
Looks up a phone number location and texts the url of a map to that #

```PowerShell
Search-WolframAlpha -For "1-206-607-6555" -ApiKeySetting WolframAlphaApiKey | 
    Select-Object -ExpandProperty Map | 
    Send-TextMessage -To "1-206-555-1212" -From "1-206-607-6555" -Body { $_ }
```

---

### Parameters
#### **From**
The Phone Number the text will be sent from

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **To**
The Phone Number the text will be sent to

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Body**
The body of the text message

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Credential**
The credential used to get the texts

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |4       |true (ByPropertyName)|

#### **Setting**
A setting storing the credential

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Syntax
```PowerShell
Send-TextMessage [-From] <String> [-To] <String> [-Body] <String> [[-Credential] <PSCredential>] [[-Setting] <String[]>] [<CommonParameters>]
```
