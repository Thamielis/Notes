Remove-NcProtocolSanIgroup
--------------------------

### Synopsis
Removes a nested initiator group from an initiator group.

---

### Description

Removes a nested initiator group from an initiator group. This API does not delete the nested initiator group itself. It removes the relationship 
		between a parent and child initiator group.This API only supports removal of initiator groups owned directly by the initiator group. Further nested initiator groups must be removed from the
		direct parent initiator group.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolSanIgroup](Get-NcProtocolSanIgroup)

* [New-NcProtocolSanIgroup](New-NcProtocolSanIgroup)

---

### Examples
> Example 1

```PowerShell
Remove-NcProtocolSanIgroup -Name Child1 -ParentIgroupName Parent1
```

---

### Parameters
#### **Name**
The name of the new igroup.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |0       |true (ByPropertyName)|InitiatorGroupName|

#### **ParentIgroupName**
The name of the new igroup.

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|ParentInitiatorGroupName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: igroup
Api: /protocols/san/igroups/{igroup.uuid}/igroups/{uuid}
Family: Controller

---

### Syntax
```PowerShell
Remove-NcProtocolSanIgroup [-Name] <String> -ParentIgroupName <String> [<CommonParameters>]
```
