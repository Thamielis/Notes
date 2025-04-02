Set-NcKerberosRealm
-------------------

### Synopsis
Modify the Kerberos realm configuration.

---

### Description

Modify the Kerberos realm configuration.

---

### Related Links
* [Get-NcKerberosRealm](Get-NcKerberosRealm)

* [Remove-NcKerberosRealm](Remove-NcKerberosRealm)

* [New-NcKerberosRealm](New-NcKerberosRealm)

---

### Examples
> Example 1

Set-NcKerberosRealm -Name test -Comment "This is a test realm."
Set the comment for the Kerberos realm.

ConfigName               Realm                KdcVendor         ClockSkewTS Comment
----------               -----                ---------         ----------- -------
test                     TESTREALM            microsoft            00:07:00 This is a test realm.

---

### Parameters
#### **Name**
Kerberos configuration name. Mandatory in ONTAP 8.2.1 and earlier.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |1       |true (ByPropertyName)|ConfigName|

#### **Realm**
Kerberos realm name. Mandatory in ONTAP 8.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **KdcVendor**
The vendor of the Key Distribution Centre (KDC) server. If the configuration uses a Microsoft Active Directory (AD) domain for authentication, this field should be 'microsoft'. Possible values: "microsoft", "other"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **KdcIpAddress**
IP address of the Key Distribution Centre (KDC) server for this Kerberos realm.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|KdcIp  |

#### **KdcPort**
TCP port on the KDC to be used for Kerberos communication. The default is 88.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ClockSkew**
The clock skew in minutes is the tolerance for accepting tickets with time stamps that do not exactly match the host's system clock. The default is 5 minutes.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AdServerName**
Host name of the Active Directory Domain Controller (DC). This is a mandatory parameter if the KdcVendor is 'microsoft'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AdServerIpAddress**
IP Address of the Active Directory Domain Controller (DC). This is a mandatory parameter if the KdcVendor is 'microsoft'.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|AdServerIp|

#### **Comment**
A comment to give this realm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AdminServerIpAddress**
IP address of the host where the Kerberos administration daemon is running. This is usually the master KDC. If this parameter is omitted, the IP address specified in KdcIpAddress is used. If specified, this should be the same as the KdcIpAddress if the KdcVendor is 'microsoft'.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |named   |true (ByPropertyName)|AdminServerIp|

#### **AdminServerPort**
The TCP port on the Kerberos administration server where the Kerberos administration service is running. The default is 749.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PasswordServerIpAddress**
IP address of the host where the Kerberos password-changing server is running. Typically, this is the same as the host indicated in the AdminServerIpAddress. If this parameter is omitted, the IP address in KdcIpAddress is used.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|PasswordServerIp|

#### **PasswordServerPort**
The TCP port on the Kerberos password-changing server where the Kerberos password-changing service is running. The default is 464.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Kerberos.KerberosRealm

---

### Notes
Category: kerberos
API: kerberos-realm-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcKerberosRealm [[-Name] <String>] [-Realm <String>] [-KdcVendor <String>] [-KdcIpAddress <String>] [-KdcPort <Int32>] [-ClockSkew <Int64>] [-AdServerName <String>] [-AdServerIpAddress 
```
```PowerShell
<String>] [-Comment <String>] [-AdminServerIpAddress <String>] [-AdminServerPort <Int32>] [-PasswordServerIpAddress <String>] [-PasswordServerPort <Int32>] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcKerberosRealm [-Realm <String>] [-KdcVendor <String>] [-KdcIpAddress <String>] [-KdcPort <Int32>] [-ClockSkew <Int64>] [-AdServerName <String>] [-AdServerIpAddress <String>] [-Comment 
```
```PowerShell
<String>] [-AdminServerIpAddress <String>] [-AdminServerPort <Int32>] [-PasswordServerIpAddress <String>] [-PasswordServerPort <Int32>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
