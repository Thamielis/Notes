Set-NcCifsServer
----------------

### Synopsis
Set the basic configurations of a CIFS server.

---

### Description

Set the basic configurations of a CIFS server.

---

### Related Links
* [Add-NcCifsServer](Add-NcCifsServer)

* [Get-NcCifsServer](Get-NcCifsServer)

* [Remove-NcCifsServer](Remove-NcCifsServer)

---

### Examples
> Example 1

```PowerShell
Set-NcCifsServer -DefaultSite default
Set the default site for the CIFS server on the current vserver.

AuthStyle          : domain
CifsServer         : CIFS01
DefaultSite        : default
Domain             : RTPRRE.TESTDOMAIN
DomainWorkgroup    : RTPRRE
OrganizationalUnit :

```

---

### Parameters
#### **DefaultSite**
The default site used by LIFs that do not have a site membership. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **AdministrativeStatus**
CIFS Server Administrative Status.  Possible values: "down", "up"
Valid Values:

* down
* up

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Domain**
The fully qualified domain name of the Windows Active Directory this CIFS server belongs to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AdminUsername**
The username of the account used to add this CIFS server to the Active Directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AdminPassword**
The password for the account used to add this CIFS server to the Active Directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ForceAccountOverwrite**
If specified and the domain is being modified, and a machine account with the same name as the current Vserver's CIFS server name exists in the Active Directory, it will be overwritten and reused.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Comment**
CIFS server description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AddNetbiosAlias**
NetBIOS aliases to add for the CIFS server.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RemoveNetbiosAlias**
NetBIOS aliases to remove for the CIFS server.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **CifsServer**
The name of the CIFS server (up to 15 characters).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Ou**
The organizational unit within the Active Directive domain to associate with the CIFS server.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|OrganizationUnit|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Enabled**
Specifies if the CIFS service is administratively enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Svm**
Specifies Svm. To create object use New-Object DataONTAP.C.Types.Cifs.Svm. This parameter is supported with Rest only.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.Svm]`|false   |named   |false        |

#### **AdDomain**
Specifies Domain. To create object use New-Object DataONTAP.C.Types.Cifs.AdDomain. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.AdDomain]`|false   |named   |false        |

#### **Netbios**
Specifies Netbios. To create object use New-Object DataONTAP.C.Types.Cifs.Netbios. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.Netbios]`|false   |named   |false        |

#### **Options**
Specifies Options. To create object use New-Object DataONTAP.C.Types.Cifs.Options. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.Options]`|false   |named   |false        |

#### **Security**
Specifies Security. To create object use New-Object DataONTAP.C.Types.Cifs.Security. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.Security]`|false   |named   |false        |

#### **Name**
The name of the CIFS server (up to 15 characters).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Realm**
The Kerberos realm this CIFS server belongs to. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **KeytabUri**
Kerberos Keytab File URI. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Force**
If this is set and a machine account with the same name as specified in 'Name' exists in the Active Directory, it will be overwritten and reused. The default value for this field is false.This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AdminCredential**
Credential of the account used to add the CIFS server to the Active Directory.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |false        |

#### **Workgroup**
The name of the workgroup this CIFS server belongs to. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsServerConfig

---

### Notes
Category: cifs
API: cifs-server-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsServer [[-DefaultSite] <String>] [-AdministrativeStatus <String>] -Domain <String> -AdminUsername <String> -AdminPassword <String> [-ForceAccountOverwrite] [-Comment <String>] 
```
```PowerShell
[-AddNetbiosAlias <String[]>] [-RemoveNetbiosAlias <String[]>] [-CifsServer <String>] [-Ou <String>] [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] 
```
```PowerShell
[-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios <DataONTAP.C.Types.Cifs.Netbios>] [-Options <DataONTAP.C.Types.Cifs.Options>] [-Security <DataONTAP.C.Types.Cifs.Security>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcCifsServer [[-DefaultSite] <String>] [-AdministrativeStatus <String>] -Domain <String> -AdminCredential <PSCredential> [-ForceAccountOverwrite] [-Comment <String>] [-AddNetbiosAlias 
```
```PowerShell
<String[]>] [-RemoveNetbiosAlias <String[]>] [-CifsServer <String>] [-Ou <String>] [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain 
```
```PowerShell
<DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios <DataONTAP.C.Types.Cifs.Netbios>] [-Options <DataONTAP.C.Types.Cifs.Options>] [-Security <DataONTAP.C.Types.Cifs.Security>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcCifsServer [-AdministrativeStatus <String>] -Workgroup <String> [-Comment <String>] [-AddNetbiosAlias <String[]>] [-RemoveNetbiosAlias <String[]>] [-CifsServer <String>] [-Ou <String>] 
```
```PowerShell
[-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios <DataONTAP.C.Types.Cifs.Netbios>] [-Options 
```
```PowerShell
<DataONTAP.C.Types.Cifs.Options>] [-Security <DataONTAP.C.Types.Cifs.Security>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
