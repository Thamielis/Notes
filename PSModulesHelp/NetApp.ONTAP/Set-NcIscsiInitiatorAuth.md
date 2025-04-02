Set-NcIscsiInitiatorAuth
------------------------

### Synopsis
Set initiator authentication method.

---

### Description

Set initiator authentication method.

---

### Related Links
* [Set-NcIscsiInitiatorAuthChap](Set-NcIscsiInitiatorAuthChap)

* [Remove-NcIscsiInitiatorAuth](Remove-NcIscsiInitiatorAuth)

* [Get-NcIscsiInitiatorAuth](Get-NcIscsiInitiatorAuth)

---

### Examples
> Example 1

Set-NcIscsiInitiatorAuth -Initiator iqn.1991-05.com.microsoft:win2k8devrre0 -Chap -InboundCredential user
Set the initiator authentication method for the given initiator to CHAP with inbound credentials.

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
iqn.1991-05.com.microsoft:win2k8devrre0                      chap       user

> Example 2

Set-NcIscsiInitiatorAuth default -Deny
Set the default iscsi initiator authentication method to deny.

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
default                                                      deny

---

### Parameters
#### **Initiator**
Initiator to set authentication method.  Use "default" to set the authentication method for the default initiator.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **None**
If specified, the authentication method will be set to none.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **InitiatorAddressRanges**
May be a single IPv4 or IPv6 address or a range containing a start address and an end address. The start and end addresses themselves are included in the range. If not present, the initiator is allowed to log in from any IP address.
This parameter is available in ONTAP 9.2 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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

#### **Chap**
If specified, the authentication method will be set to chap.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Username**
Inbound CHAP user name, required when the Chap switch is present.  Alternately, the CHAP username and password can be passed in a PSCredential object using the InboundCredential parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Password**
Inbound CHAP user password, required when the Chap switch is present.  Alternately, the CHAP username and password can be passed in a PSCredential object using the InboundCredential parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **OutboundUsername**
Outbound CHAP user name.  Outbound authentication is optional. If Outbound authentication is not specified, then the initiator can only do inbound traffic.  Alternately, the outbound CHAP username and password can be passed in a PSCredential object using the OutboundCredential parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutboundPassword**
Outbound CHAP user password.  Outbound authentication is optional. If Outbound authentication is not specified, then the initiator can only do inbound traffic.  Alternately, the outbound CHAP username and password can be passed in a PSCredential object using the OutboundCredential parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UsePassphrase**
Specify to indicate that the password input should be treated as a passphrase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InboundCredential**
Inbound CHAP username and password embodied in a PSCredential object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |false        |

#### **OutboundCredential**
Outbound username and password embodied in a PSCredential object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **Deny**
If specified, the authentication method will be set to deny.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiSecurityEntryInfo

---

### Notes
Category: iscsi
API: iscsi-initiator-add-auth
Family: vserver

---

### Syntax
```PowerShell
Set-NcIscsiInitiatorAuth [-Initiator] <String> -None [-InitiatorAddressRanges <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcIscsiInitiatorAuth [-Initiator] <String> -Chap -Username <String> -Password <String> [-OutboundUsername <String>] [-OutboundPassword <String>] [-UsePassphrase] [-InitiatorAddressRanges 
```
```PowerShell
<String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcIscsiInitiatorAuth [-Initiator] <String> -Chap -InboundCredential <PSCredential> [-OutboundCredential <PSCredential>] [-UsePassphrase] [-InitiatorAddressRanges <String[]>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcIscsiInitiatorAuth [-Initiator] <String> -Deny [-InitiatorAddressRanges <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcIscsiInitiatorAuth [-Initiator] <String> [-InitiatorAddressRanges <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
