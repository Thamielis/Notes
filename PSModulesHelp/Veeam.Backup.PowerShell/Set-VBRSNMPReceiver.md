Set-VBRSNMPReceiver
-------------------

### Synopsis
Modifies SNMP recipient settings.

---

### Description

This cmdlet modifies SNMP recipient settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSNMPReceiver](New-VBRSNMPReceiver)

---

### Examples
> Modifying SNMP Recipient Settings Recepient IP

$options = New-VBRSNMPReceiver -ReceiverIP 172.17.53.28 -ReceiverPort 22 -CommunityString public
Set-VBRSNMPReceiver -Receiver $options -ReceiverIP 172.17.53.23
This example shows how to modify an IP address of the SNMP recipient from 172.17.53.28 to 172.17.53.23.
Perform the following steps:
1. Run the New-VBRSNMPReceiver cmdlet. Specify the ReceiverIP, ReceiverPort and the CommunityString parameters. Save the result to the $options variable.
2. Run the Set-VBRSNMPReceiver cmdlet. Set the $options variable as the Receiver parameter value. Specify the ReceiverIP parameter value.

---

### Parameters
#### **CommunityString**
Specifies the community identifier. The cmdlet will modify this community identifier.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Receiver**
Specifies the SNMP recipient settings that you want to modify.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRSNMPReceiver]`|true    |named   |False        |

#### **ReceiverIP**
Specifies an IP addresses of the SNMP recipient. The cmdlet will modify this IP address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReceiverPort**
Specifies the port number that Veeam Backup & Replication will use to send messages. The cmdlet will modify this port number.

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
Set-VBRSNMPReceiver [-CommunityString <String>] -Receiver <VBRSNMPReceiver> [-ReceiverIP <String>] [-ReceiverPort <Int32>] [<CommonParameters>]
```
