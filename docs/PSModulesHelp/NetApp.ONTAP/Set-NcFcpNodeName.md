Set-NcFcpNodeName
-----------------

### Synopsis
Set the current FCP World Wide Node Name (WWNN).

---

### Description

Set the current FCP World Wide Node Name (WWNN). This WWNN is in the form XX:XX:XX:XX:XX:XX:XX:XX where X is a hexadecimal digit. The supplied WWNN must also match the vendor's registered namespace unless the force argument is also supplied. The registered namespace is "2X:XX:00:a0:98:XX:XX:XX" and the FCP service must be offline. Changes will take place when the service is brought online.

---

### Related Links
* [Get-NcFcpNodeName](Get-NcFcpNodeName)

---

### Examples
> Example 1

```PowerShell
Set-NcFcpNodeName 20:06:00:a0:98:29:49:ba
Set the FCP node name for the current vserver.
```

---

### Parameters
#### **Name**
New FCP node name.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName<br/>wwnn|

#### **Force**
If specified, allow setting the WWNN to a value outside the vendor's registered namespace for the current mode. If not present, the request will fail unless the supplied WWNN is inside the correct namespace.

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: fcp
API: fcp-node-set-name
Family: vserver

---

### Syntax
```PowerShell
Set-NcFcpNodeName [-Name] <String> [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
