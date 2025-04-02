Invoke-NcSnmpWalk
-----------------

### Synopsis
Retrieves a tree of MIB objects.

---

### Description

Retrieves a tree of MIB objects.  This is a convenience method, not a high-performance SNMP query tool.

---

### Related Links
* [Invoke-NcSnmpGet](Invoke-NcSnmpGet)

* [Invoke-NcSnmpGetNext](Invoke-NcSnmpGetNext)

---

### Examples
> Example 1

```PowerShell
Invoke-NcSnmpWalk 1.3.6.1.4.1.789.1.1.1.0
Walk the SNMP MIB starting with the specified OID.

NcController       : 10.61.172.155
NextObjectId       :
Value              : 2
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.2.0
Value              : NetApp Release RollingRock__8.1.0 Cluster-Mode: Tue Aug 23 05:34:04 PDT 2011
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.3.0
Value              :
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.4.0
Value              : 1
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.5.0
Value              :
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.6.0
Value              : 2.5.0
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.7.0
Value              : https://10.61.172.155/cem
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.8.0
Value              : https://10.61.172.155/servlets/netapp.servlets.admin.XMLrequest_filer
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.9.0
Value              : 1-80-000011
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.10.0
Value              : unknown
IsValueHexadecimal : False

NcController       : 10.61.172.155
NextObjectId       : 1.3.6.1.4.1.789.1.1.11.0
Value              : 1
IsValueHexadecimal : False

```

---

### Parameters
#### **OID**
Fully qualified object identifier of an SNMP object. Only numeric OID's (ex: .1.3.6.1.4.1.789.1.1.1.0) are allowed.

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ID<br/>Object|

#### **Raw**
Specify Raw to get string values.  Otherwise, SnmpValue objects are written to the output.

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
API: snmp-get, snmp-get-next
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcSnmpWalk [-OID] <String> [-Raw] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
