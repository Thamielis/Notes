Add-NcNfsExport
---------------

### Synopsis
Enables pathnames for mounting according to the rules specified.

---

### Description

Enables pathnames for mounting according to the rules specified. New rules for the pathnames take effect immediately, ignoring previous rules for specified pathnames.

---

### Related Links
* [Get-NcNfsExport](Get-NcNfsExport)

* [Set-NcNfsExport](Set-NcNfsExport)

* [Remove-NcNfsExport](Remove-NcNfsExport)

---

### Examples
> Example 1

Add-NcNfsExport /beamvol1 -ReadWrite all-hosts -NoSuid -SecurityFlavors sys
Export volume with junction path /beamvol1 with read-write access to all hosts.

Pathnames
---------
{/beamvol1}

---

### Parameters
#### **Path**
Junction path of the volume to be exported.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|Pathname|

#### **SecurityFlavors**
List of possible security flavors this rule supports. Default security is 'sys'.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |named   |true (ByPropertyName)|SecFlavor|

#### **Anon**
All hosts with this user-id or username have root access to this directory.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReadOnly**
An array of hostnames which only have read privileges for all the security flavors found in the SecurityFlavors list.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ReadWrite**
An array of hostnames which have read and write privileges for all the security flavors found in the SecurityFlavors list.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Root**
Array of hostnames which have roots with 'read-write' or 'read-only' privileges.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NoSuid**
If specified, causes the server file system to silently ignore any attempt to enable the setuid or setgid mode bits.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **CreateMultiClientmatch**
If true, the export rules are created using multiple clientmatches per rule to minimize the number of export rules created.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.AddedRules

---

### Notes
Category: nfs
API: nfs-exportfs-append-rules-2
Family: vserver

---

### Syntax
```PowerShell
Add-NcNfsExport [-Path] <String> [-SecurityFlavors <String[]>] [-Anon <String>] [-ReadOnly <String[]>] [-ReadWrite <String[]>] [-Root <String[]>] [-NoSuid] [-CreateMultiClientmatch <Boolean>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
