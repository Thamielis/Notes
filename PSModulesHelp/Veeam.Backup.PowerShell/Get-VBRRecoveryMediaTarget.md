Get-VBRRecoveryMediaTarget
--------------------------

### Synopsis
Returns available bootable media for creating Veeam Recovery Media.

---

### Description

This cmdlet returns available bootable media for creating Veeam Recovery Media. You can get the list of all media or search for instances directly by name or type.

---

### Examples
> Example 1. Getting All Available Bootable Media

```PowerShell
Get-VBRRecoveryMediaTarget
This command returns all available bootable media.
```
> Example 2. Getting All Removable Bootable Media

```PowerShell
Get-VBRRecoveryMediaTarget -Type RemovableDevice
This command returns all attached removable storage devices that can be used for creating Veeam Recovery Media.
```

---

### Parameters
#### **Name**
Specifies the array of bootable media names. The cmdlet will return available bootable media with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **Type**
Specifies the array of bootable media types:
* RemovableDevice: removable storage devices
* OpticalDrive: CD, DVD and BD drives
The cmdlet will return available bootable media of these types.
Valid Values:

* ISO
* RemovableDevice
* OpticalDrive

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRRecoveryMediaType[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String[]

Veeam.Backup.PowerShell.Infos.VBRRecoveryMediaType[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRRecoveryMediaTarget [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRRecoveryMediaTarget [-Type {ISO | RemovableDevice | OpticalDrive}] [<CommonParameters>]
```
