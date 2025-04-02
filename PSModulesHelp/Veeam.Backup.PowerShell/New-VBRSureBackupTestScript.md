New-VBRSureBackupTestScript
---------------------------

### Synopsis
Defines recovery verification scripts for VMs.

---

### Description

This cmdlet creates the VBRSureBackupTestScript object that defines recovery verification scripts for VMs that are added to application groups and to jobs that are linked to SureBackup jobs.
Veeam Backup & Replication will run this script to verify that the VM that has been assigned the specific role has up and running applications for this role.

---

### Examples
> Example 1. Defining Recovery Verification Script for Custom VM Roles

New-VBRSureBackupTestScript -Name "ScriptVerification"  -Path "C:\scripts\script.bat" -Argument "192.0.2.5 53"
This command defines the ScriptVerification verification script for custom VM roles. The script will be defined with the following settings:
- The script is located at the C:\scripts\pre-script.bat path.
- Veeam Backup & Replication will use the 192.0.2.5 IP and the 53 port to access the VM.
> Example 2. Defining Recovery Verification Script for Predefined VM Roles

New-VBRSureBackupTestScript -PredefinedApplication DNSServer
This command defines a verification script for the DNS Server VM role. Veeam Backup & Replication will run the script to verify that the VM with the DNS Server role has up and running applications for this role.

---

### Parameters
#### **Argument**
Specifies an IP address and the port number.
The cmdlet will use this IP address and port to access the VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Name**
Specifies a name for a script.
The cmdlet will define a script with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Path**
Specifies a path to a custom script.
The cmdlet will use this path to access the script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PredefinedApplication**
Specifies a script for predefined roles. The cmdlet will run the script to verify applications inside VMs. You can specify the script for either of the following roles:
* DNSServer
* DomainController
* GlobalCatalog
* MailServer
* SQLServer
* WebServer
* VBO
Valid Values:

* DNSServer
* DomainController
* GlobalCatalog
* MailServer
* SQLServer
* WebServer
* VBO

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSureBackupApplication]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRSureBackupTestScript -Argument <String> -Name <String> -Path <String> [<CommonParameters>]
```
```PowerShell
New-VBRSureBackupTestScript -PredefinedApplication {DNSServer | DomainController | GlobalCatalog | MailServer | SQLServer | WebServer | VBO} [<CommonParameters>]
```
