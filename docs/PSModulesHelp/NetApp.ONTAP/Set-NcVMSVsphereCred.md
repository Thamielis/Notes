Set-NcVMSVsphereCred
--------------------

### Synopsis
Modify or set initial value for vSphere server, user, and/or password.

---

### Description

Modify or set initial value for vSphere server, user, and/or password.

---

### Related Links
* [Get-NcVMSVsphereCred](Get-NcVMSVsphereCred)

* [Test-NcVMSVsphereCred](Test-NcVMSVsphereCred)

---

### Examples
> Example 1

Set-NcVMSVsphereCred -Node aparajir-vsim1 -VSphereServer 10.60.28.10 -Username root -Password ***
Add a VMS Credential using plaintext password.

NcController                  Username                      VSphereServer                 Node
------------                  --------                      -------------                 ----
10.63.1.234                   root                          10.60.28.10                   aparajir-vsim1

> Example 2

Set-NcVMSVsphereCred -Node aparajir-vsim2 -Credential $credential -VSphereServer 10.60.28.8
Create configuration using secure credentials

NcController                  Username                      VSphereServer                 Node
------------                  --------                      -------------                 ----
10.63.1.234                   root                          10.60.28.8                    aparajir-vsim2

---

### Parameters
#### **Node**
The node on which configuration is to be modified.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **VSphereServer**
vSphere server managing this VSA instance: either the ESX host itself or its managing vCenter server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **Username**
A vSphere username (only 'read-only' access required) to be used when connecting to the vSphere server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Password**
Password for the vSphere user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Credential**
Credentials of a vSphere user with at least read-only access, to be used when connecting to the vSphere server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vmservices.VMServiceInfo

---

### Notes
Category: vm services
API: vmservices-vsphere-credential-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcVMSVsphereCred [-Node] <String> [-VSphereServer <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVMSVsphereCred [-Node] <String> [-VSphereServer <String>] [-Username <String>] [-Password <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVMSVsphereCred [-Node] <String> [-VSphereServer <String>] -Credential <PSCredential> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
