Sync-VBRIsilonVolume
--------------------

### Synopsis
Rescans Dell PowerScale (formerly Isilon) storage volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans Dell PowerScale storage volumes from the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes.
Run the Sync-VBRIsilonHost cmdlet to rescan an entire Dell PowerScale storage system.
Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

* [Get-VBRIsilonVolume](Get-VBRIsilonVolume)

---

### Examples
> Rescanning Dell PowerScale Storage Volume Added to Backup Infrastructure

$storage = Get-VBRIsilonHost -Name "Isilon Storage"
$volume = Get-VBRIsilonVolume -Name "VOLUME1" -Host $storage
Sync-VBRIsilonVolume -Volume $volume
This example shows how to rescan a Dell PowerScale storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-VBRIsilonVolume cmdlet. Specify the Name and Host parameter values. Save the result to the $volume variable.
3. Run the Sync-VBRIsilonVolume cmdlet. Set the $volume variable as the Volume parameter value.

---

### Parameters
#### **Volume**
Specifies an array of storage volumes that you want to rescan.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CSanVolume[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRIsilonVolume -Volume <CSanVolume[]> [<CommonParameters>]
```
