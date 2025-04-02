New-NcProtocolSanIgroup
-----------------------

### Synopsis
Adds one or more initiators to an initiator group.

---

### Description

Adds one or more initiators to an initiator group.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolSanIgroup](Get-NcProtocolSanIgroup)

* [Remove-NcProtocolSanIgroup](Remove-NcProtocolSanIgroup)

* [Set-NcProtocolSanIgroup](Set-NcProtocolSanIgroup)

---

### Examples
> Example 1

New-NcProtocolSanIgroup -Name Child1 -ParentIgroupName Parent1
Adds one or more initiators to an initiator group..

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
Category: Security
API: api/security/ipsec/ca-certificates
Family: Security

---

### Syntax
```PowerShell
New-NcProtocolSanIgroup [[-Name] <String>] [[-ParentIgroupName] <String>] [<CommonParameters>]
```
