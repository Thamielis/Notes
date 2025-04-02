Set-NcCifsCharacterMapping
--------------------------

### Synopsis
Modify a character mapping.

---

### Description

Modify a character mapping.

---

### Related Links
* [Get-NcCifsCharacterMapping](Get-NcCifsCharacterMapping)

* [New-NcCifsCharacterMapping](New-NcCifsCharacterMapping)

* [Remove-NcCifsCharacterMapping](Remove-NcCifsCharacterMapping)

---

### Examples
> Example 1

Set-NcCifsCharacterMapping -Volume cifs_ds1 -UpdatedMapping @{"05"="E205";"17"="E017"}
Update the character mappings for the 0x05 and 0x17 characters.  If the mappings do not already exist, they will be added.

Volume                     Vserver                    Mapping
------                     -------                    -------
cifs_ds1                   beam01                     {17:e017, 05:e205, 5c:ea5c}

> Example 2

Set-NcCifsCharacterMapping -Volume cifs_ds1 -UpdatedMapping @{"05"=""}
Remove the character mapping for the 0x05 character.

Volume                     Vserver                    Mapping
------                     -------                    -------
cifs_ds1                   beam01                     {17:e017, 5c:ea5c}

> Example 3

Set-NcCifsCharacterMapping -Volume cifs_ds1 -Mapping @{"19"="E019";"5C"="E05C"}
Replace the character mapping for the volume with a new character mapping.

Volume                     Vserver                    Mapping
------                     -------                    -------
cifs_ds1                   beam01                     {19:e019, 5c:e05c}

---

### Parameters
#### **Volume**
The name of the volume for which character mapping needs to be applied.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Mapping**
The mapping for invalid characters.  The existing mapping will be replaced.
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

#### **UpdatedMapping**
The updated character mapping.  Unspecified mappings will be unchanged.
The hashtable contains the mapping of invalid CIFS filename characters to valid characters.  The key should be specified as a 2-digit hex value.  The value should be a 4-digit hex value.
The valid hex values for the keys are: 01-19, 5C, 3A, 2A, 3F, 22, 3C, 3E, 7C, B1.
Target values should reside in the 'Private Use Area' of Unicode in the following rage: E000-F8FF.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|true    |2       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsCharacterMapping

---

### Notes
Category: cifs
API: cifs-character-mapping-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsCharacterMapping [-Volume] <String> [-Mapping] <Hashtable> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcCifsCharacterMapping [-Volume] <String> [-UpdatedMapping] <Hashtable> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
