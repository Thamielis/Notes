Add-VBRProtectionGroup
----------------------

### Synopsis
Creates protection groups in Veeam Backup & Replication.

---

### Description

This cmdlet creates protection groups.
Before creating a protection group, you must create a protection scope for this group. Protection groups can include the following objects: of Active Directory objects, individual computers or computers imported from a CSV file. For more information about the protection scope, see the following cmdlets:
- New-VBRADContainer
- New-VBRIndividualComputerContainer
- New-VBRCSVContainer

---

### Related Links
* [New-VBRIndividualComputerCustomCredentials](New-VBRIndividualComputerCustomCredentials)

* [New-VBRIndividualComputerContainer](New-VBRIndividualComputerContainer)

* [New-VBRPeriodicallyOptions](New-VBRPeriodicallyOptions)

* [New-VBRProtectionGroupScheduleOptions](New-VBRProtectionGroupScheduleOptions)

* [New-VBRProtectionGroupDeploymentOptions](New-VBRProtectionGroupDeploymentOptions)

---

### Examples
> Creating Protection Group

$computers = @("support.east.local", "qa.east.local", "adm-v8931") | ForEach { New-VBRIndividualComputerCustomCredentials -HostName $_ -Credentials "support\jsmith"}
$scope = New-VBRIndividualComputerContainer -CustomCredentials $computers
$periodically = New-VBRPeriodicallyOptions -FullPeriod 12 -PeriodicallyKind Hours
$schedule = New-VBRProtectionGroupScheduleOptions -PolicyType Periodically -PeriodicallyOptions $periodically
$deployment = New-VBRProtectionGroupDeploymentOptions -InstallAgent
Add-VBRProtectionGroup -Name "Support_East" -Container $scope -ScheduleOptions $schedule -DeploymentOptions $deployment
This example shows how to create a protection group with the following settings:
- The created protection group will include individual computers.
- Veeam Backup & Replication will discover computers in the protection group every 12 hours.
- Veeam Backup & Replication will automatically install Veeam Agent on all discovered computers of this protection group.
Perform the following steps:
1. Run the New-VBRIndividualComputerCustomCredentials cmdlet. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $computers variable.
2. Run the New-VBRIndividualComputerContainer cmdlet. Set the $computers variable as the CustomCredentials parameter value. Save the result to the $scope variable. 3. Run the New-VBRPeriodicallyOptions cmdlet. Specify the FullPeriod and the PeriodicallyKind parameter values. Save the result to the $periodically variable.
4. Run the New-VBRProtectionGroupScheduleOptions cmdlet. Set the Periodically value as the PolicyType parameter value. Set the $periodically variable as the PeriodicallyOptions parameter value. Save the result to the $schedule variable.
5. Run the New-VBRProtectionGroupDeploymentOptions cmdlet. Provide the InstallAgent parameter. Save the result to the $deployment variable.
6. Run the Add-VBRProtectionGroup cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $scope variable as the Container parameter value.
- Set the $schedule variable as the ScheduleOptions parameter value.
- Set the $deployment variable as the DeploymentOptions parameter value.

---

### Parameters
#### **AdvancedOptions**
Specifies settings for Veeam Agent for Windows deployed on computers in the protection group. You can specify the following settings:
* Network usage settings
* Throttling settings
* Security settings

|Type                                        |Required|Position|PipelineInput        |
|--------------------------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupAdvancedWindowsOptions]`|false   |named   |True (ByPropertyName)|

#### **Container**
Specifies the protection scope. The protection scope can contain Active Directory objects, individual computers or computers imported from a CSV file. The cmdlet will create the protection group with this protection scope.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroupContainer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **DeploymentOptions**
Specifies Veeam Agent deployment settings. The cmdlet will use these settings to install Veeam Agent on the discovered computers in the protection group.

|Type                                   |Required|Position|PipelineInput        |
|---------------------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupDeploymentOptions]`|false   |named   |True (ByPropertyName)|

#### **Description**
Specifies the description of the protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **Name**
Specifies the name you want to assign to the protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **NotificationOptions**
Specifies notification settings for the protection group.

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupNotificationOptions]`|false   |named   |True (ByPropertyName)|

#### **ScheduleOptions**
Specifies the discovery schedule. The cmdlet will use this schedule to perform discovery operations for computers in the protection group.

|Type                                 |Required|Position|PipelineInput        |
|-------------------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupScheduleOptions]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupContainer

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupScheduleOptions

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupDeploymentOptions

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupAdvancedWindowsOptions

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupNotificationOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRProtectionGroup [-AdvancedOptions <VBRProtectionGroupAdvancedWindowsOptions>] -Container <VBRProtectionGroupContainer> [-DeploymentOptions <VBRProtectionGroupDeploymentOptions>] [-Description <String>] 
```
```PowerShell
-Name <String> [-NotificationOptions <VBRProtectionGroupNotificationOptions>] [-ScheduleOptions <VBRProtectionGroupScheduleOptions>] [<CommonParameters>]
```
