New-VBRProtectionGroupAdvancedWindowsOptions
--------------------------------------------

### Synopsis
Creates additional settings for Veeam Agent for Microsoft Windows.

---

### Description

This cmdlet creates the VBRProtectionGroupAdvancedWindowsOptions object. This object contains additional settings for Veeam Agent for Microsoft Windows machines. These settings will be applied to Veeam Agent deployed on computers added to a protection group. You can specify the following types of settings:
- Network usage settings
- Throttling settings
- Security settings
To apply the settings to an existing protection group, save the VBRProtectionGroupAdvancedWindowsOptions object to the variable and run the Set-VBRProtectionGroup cmdlet.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Additional Settings for Microsoft Windows Machines

New-VBRProtectionGroupAdvancedWindowsOptions -EnableBandwidthThrottling -BandwidthThrottlingValue 20  -BandwidthThrottlingUnitType MbytePerSec -DisableBackupOverMeteredConnection:$false  -EnableAgentThrottling -ThrottleAgentOn AllHosts -EnableFLRWithoutAdministrativeAccount
This command creates additional settings for Veeam Agent for Microsoft Windows machines. The additional settings will have the following options:
- Bandwidth limit is enabled and set to 20 megabytes per second.
- Backup over metered connections option is enabled.
- Throttling for Veeam Agent activities is enabled on all machines.
- Users without administrative privileges will be able to perform the file-level restore on Veeam Agent computers.
> Example 2. Applying Additional Settings to Protection Group

$options = New-VBRProtectionGroupAdvancedWindowsOptions -EnableBandwidthThrottling -BandwidthThrottlingValue 20 -BandwidthThrottlingUnitType MbytePerSec -DisableBackupOverMeteredConnection:$false -EnableAgentThrottling -ThrottleAgentOn AllHosts -EnableFLRWithoutAdministrativeAccount
$group = Get-VBRProtectionGroup -Name "Windows machines"
Set-VBRProtectionGroup -ProtectionGroup $group -AdvancedOptions $options
This example shows how to create additional settings for the protection group and apply these settings to the Windows machines protection group.
Perform the following steps:
1. Run the New-VBRProtectionGroupAdvancedWindowsOptions cmdlet. Specify the necessary parameters. Save the result to the $options variable.
2. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
3. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $options variable as the AdvancedOptions parameter value.

---

### Parameters
#### **BandwidthThrottlingUnitType**
Specifies the measure units for measure limit. You can select the following type of measure units:
* MbitPerSec: for megabit per second unit
* MbytePerSec: for megabyte per second unit
* KbytePerSec: for kilobyte per second unit
Valid Values:

* MbitPerSec
* MbytePerSec
* KbytePerSec

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[VBRSpeedUnit]`|false   |named   |True (ByPropertyName)|

#### **BandwidthThrottlingValue**
Specifies the bandwidth limit value.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **DisableBackupOverMeteredConnection**
Defines that backup over metered connections will be disabled.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **DisableBackupOverVPNConnections**
Defines that backup over VPN connections will be disabled.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnableAgentThrottling**
Enables throttling for Veeam Agent activities during backup.
Use the ThrottleAgentOn parameter to specify the type of computers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnableBandwidthThrottling**
Enables the bandwidth limit.
Use the BandwidthThrottlingValue and the BandwidthThrottlingUnitType parameters to set the value and the unit type for bandwidth limit.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnableFLRWithoutAdministrativeAccount**
Defines that users without administrative privileges will be able to perform file-level restore on Veeam Agent computers.
Note: This parameter works only for backups located on Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **ThrottleAgentOn**
Specifies the type of computers. Veeam Backup & Replication will throttle Veeam Agent activities during backup on computers of these types.
You can select one of the following types of the computers:
* Workstations
* Servers
* AllHosts
Valid Values:

* Workstations
* Servers
* AllHosts

|Type                        |Required|Position|PipelineInput        |
|----------------------------|--------|--------|---------------------|
|`[VBREpThrottlingAgentType]`|false   |named   |True (ByPropertyName)|

#### **UseSpecifiedWiFiNetworks**
Defines that Veeam Backup & Replication will restrict the WiFi usage to the specified networks.
Use the WiFiNetworks parameter to specify the networks over which backup will be allowed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **WiFiNetworks**
Specifies the SSID of the Wi-Fi network. Veeam Agent will perform backup over the specified SSID only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Management.Automation.SwitchParameter

System.Int32

Veeam.Backup.PowerShell.Infos.VBRSpeedUnit

System.String[]

Veeam.Backup.PowerShell.Infos.VBREpThrottlingAgentType

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
To apply the settings to an existing protection group, save the VBRProtectionGroupAdvancedWindowsOptions object to the variable and run the Set-VBRProtectionGroup cmdlet.

---

### Syntax
```PowerShell
New-VBRProtectionGroupAdvancedWindowsOptions [-BandwidthThrottlingUnitType {MbitPerSec | MbytePerSec | KbytePerSec}] [-BandwidthThrottlingValue <Int32>] [-DisableBackupOverMeteredConnection] 
```
```PowerShell
[-DisableBackupOverVPNConnections] [-EnableAgentThrottling] [-EnableBandwidthThrottling] [-EnableFLRWithoutAdministrativeAccount] [-ThrottleAgentOn {Workstations | Servers | AllHosts}] 
```
```PowerShell
[-UseSpecifiedWiFiNetworks] [-WiFiNetworks <String[]>] [<CommonParameters>]
```
