Remove-NcAntiRansomwareSuspect
------------------------------

### Synopsis
Clears either all the suspect files of a volume or suspect files of a volume based on file format or suspect time provided.

---

### Description

Clears either all the suspect files of a volume or suspect files of a volume based on file format or suspect time provided. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcAntiRansomwareSuspect](Get-NcAntiRansomwareSuspect)

---

### Examples
> Example 1

Remove-NcAntiRansomwareSuspect
Remove Anti-Ransomeware suspected files

Are you sure you want to remove Anti-Ransomeware suspected files?

[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

---

### Parameters
#### **VolumeName**
The name of the volume containing suspected files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **VserverContext**
The name of the Vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |true         |VS     |

#### **FileFormat**
File format of the suspected file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |true         |

#### **SuspectTime**
Time when the file was detected as a potential suspect in date-time format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |true         |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Security
API: /api/security/anti-ransomware/suspects
Family: Vserver

---

### Syntax
```PowerShell
Remove-NcAntiRansomwareSuspect [-VolumeName] <String> -VserverContext <String> [[-FileFormat] <String>] [[-SuspectTime] <String>] [<CommonParameters>]
```
