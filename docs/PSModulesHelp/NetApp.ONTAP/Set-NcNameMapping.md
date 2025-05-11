Set-NcNameMapping
-----------------

### Synopsis
Modify an existing name mapping entry.

---

### Description

Modify an existing name mapping entry.

---

### Related Links
* [Get-NcNameMapping](Get-NcNameMapping)

* [Move-NcNameMapping](Move-NcNameMapping)

* [New-NcNameMapping](New-NcNameMapping)

* [Remove-NcNameMapping](Remove-NcNameMapping)

---

### Examples
> Example 1

```PowerShell
Set-NcNameMapping -Direction win_unix -Position 1 -Replacement simpsbart
Change the replacement for the Windows to Unix name mapping at position 1.

Direction         : win_unix
NcController      : 192.168.182.144
Pattern           : TESTDOMAIN\\bart
Position          : 1
Replacement       : simpsbart
PositionSpecified : True

```

---

### Parameters
#### **Direction**
Direction in which the name mapping is applied. Possible values:
"krb_unix"  - Kerberos principal name to UNIX user name mapping
"win_unix"  - Windows user name to UNIX user name mapping
"unix_win"  - UNIX user name to Windows user name mapping
Valid Values:

* krb_unix
* win_unix
* unix_win

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Position**
Position of an existing name mapping in the list of name mappings for this Vserver.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|

#### **Pattern**
Pattern to use to match the name while searching for a name that can be used as a replacement. The pattern is a UNIX-style regular expression. Regular expressions are case-insensitive when mapping from Windows to UNIX, and they are case-sensitive for mappings from Kerberos to UNIX and UNIX to Windows.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Replacement**
The name that is to be used as a replacement if the pattern associated with this entry matches. The replacement is a string containing escape sequences representing subexpressions from the pattern, as in the UNIX 'sed' program.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Address**
Specifies the IP address which used to match the client IP address with the pattern.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|IPAddress<br/>IP|

#### **Hostname**
Specifies the Hostname used to match the client IP address with the list of IP addresses corresponding to the provided hostname.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.NameMapping.NameMappingInfo

---

### Notes
Category: name mapping
API: name-mapping-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNameMapping [-Direction] <String> [-Position] <Int32> [[-Pattern] <String>] [[-Replacement] <String>] [-Address <String>] [-Hostname <String>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
