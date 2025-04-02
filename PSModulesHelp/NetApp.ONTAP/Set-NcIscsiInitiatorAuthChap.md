Set-NcIscsiInitiatorAuthChap
----------------------------

### Synopsis
Modify CHAP parameters to an existing initiator authentication info whose authentication type is CHAP.

---

### Description

Modify CHAP parameters to an existing initiator authentication info whose authentication type is CHAP.

---

### Related Links
* [Set-NcIscsiInitiatorAuth](Set-NcIscsiInitiatorAuth)

* [Remove-NcIscsiInitiatorAuth](Remove-NcIscsiInitiatorAuth)

* [Get-NcIscsiInitiatorAuth](Get-NcIscsiInitiatorAuth)

---

### Examples
> Example 1

Set-NcIscsiInitiatorAuthChap iqn.1991-05.com.microsoft:win2k8devrre0 -Username user -Password password -OutboundUsername user -OutboundPassword p@ssword
Sets the CHAP inbound username/password and outbound username/password for the given iscsi initiator.

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
iqn.1991-05.com.microsoft:win2k8devrre0                      chap       user                 user

> Example 2

Set-NcIscsiInitiatorAuthChap iqn.1991-05.com.microsoft:win2k8devrre0 -RemoveOutbound
Remove the outbound username and password from the CHAP parameters.

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
iqn.1991-05.com.microsoft:win2k8devrre0                      chap       user

---

### Parameters
#### **Initiator**
Initiator to set CHAP parameters.  Use "default" to set the CHAP parameters for the default initiator.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|InitiatorNodename|

#### **Username**
Inbound CHAP username.  If inbound CHAP parameters are specified they will replace the existing Inbound CHAP parameters.  If they are not specified, the existing Inbound CHAP parameters will continue to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Password**
Inbound CHAP password.  If inbound CHAP parameters are specified they will replace the existing Inbound CHAP parameters.  If they are not specified, the existing Inbound CHAP parameters will continue to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutboundUsername**
Outbound CHAP username.  If outbound CHAP parameters are specified they will replace the existing outbound CHAP parameters.  If they are not specified, the existing outbound CHAP parameters will continue to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutboundPassword**
Outbound CHAP password.  If outbound CHAP parameters are specified they will replace the existing outbound CHAP parameters.  If they are not specified, the existing outbound CHAP parameters will continue to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoveOutbound**
If specified, outbound CHAP parameters will be removed from initiator authentication where outbound CHAP parameters are currently defined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UsePassphrase**
Specify to indicate that the password input should be treated as a passphrase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **InboundCredential**
Inbound CHAP username and password embodied in a PSCredential object.  If they are specified they will replace the existing Inbound CHAP parameters.  If they are not specified, the existing Inbound CHAP parameters will continue to be used.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **OutboundCredential**
Outbound username and password embodied in a PSCredential object.  If they are specified they will replace the existing Outbound CHAP parameters.  If they are not specified, the existing Outbound CHAP parameters will continue to be used.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiSecurityEntryInfo

---

### Notes
Category: iscsi
API: iscsi-initiator-modify-chap-params
Family: vserver

---

### Syntax
```PowerShell
Set-NcIscsiInitiatorAuthChap [-Initiator] <String> [-Username <String>] [-Password <String>] [-OutboundUsername <String>] [-OutboundPassword <String>] [-RemoveOutbound] [-UsePassphrase] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcIscsiInitiatorAuthChap [-Initiator] <String> [-InboundCredential <PSCredential>] [-OutboundCredential <PSCredential>] [-RemoveOutbound] [-UsePassphrase] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
