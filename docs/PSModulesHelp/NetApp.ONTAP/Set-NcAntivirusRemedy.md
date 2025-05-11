Set-NcAntivirusRemedy
---------------------

### Synopsis
Set the quarantine information of the Anti-Virus engine installed.

---

### Description

Set the quarantine information of the Anti-Virus engine installed.

---

### Related Links
* [Get-NcAntivirusRemedy](Get-NcAntivirusRemedy)

---

### Examples
> Example 1

```PowerShell
Set-NcAntivirusRemedy -Option add_extension -Extension .vir
Set the remedy option to "add_extension" and set the extension to ".vir".

NcController : 10.61.172.155
Action       : quarantine
Option       : add_extension
Extension    : .vir
Repair       : quarantine
Directory    : /quarantine

```

---

### Parameters
#### **Action**
The remedy action desired. Possible values: "none" - no action will be taken; "repair" - file will be reparied; "delete" - file will be deleted; "quarantine" -  file will be quarantined.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Option**
The option of the remedy action desired. Possible values: "move" - file will be moved; "add_extension" - an extension will be added to the file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Extension**
The file extension to use for the remedy action.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Repair**
The failed repair option to try. Possible values; "none" - no action will be taken; "delete" - file will be deleted; "quarantine" - file will be quarantined.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Directory**
The pathname of the directory to use for quarantine.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Antivirus.AvRemedyInfo

---

### Notes
Category: antivirus
API: av-set-remedy-info
Family: cluster

---

### Syntax
```PowerShell
Set-NcAntivirusRemedy [-Action <String>] [-Option <String>] [-Extension <String>] [-Repair <String>] [-Directory <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
