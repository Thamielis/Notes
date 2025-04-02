Invoke-NcSnmpGet
----------------

### Synopsis
Retrieves the value of an SNMP object.

---

### Description

Retrieves the value of an SNMP object.  This is a convenience method, not a high-performance SNMP query tool.

---

### Related Links
* [Invoke-NcSnmpGetNext](Invoke-NcSnmpGetNext)

* [Invoke-NcSnmpWalk](Invoke-NcSnmpWalk)

---

### Examples
> Example 1

```PowerShell
Invoke-NcSnmpGet 1.3.6.1.4.1.789.1.1.2.0 -Raw
Get the value of the specified OID.

NetApp Release RollingRock__8.1.0 Cluster-Mode: Tue Aug 23 05:34:04 PDT 2011

```

---

### Parameters
#### **OID**
Fully qualified object identifier of an SNMP object. Only numeric OID's (ex: .1.3.6.1.4.1.789.1.1.1.0) are allowed.

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ID<br/>Object|

#### **Raw**
Specify Raw to get a string value.  Otherwise, an SnmpValue object is written to the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
Category: snmp
API: snmp-get
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcSnmpGet [-OID] <String> [-Raw] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
