New-VBRSNMPReceiver
-------------------

### Synopsis
Defines SNMP recipient settings.

---

### Description

This cmdlet creates the VBRSNMPReceiver object that defines recipients SNMP settings. You can define settings for 5 different recipients.

---

### Examples
> Defining SNMP Recepients Settings

New-VBRSNMPReceiver -ReceiverIP 172.17.53.28 -ReceiverPort 22 -CommunityString Public
This command defines the following SNMP recepients settings:
- An IP addresses of the SNMP recipient is set to 172.17.53.28.
- The port that Veeam Backup & Replication will use to send messages is set to 22.
- The community identifier is set to public.

---

### Parameters
#### **CommunityString**
Specifies the community identifier.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReceiverIP**
Specifies an IP addresses of the SNMP recipient.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ReceiverPort**
Specifies the port number that Veeam Backup & Replication will use to send messages.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRSNMPReceiver [-CommunityString <String>] -ReceiverIP <String> [-ReceiverPort <Int32>] [<CommonParameters>]
```
