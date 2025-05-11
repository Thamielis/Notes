Set-VBRSNMPOptions
------------------

### Synopsis
Modifies global SNMP settings.

---

### Description

This cmdlet modifies global SNMP settings. You can run this cmdlet, if you want to add SNMP recipient settings to the global SNMP settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSNMPReceiver](New-VBRSNMPReceiver)

---

### Examples
> Modifying Global SNMP Settings

$recipient = New-VBRSNMPReceiver -ReceiverIP 172.17.53.28 -ReceiverPort 22 -CommunityString public
Set-VBRSNMPOptions -Receiver $recipient
ReceiverIP   ReceiverPort CommunityString
----------   ------------ ---------------
172.17.53.28           22 public
This example shows how to add the following SNMP settings to the global SNMP settings:
- An IP addresses of the SNMP recipient is set to 172.17.53.28.
- The port that Veeam Backup & Replication will use to send messages is set to 22.
- The community identifier is set to public.
Perform the following steps:
1. Run the New-VBRSNMPReceiver cmdlet. Specify the ReceiverIP, ReceiverPort and the CommunityString parameters. Save the result to the $recipient variable.
2. Run the Set-VBRSNMPReceiver cmdlet. Set the $recipient variable as the Receiver parameter value.
The cmdlet output will contain the following SNMP settings: ReceiverIP, ReceiverPort and the CommunityString.

---

### Parameters
#### **Receiver**
Specifies an array of IP addresses of the SNMP recipient.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRSNMPReceiver[]]`|true    |named   |False        |

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
Set-VBRSNMPOptions -Receiver <VBRSNMPReceiver[]> [<CommonParameters>]
```
