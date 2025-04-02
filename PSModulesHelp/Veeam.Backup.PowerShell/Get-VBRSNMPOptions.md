Get-VBRSNMPOptions
------------------

### Synopsis
Returns global SNMP settings.

---

### Description

This cmdlet returns global SNMP settings.

---

### Examples
> Getting Global SNMP Settings

$options = Get-VBRSNMPOptions
$options.Receiver
ReceiverIP   ReceiverPort CommunityString
----------   ------------ ---------------
172.17.53.28           22 public
172.17.53.28           22 public
172.17.53.28           22 public
This example shows how to get global SNMP settings that are set up in your backup infrastructure.
Perform the following steps:
1. Run the Get-VBRSNMPOptions cmdlet. Save the result to the $options variable.
2. Provide the Receiver property of the $options variable.
The cmdlet output will contain the following details on the global SNMP settings: ReceiverIP, ReceiverPort and CommunityString.

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
Get-VBRSNMPOptions [<CommonParameters>]
```
