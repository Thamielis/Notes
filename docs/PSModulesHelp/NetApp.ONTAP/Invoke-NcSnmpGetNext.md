Invoke-NcSnmpGetNext
--------------------

### Synopsis
Retrieves the next OID in the MIB tree of data.

---

### Description

Retrieves the next OID in the MIB tree of data.  Instead of returning the data you requested, it returns the next OID in the tree and its value.  Unlike Invoke-NaSnmpGet, this API does return data for an OID which is too short or is missing the index part of the OID.  This is a convenience method, not a high-performance SNMP query tool.

---

### Related Links
* [Invoke-NcSnmpGet](Invoke-NcSnmpGet)

* [Invoke-NcSnmpWalk](Invoke-NcSnmpWalk)

---

### Examples
> Example 1

```PowerShell
Invoke-NcSnmpGetNext 1.3.6.1.4.1.789.1.1.1.0
Get the OID after the one specified.

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.2.0
Value              : NetApp Release RollingRock__8.1.0 Cluster-Mode: Tue Aug 23 05:34:04 PDT 2011
IsValueHexadecimal : False

```

---

### Parameters
#### **OID**
Object Identifier of a snmp object.  The OID may be a fully qualified OID or a partial OID.  Only numeric OID's (ex: .1.3.6.1.4.1.789.1.1.1.0) are allowed.

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ID<br/>Object|

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
API: snmp-get-next
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcSnmpGetNext [-OID] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
