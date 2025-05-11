Get-NcSecurityMultiAdminRequest
-------------------------------

### Synopsis
Retrieves multi-admin-verify requests.

---

### Description

Retrieves multi-admin-verify requests.This cmdlet is supported with Rest

---

### Related Links
* [Set-NcSecurityMultiAdminRequest](Set-NcSecurityMultiAdminRequest)

* [Remove-NcSecurityMultiAdminRequest](Remove-NcSecurityMultiAdminRequest)

* [New-NcSecurityMultiAdminRequest](New-NcSecurityMultiAdminRequest)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityMultiAdminRequest
NcController        : 172.21.50.101
Comment             :
ApproveExpiryTime   : 5/9/2022 8:57:58 AM -04:00
ApproveTime         :
ApprovedUsers       :
CreateTime          : 5/9/2022 7:57:58 AM -04:00
ExecutionExpiryTime :
Index               : 4
Operation           : security login unlock
PendingApprovers    : 1
PermittedUsers      :
PotentialApprovers  :
Query               : -vserver vs0
RequiredApprovers   : 1
State               : expired
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

#### **State**
The state of the request.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcSecurityMultiAdminRequest -Template, to get an empty empty multi-admin-request object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminRequest -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityMultiAdminRequest -Template, to get an empty multi-admin-request object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminRequest -Query $a.

|Type                                                          |Required|Position|PipelineInput|
|--------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput, to get an empty multi-admin-request object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminRequest -Attributes $a.

|Type                                                          |Required|Position|PipelineInput|
|--------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput]`|false   |named   |false        |

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
Get-NcSecurityMultiAdminRequest [-Operation] <String> [-State] <String> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminRequest -Template <DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminRequest -Query <DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminRequest [-Attributes <DataONTAP.C.Types.Security.SecurityMultiAdminRequestOutput>] [<CommonParameters>]
```
