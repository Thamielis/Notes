Add-NcCifsHomeDirectorySearchPath
---------------------------------

### Synopsis
Add a path to the list of paths that will be searched to find a CIFS user's home directory.

---

### Description

Add a path to the list of paths that will be searched to find a CIFS user's home directory.

---

### Related Links
* [Get-NcCifsHomeDirectorySearchPath](Get-NcCifsHomeDirectorySearchPath)

* [Set-NcCifsHomeDirectorySearchPath](Set-NcCifsHomeDirectorySearchPath)

* [Remove-NcCifsHomeDirectorySearchPath](Remove-NcCifsHomeDirectorySearchPath)

---

### Examples
> Example 1

Add-NcCifsHomeDirectorySearchPath -Path /usr/frank
Add path /usr/frank to the paths that will be searched to find a CIFS user's home directory

Position Path
-------- ----
       1 /usr/frank

---

### Parameters
#### **Path**
The file system path that will be searched for finding a CIFS user's home directory.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cifs.CifsHomeDirectorySearchPath

---

### Notes
Category: cifs
API: cifs-home-directory-search-path-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcCifsHomeDirectorySearchPath [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
