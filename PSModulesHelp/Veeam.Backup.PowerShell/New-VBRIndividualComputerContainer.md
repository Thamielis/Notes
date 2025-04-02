New-VBRIndividualComputerContainer
----------------------------------

### Synopsis
Creates a scope of computers for a protection group.

---

### Description

This cmdlet creates the VBRIndividualComputerContainer object. This object contains a scope of computers. Use this object to create a protection group with the Add-VBRProtectionGroup cmdlet.

---

### Related Links
* [New-VBRIndividualComputerCustomCredentials](New-VBRIndividualComputerCustomCredentials)

* [Add-VBRProtectionGroup](Add-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Scope of Computers for Protection Group

$computers = @("172.19.51.53", "sup-v8931") | ForEach { New-VBRIndividualComputerCustomCredentials -HostName $_ -Credentials "support\jsmith" }
New-VBRIndividualComputerContainer -CustomCredentials $computers
This example shows how to create a scope of computers for a protection group.
Perform the followings steps:
1. Run the New-VBRIndividualComputerCustomCredentials cmdlet. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $computers variable.
2. Run the New-VBRIndividualComputerContainer cmdlet. Set the $computers variable as the CustomCredentials parameter value.
> Example 2. Creating Protection Group with Scope of Computers

$computers = @("172.19.51.53", "sup-v8931") | ForEach { New-VBRIndividualComputerCustomCredentials -HostName $_ -Credentials "support\jsmith" }
$compscope = New-VBRIndividualComputerContainer -CustomCredentials $computers
Add-VBRProtectionGroup -Name "Computers" -Container $compscope
This example shows how to create a protection group with a scope of computers.
Perform the following steps:
1. Create a scope of computers: - Run the New-VBRIndividualComputerCustomCredentials cmdlet. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $computers variable.
- Run the New-VBRIndividualComputerContainer cmdlet. Set the $computers variable as the CustomCredentials parameter value. Save the result to the $compscope variable.
2. Create a protection group. To do this, run the Add-VBRProtectionGroup cmdlet. Specify the Name parameter value. Set the $compscope variable as the Container parameter value.

---

### Parameters
#### **CustomCredentials**
Specifies computers and credentials for authenticating with them.

|Type                                        |Required|Position|PipelineInput                 |
|--------------------------------------------|--------|--------|------------------------------|
|`[VBRIndividualComputerCustomCredentials[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRIndividualComputerCustomCredentials[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRIndividualComputerContainer -CustomCredentials <VBRIndividualComputerCustomCredentials[]> [<CommonParameters>]
```
