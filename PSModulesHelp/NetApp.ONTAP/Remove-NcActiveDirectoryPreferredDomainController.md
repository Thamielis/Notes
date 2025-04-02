Remove-NcActiveDirectoryPreferredDomainController
-------------------------------------------------

### Synopsis
Remove an Active Directory preferred Domain Controller configuration for an Vserver. This cmdlet is supported with Rest.

---

### Description

Remove an Active Directory preferred Domain Controller configuration for an Vserver.This cmdlet is supported with Rest Only.

---

### Related Links
* [Get-NcActiveDirectoryPreferredDomainController](Get-NcActiveDirectoryPreferredDomainController)

* [New-NcActiveDirectoryPreferredDomainController](New-NcActiveDirectoryPreferredDomainController)

---

### Examples
> Example 1

```PowerShell
Remove-NcActiveDirectoryPreferredDomainController -Domain CTL.GDL.ENGLAB.NETAPP.COM -ServerIp 10.60.16.52 -VserverContext AD_Vserver5850
Remove Active Directory Domain Controller Configuration
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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController

---

### Notes
Category: ActiveDirectory
Api: /protocols/active-directory/{svm.uuid}/preferred-domain-controllers/fqdn/server-ip
Family: Vserver

---

### Syntax
```PowerShell
Remove-NcActiveDirectoryPreferredDomainController [-Domain] <String> [-ServerIp] <String> -VserverContext <String> [<CommonParameters>]
```
