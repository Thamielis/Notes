New-NcCifsCharacterMapping
--------------------------

### Synopsis
Create a character mapping.

---

### Description

Create a character mapping.

---

### Related Links
* [Get-NcCifsCharacterMapping](Get-NcCifsCharacterMapping)

* [Remove-NcCifsCharacterMapping](Remove-NcCifsCharacterMapping)

* [Set-NcCifsCharacterMapping](Set-NcCifsCharacterMapping)

---

### Examples
> Example 1

New-NcCifsCharacterMapping -Volume cifs_ds1 -Mapping @{"05"="E105";"17"="F017";"5C"="EA5C"}
Add a new CIFS character mapping for the given volume.

Volume                     Vserver                    Mapping
------                     -------                    -------
cifs_ds1                   beam01                     {17:f017, 5c:ea5c, 05:e105}

---

### Parameters
#### **Volume**
The name of the volume for which character mapping needs to be applied.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Mapping**
The mapping for invalid characters.
The hashtable contains the mapping of invalid CIFS filename characters to valid characters.  The key should be specified as a 2-digit hex value.  The value should be a 4-digit hex value.
The valid hex values for the keys are: 01-19, 5C, 3A, 2A, 3F, 22, 3C, 3E, 7C, B1.
Target values should reside in the 'Private Use Area' of Unicode in the following rage: E000-F8FF.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cifs.CifsCharacterMapping

---

### Notes
Category: cifs
API: cifs-character-mapping-create
Family: vserver

---

### Syntax
```PowerShell
New-NcCifsCharacterMapping [-Volume] <String> [-Mapping] <Hashtable> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
