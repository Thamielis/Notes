Remove-NaHostFile
-----------------

### Synopsis
Delete a file, completely reclaiming all of the space it consumed on the storage controller.

---

### Description

Delete a file, completely reclaiming all of the space it consumed on the storage controller.

The file to be deleted must be specified with a fully-qualified path that resides on a Data ONTAP LUN or Data ONTAP CIFS share.  Cluster-shared volumes (CSVs) are supported.  Administrator privileges may be required to use this cmdlet.

---

### Related Links
* [New-NaVirtualDisk](New-NaVirtualDisk)

* [Get-NaHostDisk](Get-NaHostDisk)

---

### Examples
> Example 1

```PowerShell
Remove-NaHostFile j:\test.vhd
Delete the file 'j:\test.vhd' after reclaiming all of the space it consumed on the storage controller.
```

---

### Parameters
#### **FullName**
Full path to the file to remove.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

#### **SkipUnmap**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnmapSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: host

---

### Syntax
```PowerShell
Remove-NaHostFile [-FullName] <String> [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
