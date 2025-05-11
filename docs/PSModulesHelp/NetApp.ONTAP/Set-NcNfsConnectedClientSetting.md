Set-NcNfsConnectedClientSetting
-------------------------------

### Synopsis
Updates the properties of the NFS connected-client cache settings.This cmdlet is supported with Rest Only.

---

### Description

Updates the properties of the NFS connected-client cache settings.

---

### Related Links
* [Get-NcNfsConnectedClientSetting](Get-NcNfsConnectedClientSetting)

* 

---

### Examples
> Example 1

Set-NcNfsConnectedClientSetting  -EnableNfsClientsDeletion $false
ClientRetentionInterval EnableNfsClientsDeletion NcController UpdateInterval
----------------------- ------------------------ ------------ --------------
P7D                                        False 10.234.85.2  PT8H

---

### Parameters
#### **EnableNfsClientsDeletion**
Specifies whether or not NFS Clients deletion is enabled for the connected-clients cache. When set to true, connected-clients entries are deleted when a connection is closed

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |0       |true (ByPropertyName)|

#### **ClientRetentionInterval**
The lifetime range of the connected-clients cache. Only intervals in multiples of 12 hours or its equivalent in days,minutes or seconds are supported. The minimum is 12 hours and the maximum is 168 hours or 7 days.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ApplicationSnapshotOutput

---

### Notes
Category: Nfs
Api: /protocols/nfs/connected-client-settings
Family: NcController

---

### Syntax
```PowerShell
New-NcNfsConnectedClientSetting [[-EnableNfsClientsDeletion] <bool?>] [[-ClientRetentionInterval] <String>] [<CommonParameters>]
```
