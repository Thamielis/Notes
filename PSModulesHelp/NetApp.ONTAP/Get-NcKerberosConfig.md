Get-NcKerberosConfig
--------------------

### Synopsis
Get Kerberos configuration information for a group of LIFs.

---

### Description

Get Kerberos configuration information for a group of LIFs.

---

### Related Links
* [Enable-NcKerberosConfig](Enable-NcKerberosConfig)

* [Disable-NcKerberosConfig](Disable-NcKerberosConfig)

---

### Examples
> Example 1

Get-NcKerberosConfig -Vserver dlamotta01
Get the Kerberos configuration for vserver dlamotta01.

InterfaceName                        IpAddress             IsKerberosEnabled   Vserver
-------------                        ---------             -----------------   -------
dlamotta01_lif_data1                 10.60.189.147               False         dlamotta01
dlamotta01_lif_data2                 10.60.189.173               False         dlamotta01
dlamotta01_lif_mgmt                  10.60.189.148               False         dlamotta01

> Example 2

$q = Get-NcKerberosConfig -Template
$q.IpAddress = "10.60.189.145"
Get-NcKerberosConfig -Query $q
Get the Kerberos configuration for the given IP address.

InterfaceName                        IpAddress             IsKerberosEnabled   Vserver
-------------                        ---------             -----------------   -------
costea02_lif_mgmt                    10.60.189.145               False         costea02

---

### Parameters
#### **Vserver**
One or more vserver names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **InterfaceName**
One or more logical interfaces.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a KerberosConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcKerberosConfig -Template" to get the initially empty KerberosConfigInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[KerberosConfigInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty KerberosConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a KerberosConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcKerberosConfig -Template" to get the initially empty KerberosConfigInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[KerberosConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Kerberos.KerberosConfigInfo

---

### Notes
Category: kerberos
API: kerberos-config-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcKerberosConfig [[-Vserver] <String[]>] [[-InterfaceName] <String[]>] [-Attributes <KerberosConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcKerberosConfig -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcKerberosConfig -Query <KerberosConfigInfo> [-Attributes <KerberosConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
