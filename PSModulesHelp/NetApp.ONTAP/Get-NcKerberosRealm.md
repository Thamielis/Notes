Get-NcKerberosRealm
-------------------

### Synopsis
Get the list of Kerberos realm configurations.

---

### Description

Get the list of Kerberos realm configurations.

---

### Related Links
* [New-NcKerberosRealm](New-NcKerberosRealm)

* [Remove-NcKerberosRealm](Remove-NcKerberosRealm)

* [Set-NcKerberosRealm](Set-NcKerberosRealm)

---

### Parameters
#### **ConfigName**
One or more Kerberos configuration names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Realm**
One or more Kerberos realm names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a KerberosRealm object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcKerberosRealm -Template" to get the initially empty KerberosRealm object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[KerberosRealm]`|false   |named   |false        |

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
Specify to get an empty KerberosRealm object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a KerberosRealm object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcKerberosRealm -Template" to get the initially empty KerberosRealm object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[KerberosRealm]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Kerberos.KerberosRealm

---

### Notes
Category: kerberos
API: kerberos-realm-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcKerberosRealm [[-ConfigName] <String[]>] [[-Realm] <String[]>] [-Attributes <KerberosRealm>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcKerberosRealm -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcKerberosRealm -Query <KerberosRealm> [-Attributes <KerberosRealm>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
