Remove-NcCifsTrustedDomain
--------------------------

### Synopsis
Remove from the list of trusted domains for name-mapping search.

---

### Description

Remove from the list of trusted domains for name-mapping search.

---

### Related Links
* [Add-NcCifsTrustedDomain](Add-NcCifsTrustedDomain)

* [Set-NcCifsTrustedDomain](Set-NcCifsTrustedDomain)

* [Get-NcCifsTrustedDomain](Get-NcCifsTrustedDomain)

---

### Examples
> Example 1

Remove-NcCifsTrustedDomain -TrustedDomain rtprre.testdomain
Remove the rtprre.testdomain from the list of trusted domains for name mapping search.

TrustedDomains                                          Vserver
--------------                                          -------
{VTWDC.TESTDOMAIN}                                      beam_vsim01

---

### Parameters
#### **TrustedDomain**
Trusted domains to remove from the search list.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cifs.CifsDomainNameMappingSearch

---

### Notes
Category: cifs
API: cifs-domain-name-mapping-search-remove
Family: vserver

---

### Syntax
```PowerShell
Remove-NcCifsTrustedDomain [-TrustedDomain] <String[]> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
