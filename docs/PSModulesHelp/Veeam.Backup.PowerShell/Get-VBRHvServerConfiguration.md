Get-VBRHvServerConfiguration
----------------------------

### Synopsis
Returns settings of Microsoft Hyper-V hosts added to the backup infrastructure.

---

### Description

This cmdlet returns the following settings of Microsoft Hyper-V hosts that are added to the backup infrastructure:
1. EnableCBT: Specifies changed block tracking settings.
- If set to True, the changed block tracking option is enabled.
- If set to False, the changed block tracking option is disabled.
2. EnableFailover: Specifies the failover option settings.
- If set to True, the failover option is enabled.
- If set to False, the failover option is disabled.
- Default: True.
3. ServerId: Specifies the Microsoft Hyper-V hosts ID.

For more information on settings of Microsoft Hyper-V hosts that are added to the backup infrastructure, see the Specify Settings for Connected Volumes section in the User Guide for Microsoft Hyper-V.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Getting Settings of Microsoft Hyper-V Host

$server = Get-VBRServer -Name hyperv09.tech.local
Get-VBRHvServerConfiguration -Server $server
EnableCBT                          EnableFailover ServerId
---------                          -------------- --------
     True                                    True 01e9fb70-42d8-4de3-b7ef-fcf7aa10cfaa
This example shows how to get settings of the hyperv09.tech.local Microsoft Hyper-V host that is added to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerConfiguration cmdlet. Set the $server variable as the Server parameter value.
The cmdlet output will contain the following settings: EnableCBT, EnableFailover and ServerId.

---

### Parameters
#### **Server**
Specifies a Microsoft Hyper-V host added to the backup infrastructure. The cmdlet will return details about this Hyper-V host.s

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRHvServerConfiguration -Server <CHost> [<CommonParameters>]
```
