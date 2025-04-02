Get-NcFpolicyStatus
-------------------

### Synopsis
Get FPolicy policy status information.

---

### Description

Get FPolicy policy status information.

---

### Related Links
* [Enable-NcFpolicyPolicy](Enable-NcFpolicyPolicy)

* [Disable-NcFpolicyPolicy](Disable-NcFpolicyPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcFpolicyStatus -Name test_policy
Get the status of the given policy.

PolicyName              : test_policy
SequenceNumber          :
Status                  : False
Vserver                 : beam01
SequenceNumberSpecified : False

```

---

### Parameters
#### **Name**
One or more Fpolicy policies to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FpolicyPolicyStatusInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFpolicyStatus -Template" to get the initially empty FpolicyPolicyStatusInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FpolicyPolicyStatusInfo]`|false   |named   |false        |

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
Specify to get an empty FpolicyPolicyStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FpolicyPolicyStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFpolicyStatus -Template" to get the initially empty FpolicyPolicyStatusInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FpolicyPolicyStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyPolicyStatusInfo

---

### Notes
Category: fpolicy
API: fpolicy-policy-status-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFpolicyStatus [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <FpolicyPolicyStatusInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyStatus -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyStatus -Query <FpolicyPolicyStatusInfo> [-Attributes <FpolicyPolicyStatusInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
