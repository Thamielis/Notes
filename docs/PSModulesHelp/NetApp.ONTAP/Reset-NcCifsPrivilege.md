Reset-NcCifsPrivilege
---------------------

### Synopsis
Reset privileges for a local or Active Directory user or group.

---

### Description

Reset privileges for a local or Active Directory user or group.

---

### Related Links
* [Get-NcCifsPrivilege](Get-NcCifsPrivilege)

* [Add-NcCifsPrivilege](Add-NcCifsPrivilege)

* [Remove-NcCifsPrivilege](Remove-NcCifsPrivilege)

---

### Examples
> Example 1

```PowerShell
Reset-NcCifsPrivilege -Name bort
Reset the CIFS privileges for user bort.
```

---

### Parameters
#### **Name**
The name of the local or Active Directory user or group.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|UserOrGroupName|

#### **VserverContext**
Credentials of a user with permission to reset the password in the organizational unit (OU) that the machine account is a member of.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cifs
API: cifs-privilege-reset-privilege
Family: vserver

---

### Syntax
```PowerShell
Reset-NcCifsPrivilege [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
