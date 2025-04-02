Get-VBRVirtualLab
-----------------

### Synopsis
Returns virtual labs with main settings.

---

### Description

This cmdlet returns the VBRVirtualLab>[] object that contains an array of virtual labs and their main settings. You can use this object with the following cmdlets:
- Remove-VBRVirtualLab - to remove virtual labs from Veeam Backup & Replication infrastructure.
- Add-VBRViSureBackupJob - to create a SureBackup job.
- Set-VBRViSureBackupJob - to modify settings of a SureBackup job.

---

### Examples
> Example 1. Getting All Virtual Labs

Get-VBRVirtualLab

IdOnHost    : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server      : Veeam.Backup.Core.Common.CHost
Platform    : VMWare
Id          : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name        : Exchange Virtual Lab
Description : Created by Powershell at 2/20/2020 5:56 AM.

IdOnHost    : d36893a1-1627-4c18-919f-a1bcadf38e0e
Server      : Veeam.Backup.Core.Common.CHost
Platform    : VMWare
Id          : 36b4435b-ea6b-4fa3-a2a2-9714e1cac5a6
Name        : SQL Virtual Lab
Description : Created by Powershell at 2/20/2020 5:56 AM.
This command returns all virtual labs that are added to the Veeam Backup & Replication infrastructure.
The cmdlet output will contain settings of virtual labs.
> Example 2. Getting Virtual Lab by ID

```PowerShell
Get-VBRVirtualLab -ID 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec

IdOnHost    : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server      : Veeam.Backup.Core.Common.CHost
Platform    : VMWare
Id          : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name        : Exchange Virtual Lab
Description : Created by Powershell at 2/20/2020 5:56 AM.
This command returns the 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec virtual lab.
The cmdlet output will contain settings of the virtual lab.
```
> Example 3. Getting Virtual Lab by Name

```PowerShell
Get-VBRVirtualLab -Name "SQL Virtual Lab"

IdOnHost    : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server      : Veeam.Backup.Core.Common.CHost
Platform    : VMWare
Id          : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name        : Exchange Virtual Lab
Description : Created by Powershell at 2/20/2020 5:56 AM.
This command returns the SQL Virtual Lab virtual lab.
The cmdlet output will contain settings of the virtual lab.
```
> Example 4. Getting Virtual Lab by Platform

```PowerShell
Get-VBRVirtualLab -Platform VMWare

IdOnHost    : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server      : Veeam.Backup.Core.Common.CHost
Platform    : VMWare
Id          : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name        : Exchange Virtual Lab
Description : Created by Powershell at 2/20/2020 5:56 AM.
This command returns virtual labs created on the VMware.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for virtual labs. The cmdlet will return an array of virtual labs with the specified ID.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for virtual labs. The cmdlet will return an array of virtual labs with the specified names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Platform**
Specifies a type of server where the virtual lab is created.
The cmdlet will return virtual labs created on the specified platform. You can specify either of the following virtual labs:
* VMWare
* HyperV
* vCD
Valid Values:

* VMWare
* HyperV
* vCD

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRVirtualLabPlatform]`|false   |named   |False        |

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRVirtualLab [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRVirtualLab [-Name <String[]>] [-Platform {VMWare | HyperV | vCD}] [<CommonParameters>]
```
