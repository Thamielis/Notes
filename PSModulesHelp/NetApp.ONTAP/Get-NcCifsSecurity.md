Get-NcCifsSecurity
------------------

### Synopsis
Get CIFS security tunable parameters.

---

### Description

Get CIFS security tunable parameters.

---

### Related Links
* [Set-NcCifsSecurity](Set-NcCifsSecurity)

---

### Examples
> Example 1

Get-NcCifsSecurity
Get the tunable CIFS security parameters for the current Vserver.

KerberosClockSkew          KerberosRenewAge         KerberosTicketAge
-----------------          ----------------         -----------------
                5                         7                        10

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a CifsSecurity object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsSecurity -Template" to get the initially empty CifsSecurity object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CifsSecurity]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty CifsSecurity object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsSecurity object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsSecurity -Template" to get the initially empty CifsSecurity object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CifsSecurity]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSecurity

---

### Notes
Category: cifs
API: cifs-security-get-iter
Family: vserver

---

### Syntax
```PowerShell
Get-NcCifsSecurity [-Attributes <CifsSecurity>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSecurity -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSecurity -Query <CifsSecurity> [-Attributes <CifsSecurity>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
