Send-Email
----------

### Synopsis
Sends an email.

---

### Description

Sends an email, using exchange web services.

---

### Related Links
* [New-WebServiceProxy](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Management/New-WebServiceProxy)

---

### Examples
> EXAMPLE 1

```PowerShell
$office365Credential = Get-SecureSetting -Name Office365Cred -Type ([Management.Automation.PSCredential])
Send-Email -To "someone@somewhere.com" -Subject "Hello World" -Body "<b>Hello World</b>" -BodyAsHtml -IsOffice365Account -Credential $office365Credential
```
> EXAMPLE 2

```PowerShell
$office365Credential = Get-SecureSetting -Name Office365Cred -Type ([Management.Automation.PSCredential])
Send-Email -To "someone@somewhere.com" -Subject "Dinner:Free at Five?" -From "5PM" -To "6pm" -Location "Machiavelli's" -IsOffice365Account -Credential $office365Credential
```

---

### Parameters
#### **To**
The to address or addresses for the message

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **ReplyTo**
The replyTo email address

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attachment**
The path to any attachments

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PsPath |

#### **Cc**
Cc Addresses for the message

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Bcc**
The Bcc address for the message

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ResponseType**
The response type.  Used to send cancellations and acceptance.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|

#### **ItemClass**
The item class.  This parameter is set automatically in most cases, but can be used to send meeting cancellations or meeting accepts.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|

#### **Body**
The body of the message

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **BodyAsHtml**
If set, the body will be treated as HTML

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Switch]`|false   |named   |true (ByPropertyName)|BAH    |

#### **Encoding**
If set, will set the message encoding

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[Encoding]`|false   |named   |false        |BE     |

#### **DeliveryNotificationOption**
Delivery Notification Options.  Automatically generates a response mail
Valid Values:

* None
* OnSuccess
* OnFailure
* Delay
* Never

|Type                           |Required|Position|PipelineInput|Aliases|
|-------------------------------|--------|--------|-------------|-------|
|`[DeliveryNotificationOptions]`|false   |named   |false        |DNO    |

#### **From**
The from parameter.  If not set, from will automatically be set by exchange to be the logged-on user.
Users can only send mail as a user once they have send permissions

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Subject**
The subject line for the message

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|sub    |

#### **Sensitivity**
The message sensitivity
Valid Values:

* Normal
* Personal
* Private
* Confidential

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Category**
The category.  Any category can be used, but only the built-in categories are guaranteed to be color-coded in a client.
Built in categories have are named 'Color' Cateogry, for example, 'Blue Category' or 'Red Category'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Start**
The end time of th meeting

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **End**
The end time of the meeting.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **Location**
The location of the meeting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CalenderId**
The Calender Identifier.  This is used to

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PassThru**
If set, outputs the response object returned from the exchange web services

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExchangeServer**
The exchange server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Credential**
The credential used to connect

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **IsOffice365Account**
If set, will treat the account as an Office365 account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseWebConfiguration**
If set, will use the trio of web.config values for the connection:
* ExchangeServer, ExchangeUserName, ExchangePassword

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsJob**
If set, will create the email in a background job

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

* [Management.Automation.Job](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Job)

---

### Syntax
```PowerShell
Send-Email [[-To] <String[]>] [[-ReplyTo] <String[]>] [-Attachment <String[]>] [-Cc <String[]>] [-Bcc <String[]>] [-ResponseType <Object>] [-ItemClass <Object>] [[-Body] <String>] [-BodyAsHtml] [-Encoding <Encoding>] [-DeliveryNotificationOption {None | OnSuccess | OnFailure | Delay | Never}] [-From <String>] [[-Subject] <String>] [-Sensitivity <String>] [-Category <String[]>] [-Start <DateTime>] [-End <DateTime>] [-Location <String>] [-CalenderId <String>] [-PassThru] [-ExchangeServer <String>] [-Credential <PSCredential>] [-IsOffice365Account] [-UseWebConfiguration] [-AsJob] [<CommonParameters>]
```
