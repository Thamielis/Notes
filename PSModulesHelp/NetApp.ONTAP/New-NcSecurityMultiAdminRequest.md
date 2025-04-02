New-NcSecurityMultiAdminRequest
-------------------------------

### Synopsis
Creates a multi-admin-verify request.

---

### Description

Creates a multi-admin-verify request.This cmdlet is supported with Rest

---

### Related Links
* [Set-NcSecurityMultiAdminRequest](Set-NcSecurityMultiAdminRequest)

* [Remove-NcSecurityMultiAdminRequest](Remove-NcSecurityMultiAdminRequest)

* [Get-NcSecurityMultiAdminRequest](Get-NcSecurityMultiAdminRequest)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityMultiAdminRequest
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
State               : pending
UserRequested       : admin
UserVetoed          :
OwnerName           : C1_sti55-vsim-ucs119s_1651258287
OwnerUuid           : f9fc0ac9-c7e7-11ec-a695-005056ac9b37

```

---

### Parameters
#### **Operation**
The command to execute.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Query**
Identifies the specific entry upon which the user wants to operate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Comment**
Comment that is sent to the approval-group email indicating why the request was made.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PermittedUsers**
List of users that can execute the operation once approved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
New-NcSecurityMultiAdminRequest [-Operation] <String> [-Query] <String> [-Comment <String>] [-PermittedUsers <String[]>] [<CommonParameters>]
```
