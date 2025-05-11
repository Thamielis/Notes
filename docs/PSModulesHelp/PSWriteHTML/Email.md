Email
-----

### Synopsis
Sends an email with specified parameters.

---

### Description

This function sends an email with the provided parameters including recipients, subject, content, and server settings.

---

### Parameters
#### **Email**
Specifies the ScriptBlock containing the email content and additional parameters.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **To**
Specifies the email addresses of the primary recipients.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **CC**
Specifies the email addresses of the carbon copy recipients.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **BCC**
Specifies the email addresses of the blind carbon copy recipients.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ReplyTo**
Specifies the email address to set as the reply-to address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **From**
Specifies the email address of the sender.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Subject**
Specifies the subject of the email.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AttachSelf**
Switch parameter to attach the email to itself.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |SelfAttach|

#### **AttachSelfName**
Specifies the name of the attached email.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Server**
Specifies the SMTP server for sending the email.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Username**
Specifies the username for authentication with the SMTP server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Port**
Specifies the port number for the SMTP server. Default is 587.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Password**
Specifies the password for authentication with the SMTP server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PasswordFromFile**
Switch parameter to indicate that the password is read from a file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PasswordAsSecure**
Switch parameter to treat the password as a secure string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SSL**
Switch parameter to enable SSL for the SMTP connection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Priority**
Specifies the priority of the email. Valid values are 'Low', 'Normal', or 'High'. Default is 'Normal'.
Valid Values:

* Low
* Normal
* High

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DeliveryNotifications**
Specifies the type of delivery notifications. Valid values are 'None', 'OnSuccess', 'OnFailure', 'Delay', or 'Never'. Default is 'None'.
Valid Values:

* None
* OnSuccess
* OnFailure
* Delay
* Never

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Encoding**
[Obsolete] Deprecated parameter. Encoding is set to UTF8 to prevent errors.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FilePath**
Specifies the file path for attachments.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Suppress**
Switch parameter to suppress sending the email.

|Type       |Required|Position|PipelineInput|Aliases|
|-----------|--------|--------|-------------|-------|
|`[Boolean]`|false   |named   |false        |Supress|

#### **Online**
Switch parameter to send the email online without saving it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OutputHTML**
Switch parameter to output the email content as HTML.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Syntax
```PowerShell
Email [[-Email] <ScriptBlock>] [-To <String[]>] [-CC <String[]>] [-BCC <String[]>] [-ReplyTo <String>] [-From <String>] [-Subject <String>] [-AttachSelf] [-AttachSelfName <String>] [-Server <String>] [-Username <String>] [-Port <Int32>] [-Password <String>] [-PasswordFromFile] [-PasswordAsSecure] [-SSL] [-Priority <String>] [-DeliveryNotifications <Object>] [-Encoding <String>] [-FilePath <String>] [-Suppress <Boolean>] [-Online] [-OutputHTML] [-WhatIf] [<CommonParameters>]
```
