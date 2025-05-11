Add-NcCifsPreferredDomainController
-----------------------------------

### Synopsis
Add to a list of preferred domain controllers

---

### Description

Add to a list of preferred domain controllers

---

### Related Links
* [Get-NcCifsPreferredDomainController](Get-NcCifsPreferredDomainController)

* [Remove-NcCifsPreferredDomainController](Remove-NcCifsPreferredDomainController)

---

### Examples
> Example 1

Add-NcCifsPreferredDomainController -Domain TEST -DomainControllers 10.10.10.5
Add the domain controller with address 10.10.10.5 to the list of preferred domain controllers for domain TEST.

Domain                                  PreferredDc
------                                  -----------
TEST                                    {10.10.10.5}

---

### Parameters
#### **Domain**
The fully qualified domain name of the Active Directory domain to which the domain controllers in the list belong.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **DomainControllers**
List of preferred domain controllers to add to the list for this Domain.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **SkipConfigValidation**
Skip Configuration Validation

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|true    |named   |true (ByPropertyName)|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsDomainPreferredDc

---

### Notes
Category: cifs
API: cifs-domain-preferred-dc-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcCifsPreferredDomainController [-Domain] <String> [-DomainControllers] <String[]> -SkipConfigValidation <Boolean> [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
