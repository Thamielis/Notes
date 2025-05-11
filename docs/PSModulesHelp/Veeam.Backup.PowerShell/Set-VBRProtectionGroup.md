Set-VBRProtectionGroup
----------------------

### Synopsis
Modifies protection groups.

---

### Description

This cmdlet modifies settings of a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [New-VBRIndividualComputerCustomCredentials](New-VBRIndividualComputerCustomCredentials)

* [Set-VBRIndividualComputerContainer](Set-VBRIndividualComputerContainer)

---

### Examples
> Adding Computer to Protection Group

$group = Get-VBRProtectionGroup -Name Computers
$comp = $group.Container.CustomCredentials
$supervisor = New-VBRIndividualComputerCustomCredentials -HostName support.east.local -Credentials support\jsmith
$comp += $supervisor
$newcomp = Set-VBRIndividualComputerContainer -Container $group.Container -CustomCredentials $comp
Set-VBRProtectionGroup -ProtectionGroup $group -Container $newcomp
This example shows how to add a computer to an existing protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Use the Container.CustomCredentials property of the $group variable. Save the result to the $comp variable.
3. Run the New-VBRIndividualComputerCustomCredentials cmdlet. Specify the HostName and the Credentials parameter values. Save the result to the $supervisor variable.
4. Add the computer to the group of computers in the $comp variable. Use the += operator.
5. Run the Set-VBRIndividualComputerContainer cmdlet. Set the Container property of the $group variable as the Container parameter value. Set the $comp variable as the CustomCredentials parameter value. Save the result to the $newcomp variable.
6. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $newcomp variable as the Container parameter value.

---

### Parameters
#### **AdvancedOptions**
Specifies settings for Veeam Agent for Windows deployed on computers in the protection group. You can specify the following settings:
* Network usage settings
* Throttling settings
* Security settings

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupAdvancedWindowsOptions]`|false   |named   |False        |

#### **Container**
Specifies the protection scope. The protection scope can contain Active Directory objects, individual computers or computers imported from a CSV file. The cmdlet will create the protection group with this protection scope.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupContainer]`|false   |named   |False        |

#### **DeploymentOptions**
Specifies Veeam Agent deployment settings. The cmdlet will use these settings to install Veeam Agent on the discovered computers in the protection group.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupDeploymentOptions]`|false   |named   |False        |

#### **Description**
Specifies the description of the protection group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the protection group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for the protection group.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupNotificationOptions]`|false   |named   |False        |

#### **ProtectionGroup**
Specifies the protection group you want to modify.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ScheduleOptions**
Specifies the discovery schedule. The cmdlet will use this schedule to perform discovery operations for computers in the protection group.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupScheduleOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRProtectionGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRProtectionGroup [-AdvancedOptions <VBRProtectionGroupAdvancedWindowsOptions>] [-Container <VBRProtectionGroupContainer>] [-DeploymentOptions <VBRProtectionGroupDeploymentOptions>] [-Description <String>] 
```
```PowerShell
[-Name <String>] [-NotificationOptions <VBRProtectionGroupNotificationOptions>] -ProtectionGroup <VBRProtectionGroup> [-ScheduleOptions <VBRProtectionGroupScheduleOptions>] [<CommonParameters>]
```
