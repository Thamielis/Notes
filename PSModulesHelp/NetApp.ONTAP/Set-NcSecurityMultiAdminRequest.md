Set-NcSecurityMultiAdminRequest
-------------------------------

### Synopsis
Updates a multi-admin-verify request.

---

### Description

Updates a multi-admin-verify request.This cmdlet is supported with Rest

---

### Related Links
* [New-NcSecurityMultiAdminRequest](New-NcSecurityMultiAdminRequest)

* [Remove-NcSecurityMultiAdminRequest](Remove-NcSecurityMultiAdminRequest)

* [Get-NcSecurityMultiAdminRequest](Get-NcSecurityMultiAdminRequest)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityMultiAdminRequest -Index 1 -State approved
NcController        : 172.21.50.101
Comment             :
ApproveExpiryTime   : 5/10/2022 7:01:55 AM -04:00
ApproveTime         :
ApprovedUsers       :
CreateTime          : 5/10/2022 6:01:55 AM -04:00
ExecutionExpiryTime :
Index               : 17
Operation           : security login unlock
PendingApprovers    : 1
PermittedUsers      :
PotentialApprovers  :
Query               : -vserver vs0
RequiredApprovers   : 1
State               : approved
UserRequested       : admin
UserVetoed          :
OwnerName           : C1_sti55-vsim-ucs119s_1651258287
OwnerUuid           : f9fc0ac9-c7e7-11ec-a695-005056ac9b37

```

---

### Parameters
#### **Index**
The Index.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **State**
The State.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput

---

### Notes
Category: Security
Api: /security/multi-admin-verify/requests
Family: Controller

---

### Syntax
```PowerShell
Set-NcSecurityMultiAdminRequest [-Index] <String> [-State] <String> [<CommonParameters>]
```
