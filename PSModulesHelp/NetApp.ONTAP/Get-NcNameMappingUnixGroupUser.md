Get-NcNameMappingUnixGroupUser
------------------------------

### Synopsis
Retrieves users for the specified UNIX group and SVM

---

### Description

Retrieves users for the specified UNIX group and SVM This cmdlet is supported with Rest

---

### Related Links
* [Add-NcNameMappingUnixGroupUser](Add-NcNameMappingUnixGroupUser)

---

### Examples
> Example 1

```PowerShell
Get-NcNameMappingUnixGroupUser -UniXGroupName Unix_Group -VserverContext vs1
NcController  : 10.234.64.61
Svm           : vs1
Name          : clinton
UnixGroupName : Unix_Group

```

---

### Parameters
#### **VserverContext**
Name of the Vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |true         |VS     |

#### **UniXGroupName**
Specify UNIX group name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Name**
UNIX user who belongs to the specified UNIX group and the SVM

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |true         |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NameMapping.NameMappingUnixGroupUser

---

### Notes
Category: NameMapping
Api: /api/name-services/unix-groups/{svm.uuid}/{unix_group.name}/users
Family: Vserver

---

### Syntax
```PowerShell
Get-NcNameMappingUnixGroupUser -VserverContext <String> [-UniXGroupName] <String> [[-Name] <String>] [<CommonParameters>]
```
