Send-MailMessage
----------------

### Synopsis
Sends an email message.

---

### Description

The `Send-MailMessage` cmdlet sends an email message from within PowerShell.

You must specify a Simple Mail Transfer Protocol (SMTP) server or the `Send-MailMessage` command fails. Use the SmtpServer parameter or set the `$PSEmailServer` variable to a valid SMTP server. The value assigned to `$PSEmailServer` is the default SMTP setting for PowerShell. For more information, see about_Preference_Variables (../Microsoft.PowerShell.Core/About/about_Preference_Variables.md).

> [!WARNING] > The `Send-MailMessage` cmdlet is obsolete. This cmdlet doesn't guarantee secure connections to > SMTP servers. While there is no immediate replacement available in PowerShell, we recommend you do > not use `Send-MailMessage`. For more information, see > Platform Compatibility note DE0005 (https://aka.ms/SendMailMessage).

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-7.3&WT.mc_id=ps-gethelp)

* [about_Preference_Variables](about_Preference_Variables)

* [Get-Credential](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/Get-Credential)

---

### Examples
> Example 1: Send an email from one person to another person

$sendMailMessageSplat = @{
    From = 'User01 <user01@fabrikam.com>'
    To = 'User02 <user02@fabrikam.com>'
    Subject = 'Test mail'
}
Send-MailMessage @sendMailMessageSplat
The `Send-MailMessage` cmdlet uses the From parameter to specify the message's sender. The To parameter specifies the message's recipient. The Subject parameter uses the text string Test mail as the message because the optional Body parameter isn't included.
> Example 2: Send an attachment

$sendMailMessageSplat = @{
    From = 'User01 <user01@fabrikam.com>'
    To = 'User02 <user02@fabrikam.com>', 'User03 <user03@fabrikam.com>'
    Subject = 'Sending the Attachment'
    Body = "Forgot to send the attachment. Sending now."
    Attachments = '.\data.csv'
    Priority = 'High'
    DeliveryNotificationOption = 'OnSuccess', 'OnFailure'
    SmtpServer = 'smtp.fabrikam.com'
}
Send-MailMessage @sendMailMessageSplat
The `Send-MailMessage` cmdlet uses the From parameter to specify the message's sender. The To parameter specifies the message's recipients. The Subject parameter describes the content of the message. The Body parameter is the content of the message.

The Attachments parameter specifies the file in the current directory that's attached to the email message. The Priority parameter sets the message to `High` priority. The DeliveryNotificationOption parameter specifies two values, `OnSuccess` and `OnFailure`. The sender will receive email notifications to confirm the success or failure of the message delivery. The SmtpServer parameter sets the SMTP server to `smtp.fabrikam.com`.
> Example 3: Send email to a mailing list

$sendMailMessageSplat = @{
    From = 'User01 <user01@fabrikam.com>'
    To = 'ITGroup <itdept@fabrikam.com>'
    Cc = 'User02 <user02@fabrikam.com>'
    Bcc = 'ITMgr <itmgr@fabrikam.com>'
    Subject = "Don't forget today's meeting!"
    Credential = 'domain01\admin01'
    UseSsl = $true
}
Send-MailMessage @sendMailMessageSplat
The `Send-MailMessage` cmdlet uses the From parameter to specify the message's sender. The To parameter specifies the message's recipients. The Cc parameter sends a copy of the message to the specified recipient. The Bcc parameter sends a blind copy of the message. A blind copy is an email address that's hidden from the other recipients. The Subject parameter is the message because the optional Body parameter isn't included.

The Credential parameter specifies a domain administrator's credentials are used to send the message. The UseSsl parameter specifies that Secure Socket Layer (SSL) creates a secure connection.

---

### Parameters
#### **Attachments**
Specifies the path and file names of files to be attached to the email message. You can use this parameter or pipe the paths and file names to `Send-MailMessage`.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[System.String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Bcc**
Specifies the email addresses that receive a copy of the mail but aren't listed as recipients of the message. Enter names (optional) and the email address, such as `Name <someone@fabrikam.com>`.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[System.String[]]`|false   |named   |True (ByPropertyName)|

#### **Body**
Specifies the content of the email message.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[System.String]`|false   |2       |True (ByPropertyName)|

#### **BodyAsHtml**
Specifies that the value of the Body parameter contains HTML.

|Type                                   |Required|Position|PipelineInput        |
|---------------------------------------|--------|--------|---------------------|
|`[System.Management.Automation.Switch]`|false   |named   |True (ByPropertyName)|

#### **Cc**
Specifies the email addresses to which a carbon copy (CC) of the email message is sent. Enter names (optional) and the email address, such as `Name <someone@fabrikam.com>`.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[System.String[]]`|false   |named   |True (ByPropertyName)|

#### **Credential**
Specifies a user account that has permission to perform this action. The default is the current user.
Type a user name, such as User01 or Domain01\User01 . Or, enter a PSCredential object, such as one from the `Get-Credential` cmdlet.
Credentials are stored in a PSCredential (/dotnet/api/system.management.automation.pscredential)object and the password is stored as a SecureString (/dotnet/api/system.security.securestring).
> [!NOTE] > For more information about SecureString data protection, see > How secure is SecureString? (/dotnet/api/system.security.securestring#how-secure-is-securestring).

|Type                                         |Required|Position|PipelineInput        |
|---------------------------------------------|--------|--------|---------------------|
|`[System.Management.Automation.PSCredential]`|false   |named   |True (ByPropertyName)|

#### **DeliveryNotificationOption**
Specifies the delivery notification options for the email message. You can specify multiple values. None is the default value. The alias for this parameter is DNO .
The delivery notifications are sent to the address in the From parameter.
The acceptable values for this parameter are as follows:
* `None`: No notification.
* `OnSuccess`: Notify if the delivery is successful.
* `OnFailure`: Notify if the delivery is unsuccessful.
* `Delay`: Notify if the delivery is delayed.
* `Never`: Never notify.
These values are defined as a flag-based enumeration. You can combine multiple values together to set multiple flags using this parameter. The values can be passed to the DeliveryNotification parameter as an array of values or as a comma-separated string of those values. The cmdlet will combine the values using a binary-OR operation. Passing values as an array is the simplest option and also allows you to use tab-completion on the values.

|Type                                           |Required|Position|PipelineInput        |
|-----------------------------------------------|--------|--------|---------------------|
|`[System.Net.Mail.DeliveryNotificationOptions]`|false   |named   |True (ByPropertyName)|

#### **Encoding**
Specifies the type of encoding for the target file. The default value is `utf8NoBOM`.
The acceptable values for this parameter are as follows:
* `ascii`: Uses the encoding for the ASCII (7-bit) character set.
* `bigendianunicode`: Encodes in UTF-16 format using the big-endian byte order.
* `bigendianutf32`: Encodes in UTF-32 format using the big-endian byte order.
* `oem`: Uses the default encoding for MS-DOS and console programs.
* `unicode`: Encodes in UTF-16 format using the little-endian byte order.
* `utf7`: Encodes in UTF-7 format.
* `utf8`: Encodes in UTF-8 format.
* `utf8BOM`: Encodes in UTF-8 format with Byte Order Mark (BOM)
* `utf8NoBOM`: Encodes in UTF-8 format without Byte Order Mark (BOM)
* `utf32`: Encodes in UTF-32 format.
Beginning with PowerShell 6.2, the Encoding parameter also allows numeric IDs of registered code pages (like `-Encoding 1251`) or string names of registered code pages (like `-Encoding "windows-1251"`). For more information, see the .NET documentation for Encoding.CodePage (/dotnet/api/system.text.encoding.codepage?view=netcore-2.2).

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[System.Text.Encoding]`|false   |named   |True (ByPropertyName)|

#### **From**
The From parameter is required. This parameter specifies the sender's email address. Enter a name (optional) and email address, such as `Name <someone@fabrikam.com>`.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[System.String]`|true    |named   |True (ByPropertyName)|

#### **Port**
Specifies an alternate port on the SMTP server. The default value is 25, which is the default SMTP port.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[System.Int32]`|false   |named   |True (ByPropertyName)|

#### **Priority**
Specifies the priority of the email message. Normal is the default. The acceptable values for this parameter are Normal, High, and Low.

|Type                            |Required|Position|PipelineInput        |
|--------------------------------|--------|--------|---------------------|
|`[System.Net.Mail.MailPriority]`|false   |named   |True (ByPropertyName)|

#### **ReplyTo**
Specifies additional email addresses (other than the From address) to use to reply to this message. Enter names (optional) and the email address, such as `Name <someone@fabrikam.com>`.
This parameter was introduced in PowerShell 6.2.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[System.String[]]`|false   |named   |True (ByPropertyName)|

#### **SmtpServer**
Specifies the name of the SMTP server that sends the email message.
The default value is the value of the `$PSEmailServer` preference variable. If the preference variable isn't set and this parameter isn't used, the `Send-MailMessage` command fails.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[System.String]`|false   |3       |True (ByPropertyName)|

#### **Subject**
The Subject parameter isn't required. This parameter specifies the subject of the email message.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[System.String]`|false   |1       |True (ByPropertyName)|

#### **To**
The To parameter is required. This parameter specifies the recipient's email address. Enter names (optional) and the email address, such as `Name <someone@fabrikam.com>`.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[System.String[]]`|true    |0       |True (ByPropertyName)|

#### **UseSsl**
The Secure Sockets Layer (SSL) protocol is used to establish a secure connection to the remote computer to send mail. By default, SSL isn't used.

|Type                                   |Required|Position|PipelineInput        |
|---------------------------------------|--------|--------|---------------------|
|`[System.Management.Automation.Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String

You can pipe the path and file names of attachments to this cmdlet.

---

### Outputs
* None

---

### Notes
The `Send-MailMessage` cmdlet is obsolete. For more information, see Platform Compatibility note DE0005 (https://aka.ms/SendMailMessage). This cmdlet doesn't guarantee secure connections to SMTP servers. DE0005 suggests using the third-party library, MailKit (https://github.com/jstedfast/MimeKit). If you are using Exchange Online, you can use the Send-MgUserMail (/powershell/module/microsoft.graph.users.actions/send-mgusermail)from the Microsoft Graph PowerShell SDK.

---

### Syntax
```PowerShell
Send-MailMessage [-To] <System.String[]> [[-Subject] <System.String>] [[-Body] <System.String>] [[-SmtpServer] <System.String>] [-Attachments <System.String[]>] [-Bcc <System.String[]>] [-BodyAsHtml] [-Cc <System.String[]>] [-Credential <System.Management.Automation.PSCredential>] [-DeliveryNotificationOption {None | OnSuccess | OnFailure | Delay | Never}] [-Encoding {ASCII | BigEndianUnicode | BigEndianUTF32 | OEM | Unicode | UTF7 | UTF8 | UTF8BOM | UTF8NoBOM | UTF32}] -From <System.String> [-Port <System.Int32>] [-Priority {Normal | High | Low}] [-ReplyTo <System.String[]>] [-UseSsl] [<CommonParameters>]
```
