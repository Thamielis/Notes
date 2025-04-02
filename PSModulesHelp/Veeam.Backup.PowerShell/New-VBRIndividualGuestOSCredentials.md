New-VBRIndividualGuestOSCredentials
-----------------------------------

### Synopsis
Defines a user account that will be explicitly used to connect to specific machine guest OSes.

---

### Description

This cmdlet defines a user account that will be explicitly used to connect to the specific machine guest OS.
This account must have local Administrator privileges on this machine guest OS.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Defining User Account To Connect to VM Guest OS

$vm = Find-VBRViEntity -Name "WinSrv2073"
$credentials = Get-VBRCredentials -Name "CDP Admin"
New-VBRIndividualGuestOSCredentials -IndividualMachine $vm -MachineCredentials $credentials
This example shows how to use the CDP Admin user account to connect to the WinSrv2073 VM guest OS.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
3. Run the New-VBRIndividualGuestOSCredentials cmdlet. Set the $vm variable as the IndividualMachine parameter value. Set the $credentials variable as the MachineCredentials parameter value.

---

### Parameters
#### **IndividualMachine**
Specifies a machine to which guest OS you want to connect.
Accepts the Object object. To create this object, run the Find-VBRViEntity cmdlet.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|true    |named   |True (ByPropertyName, ByValue)|

#### **MachineCredentials**
Specifies credentials of a user account that the cmdlet will use to connect to a machine guest OS.
Accepts the CCredentials object. To create this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRIndividualGuestOSCredentials -IndividualMachine <Object> -MachineCredentials <CCredentials> [<CommonParameters>]
```
