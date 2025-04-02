New-VBRDiscoveredComputerConfigurationOption
--------------------------------------------

### Synopsis
Creates new configuration options for Veeam Agent settings.
IMPORTANT! Make sure to test this cmdlet in the lab before you run it in the production environment.

---

### Description

This cmdlet creates the VBRDiscoveredComputerConfigurationOption object. This object contains new configuration options for Veeam Agent settings that you can distribute to discovered computers.

---

### Related Links
* [Add-VBRDiscoveredComputerConfigurationPolicy](Add-VBRDiscoveredComputerConfigurationPolicy)

* [Get-VBRDiscoveredComputerConfigurationPolicy](Get-VBRDiscoveredComputerConfigurationPolicy)

* [Remove-VBRDiscoveredComputerConfigurationPolicy](Remove-VBRDiscoveredComputerConfigurationPolicy)

---

### Examples
> Example 1. Allowing File-Level Restore Without Administrator Privileges on Windows Computers

```PowerShell
New-VBRDiscoveredComputerConfigurationOption -Name EnableUserFLR -Value 1
This command creates a new entry of the REG_DWORD type for the EnableUserFLR registry value on Microsoft Windows computers.
```
> Example 2. Restricting VPN Connections Usage on Windows Computers

```PowerShell
New-VBRDiscoveredComputerConfigurationOption -Name RestrictVpnNetworkAdapters -Value @("Cisco AnyConnect Secure Mobility Client Virtual Miniport Adapter for Windows", "Fortinet Virtual Ethernet Adapter","TAP-Windows Adapter")
This command creates a new entry of the REG_MULTI_SZ type for the RestrictVpnNetworkAdapters registry value on Microsoft Windows computers.
```
> Example 3. Defining Job Queue Maximum Capacity on Linux and Mac Computers

```PowerShell
New-VBRDiscoveredComputerConfigurationOption -Name "general.JobQueueCapacity" -Value 4
This command creates a new entry for the JobQueueCapacity value in the configuration file on Mac and Linux computers.
```

---

### Parameters
#### **Name**
Specifies the name that you want to assign to a new configuration option.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Value**
Specifies a value that the configuration option must store.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.String

System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRDiscoveredComputerConfigurationOption -Name <String> -Value <Object> [<CommonParameters>]
```
