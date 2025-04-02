Add-NcCifsServer
----------------

### Synopsis
Configure and setup CIFS services on a Vserver.

---

### Description

Configure and setup CIFS services on a Vserver.

---

### Related Links
* [Set-NcCifsServer](Set-NcCifsServer)

* [Remove-NcCifsServer](Remove-NcCifsServer)

* [Get-NcCifsServer](Get-NcCifsServer)

---

### Examples
> Example 1

Add-NcCifsServer -Name CIFS01 -Domain TESTDOMAIN -AdminUsername Administrator -AdminPassword p@ssword
Creates the CIFS server CIFS01 and adds it to the domain TESTDOMAIN.

CifsServer                AuthStyle       Domain                              OrganizationalUnit
----------                ---------       ------                              ------------------
CIFS01                    domain          TESTDOMAIN

---

### Parameters
#### **Name**
The NetBIOS name to give the CIFS server.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |1       |false        |CifsServer|

#### **Domain**
The Fully Qualified Domain Name of the Windows Active Directory this CIFS server belongs to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **OrganizationalUnit**
The Organizational Unit (OU) within the Windows Active Directory this CIFS server belongs to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultSite**
The default site used by LIFs that do not have a site membership. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdminUsername**
The username of the account used to add this CIFS server to the Active Directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **AdminPassword**
The password for the account used to add this CIFS server to the Active Directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **Force**
If this is set and a machine account with the same name as specified in 'Name' exists in the Active Directory, it will be overwritten and reused. The default value for this field is false. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AdministrativeStatus**
CIFS Server Administrative Status.  Possible values: "down", "up"
Valid Values:

* down
* up

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
CIFS server description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NetbiosAlias**
One or more NetBIOS aliases for the CIFS server.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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
PSCredential object containing the credentials for the account used to add this CIFS server to the Active Directory.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |3       |false        |

#### **Workgroup**
The name of the workgroup this CIFS server belongs to.
This parameter is available in ONTAP 9.0 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Realm**
The Kerberos realm this CIFS server belongs to.
This parameter is available in ONTAP 9.2 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **KeytabUri**
Kerberos Keytab File URI
This parameter is available in ONTAP 9.2 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsServerConfig

---

### Notes
Category: cifs
API: cifs-server-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcCifsServer [-Name] <String> [-Domain] <String> [-OrganizationalUnit <String>] [-DefaultSite <String>] [-AdminUsername] <String> [-AdminPassword] <String> [-Force] [-AdministrativeStatus 
```
```PowerShell
<String>] [-Comment <String>] [-NetbiosAlias <String[]>] [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] 
```
```PowerShell
[-Netbios <DataONTAP.C.Types.Cifs.Netbios>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcCifsServer [-Name] <String> [-Domain] <String> [-OrganizationalUnit <String>] [-DefaultSite <String>] [-AdminCredential] <PSCredential> [-Force] [-AdministrativeStatus <String>] 
```
```PowerShell
[-Comment <String>] [-NetbiosAlias <String[]>] [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios 
```
```PowerShell
<DataONTAP.C.Types.Cifs.Netbios>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-NcCifsServer [-Name] <String> [-OrganizationalUnit <String>] [-DefaultSite <String>] [-Force] [-AdministrativeStatus <String>] [-Comment <String>] [-NetbiosAlias <String[]>] -Workgroup 
```
```PowerShell
<String> [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios <DataONTAP.C.Types.Cifs.Netbios>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcCifsServer [-Name] <String> [-OrganizationalUnit <String>] [-DefaultSite <String>] [-Force] [-AdministrativeStatus <String>] [-Comment <String>] [-NetbiosAlias <String[]>] -Realm 
```
```PowerShell
<String> [-KeytabUri <String>] [-VserverContext <String>] [-Enabled <Boolean>] [-Svm <DataONTAP.C.Types.Cifs.Svm>] [-AdDomain <DataONTAP.C.Types.Cifs.AdDomain>] [-Netbios 
```
```PowerShell
<DataONTAP.C.Types.Cifs.Netbios>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
