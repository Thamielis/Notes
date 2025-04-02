Get-NcActiveDirectoryPreferredDomainController
----------------------------------------------

### Synopsis
Retrieves the Active Directory preferred Domain Controller configuration of an Vserver. This cmdlet is supported with Rest.

---

### Description

Retrieves the Active Directory preferred Domain Controller configuration of an Vserver. This cmdlet is supported with Rest

---

### Related Links
* [New-NcActiveDirectoryPreferredDomainController](New-NcActiveDirectoryPreferredDomainController)

* [Remove-NcActiveDirectoryPreferredDomainController](Remove-NcActiveDirectoryPreferredDomainController)

---

### Examples
> Example 1

```PowerShell
Get-NcActiveDirectoryPreferredDomainController -Vserver vs0
Domain       : CTL.GDL.ENGLAB.NETAPP.COM
ServerIp     : 10.60.16.52
NcController : 10.234.75.101
Vserver      : vs0
VserverUuid  : caacf785-4ae9-11ed-8111-005056a7a875

```
> Example 2

```PowerShell
$a = Get-NcActiveDirectoryPreferredDomainController -Template
	       $a.Domain = "CTL.GDL.ENGLAB.NETAPP.COM"
	        $a.ServerIp = "10.60.16.52"
		Get-NcActiveDirectoryPreferredDomainController -Query $a
Domain       : CTL.GDL.ENGLAB.NETAPP.COM
ServerIp     : 10.60.16.52
NcController : 10.234.75.101
Vserver      : vs0
VserverUuid  : caacf785-4ae9-11ed-8111-005056a7a875

```

---

### Parameters
#### **Vserver**
Name of the Vserver

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |true         |

#### **Domain**
Fully Qualified Domain Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |true         |

#### **ServerIp**
IP address of the preferred Domain Controller

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |true         |

#### **Template**
Specify to get an empty VolumeAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ActiveDirectoryPreferredDomainController object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use Get-NcActiveDirectoryPreferredDomainController -Template to get the initially empty ActiveDirectoryPreferredDomainController object.

|Type                                                                          |Required|Position|PipelineInput|
|------------------------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController]`|true    |named   |false        |

#### **Attributes**
For advanced queries returned the desired number of attribute provide a ActiveDirectoryPreferredDomainController object with various fields

|Type                                                                          |Required|Position|PipelineInput|
|------------------------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController

---

### Notes
Category: ActiveDirectory
Api: /protocols/active-directory/{svm.uuid}/preferred-domain-controllers
Family: Cluster

---

### Syntax
```PowerShell
Get-NcActiveDirectoryPreferredDomainController [[-Vserver] <String>] [[-Domain] <String>] [[-ServerIp] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcActiveDirectoryPreferredDomainController -Template <DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController> [<CommonParameters>]
```
```PowerShell
Get-NcActiveDirectoryPreferredDomainController -Query <DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController> [-Attributes 
```
```PowerShell
<DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryPreferredDomainController>] [<CommonParameters>]
```
