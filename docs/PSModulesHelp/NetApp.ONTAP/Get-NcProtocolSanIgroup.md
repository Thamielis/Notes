Get-NcProtocolSanIgroup
-----------------------

### Synopsis
Retrieves nested initiator groups of an initiator group.

---

### Description

Retrieves nested initiator groups of an initiator group..This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolSanIgroup](New-NcProtocolSanIgroup)

* [Set-NcProtocolSanIgroup](Set-NcProtocolSanIgroup)

* [Remove-NcProtocolSanIgroup](Remove-NcProtocolSanIgroup)

---

### Examples
> Example 1

Get-NcProtocolSanIgroup -Name Child1 -ParentIgroupName Parent1
Retrieves nested initiator groups of an initiator group.

NcController   ParentIgroupUuid                     Uuid                                 Name
------------   ----------------                     ----                                 ----
10.237.164.134 06ae3fc8-d97c-11ec-9d3b-005056a76fc6 fd4a7b46-d97b-11ec-9d3b-005056a76fc6 Child1

---

### Parameters
#### **Name**
The name of igroup to get.  Data ONTAP wildcards are permitted.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |1       |true (ByPropertyName)|InitiatorGroupName|

#### **ParentIgroupName**
The name of parent igroup to get.  Data ONTAP wildcards are permitted.

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|false   |1       |true (ByPropertyName)|ParentInitiatorGroupName|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Igroup.ProtocolSanIgroup

---

### Notes
Category: protocols
API: api/protocols/san/igroups/
Family: protocols

---

### Syntax
```PowerShell
Get-NcProtocolSanIgroup [[-Name] <String>] [[-ParentIgroupName] <String>] [<CommonParameters>]
```
