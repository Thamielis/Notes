Set-VBRIndividualComputerContainer
----------------------------------

### Synopsis
Modifies a scope of individual computers.

---

### Description

This cmdlet modifies the VBRIndividualComputerContainer object. This object contains the scope of computers you want to add to a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRIndividualComputerCustomCredentials](New-VBRIndividualComputerCustomCredentials)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Adding Computer to Protection Group

$group = Get-VBRProtectionGroup -Name Computers
$comp = $group.Container.CustomCredentials
$supervisor = New-VBRIndividualComputerCustomCredentials -HostName support.east.local -Credentials support\jsmith
$comp += $supervisor
$newcomp = Set-VBRIndividualComputerContainer -Container $group.Container -CustomCredentials $comp
Set-VBRProtectionGroup -ProtectionGroup $group -Container $newcomp
This example shows how to add a computer to the Computers protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Get individual computers. Use the Container.CustomCredentials property of the $group variable. Save the result to the $comp variable.
3. Run the New-VBRIndividualComputerCustomCredentials cmdlet. Specify the HostName and the Credentials parameter values. Save the result to the $supervisor variable.
4. Add the computer to the group of computers in the $comp variable. Use the += operator.
5. Run the Set-VBRIndividualComputerContainer cmdlet. Set the Container property of the $group variable as the Container parameter value. Set the $comp variable as the CustomCredentials parameter value. Save the result to the $newcomp variable.
6. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $newcomp variable as the Container parameter value.

---

### Parameters
#### **Container**
Specifies the scope of computers you want to add to a protection group.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRIndividualComputerContainer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **CustomCredentials**
Specifies individual computers and credentials for authenticating with them.

|Type                                        |Required|Position|PipelineInput        |
|--------------------------------------------|--------|--------|---------------------|
|`[VBRIndividualComputerCustomCredentials[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRIndividualComputerContainer

Veeam.Backup.PowerShell.Infos.VBRIndividualComputerCustomCredentials[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRIndividualComputerContainer -Container <VBRIndividualComputerContainer> [-CustomCredentials <VBRIndividualComputerCustomCredentials[]>] [<CommonParameters>]
```
