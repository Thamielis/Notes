Send-PhoneCall
--------------

### Synopsis
Sends phone calls

---

### Description

Sends phone calls messages with twilio

---

### Related Links
* [Twilio.com](Twilio.com)

* [Get-PhoneCall](Get-PhoneCall)

---

### Examples
> EXAMPLE 1

```PowerShell
Send-PhoneCall -From 12065551212 -To 12065551212 -Url http://start-automating.com/Receive-CallToStartAutomating
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

#### **Url**
The body of the text message

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|true    |3       |true (ByPropertyName)|

#### **SendDigit**
Send digits after connecting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Credential**
The Twilio credential

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |5       |true (ByPropertyName)|

#### **Setting**
A setting storing the credential

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |6       |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Syntax
```PowerShell
Send-PhoneCall [-From] <String> [-To] <String> [-Url] <Uri> [[-SendDigit] <String>] [[-Credential] <PSCredential>] [[-Setting] <String[]>] [<CommonParameters>]
```
