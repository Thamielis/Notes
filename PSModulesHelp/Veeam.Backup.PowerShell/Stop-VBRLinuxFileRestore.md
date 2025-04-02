Stop-VBRLinuxFileRestore
------------------------

### Synopsis
Stops Linux-based or Unix-based guest OS files restore.

---

### Description

This cmdlet stops Linux-based or Unix-based guest OS file restore process started with the Start-VBRLinuxFileRestore cmdlet.
When you stop the OS file restore, Veeam Backup & Replication unmounts virtual disks and powers the proxy appliance off.
Note: You cannot restore files after the disks are unmounted.

---

### Examples
> Example 1

```PowerShell
Stop-VBRLinuxFileRestore -LinuxFlrObject $linuxflr
This command stops a file restore session initiated with Start-VBRLinuxFileRestore.

This example uses the '$linuxflr' variable that contains the object of the restore session. The session object was saved to the variable during the restore session start.
```

---

### Parameters
#### **LinuxFlrObject**
Specifies the Linux file restore process initiated by  that you want to stop.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRLinuxFlrObject]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLinuxFlrObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRLinuxFileRestore -LinuxFlrObject <VBRLinuxFlrObject> [<CommonParameters>]
```
