Get-VBRCloudHardwarePlan
------------------------

### Synopsis
Returns existing hardware plans.

---

### Description

This cmdlet returns existing hardware plans. You can get the list of all hardware plans or search for instances directly by name, virtuallization platform or ID.

---

### Examples
> Example 1. Getting All Hardware Plans

```PowerShell
Get-VBRCloudHardwarePlan
This command returns all existing hardware plans.
```
> Example 2. Getting All VMware Hardware Plans

```PowerShell
Get-VBRCloudHardwarePlan -Platform VMWare
This command returns all VMware hardware plans.
```
> Example 3. Getting All Hyper-V Hardware Plans

```PowerShell
Get-VBRCloudHardwarePlan -Platform HyperV
This command returns all Hyper-V hardware plans.
```
> Example 4. Getting Hardware Plan by Name

```PowerShell
Get-VBRCloudHardwarePlan -Name "VMware Silver"
This command returns a hardware plan named "VMware Silver".
```
> Example 5. Getting Hardware Plan by Platform and Name

```PowerShell
Get-VBRCloudHardwarePlan -Name "Hyper-V Silver" -Platform HyperV
This command returns a Hyper-V hardware plan named "Hyper-V Silver".
```

---

### Parameters
#### **Id**
Specifies the array of the  IDs of the VBRViCloudHardwarePlan or VBRHvCloudHardwarePlan object you want to get. Accepts GUID[] or string[].

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of the hardware plan names you want to get.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Platform**
Specifies the platform of the hardware plan: VMWare, HyperV, vCD, LinuxPhysical, WindowsPhysical, Tape, CustomPlatform.
Valid Values:

* VMWare
* HyperV
* vCD
* LinuxPhysical
* WindowsPhysical
* Tape
* CustomPlatform

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRPlatform]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String[]

System.Guid[]

Veeam.Backup.PowerShell.Infos.VBRPlatform

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudHardwarePlan -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudHardwarePlan [-Name <String[]>] [-Platform {VMWare | HyperV | vCD | LinuxPhysical | WindowsPhysical | Tape | CustomPlatform}] [<CommonParameters>]
```
