New-NcActiveDirectoryPreferredDomainController
----------------------------------------------

### Synopsis
Creates an Active Directory preferred Domain Controller configuration for an Vserver. This cmdlet is supported with Rest

---

### Description

Creates an Active Directory preferred Domain Controller configuration for an Vserver.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcActiveDirectoryPreferredDomainController](Get-NcActiveDirectoryPreferredDomainController)

* [Remove-NcActiveDirectoryPreferredDomainController](Remove-NcActiveDirectoryPreferredDomainController)

---

### Examples
> Example 1

```PowerShell
New-NcActiveDirectoryPreferredDomainController -Domain CTL.GDL.ENGLAB.NETAPP.COM -ServerIp 10.60.16.52 -VserverContext AD_Vserver5850 -SkipConfigValidation $True
Create new Active Directory Domain Controller Configuration

Domain       : CTL.GDL.ENGLAB.NETAPP.COM
ServerIp     : 10.60.16.52
NcController : 10.234.75.101
Vserver      : AD_Vserver6626
VserverUuid  : baf5aa38-5115-11ed-8111-005056a7a875

```

---

### Parameters
#### **VserverContext**
Name of vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |VS     |

#### **Domain**
fully qualified domain name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **ServerIp**
IP address of the preferred Domain Controller. The address can be either an IPv4 or an IPv6 address

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SkipConfigValidation**
Skip Configuration Validation

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController

---

### Notes
Category: ActiveDirectory
Api: /protocols/active-directory/{svm.uuid}/preferred-domain-controllers
Family: Vserver

---

### Syntax
```PowerShell
New-NcActiveDirectoryPreferredDomainController [-Domain] <String> [-ServerIp] <String> -VserverContext <String> [<CommonParameters>]
```
