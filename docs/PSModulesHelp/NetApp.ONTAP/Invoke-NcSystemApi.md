Invoke-NcSystemApi
------------------

### Synopsis
Sends a raw API request to Data ONTAP.

---

### Description

Sends a raw API request to Data ONTAP.  The request must be formatted as XML.  See the Manage ONTAP SDK documentation for details.

---

### Related Links
* [Get-NcSystemApi](Get-NcSystemApi)

---

### Examples
> Example 1

```PowerShell
$xml = Invoke-NcSystemApi "<system-get-version/>"
$xml.results.version
Call the system-get-version API.

status          : passed
build-timestamp : 1304922348
is-clustered    : true
version         : NetApp Release RollingRock__8.1.0 Cluster-Mode: Mon May 09 06:25:48 PDT 2011
version-tuple   : version-tuple

```
> Example 2

```PowerShell
$request = new-object "System.Xml.XmlDocument"
$request.LoadXml("<aggr-get-iter/>")
$response = Invoke-NcSystemApi $request
$response.results."attributes-list"."aggr-attributes"[0]
Call the aggr-get-iter API to get the list of aggregates and display the first record returned.

aggr-64bit-upgrade-attributes : aggr-64bit-upgrade-attributes
aggr-fs-attributes            : aggr-fs-attributes
aggr-inode-attributes         : aggr-inode-attributes
aggr-ownership-attributes     : aggr-ownership-attributes
aggr-performance-attributes   : aggr-performance-attributes
aggr-raid-attributes          : aggr-raid-attributes
aggr-snaplock-attributes      : aggr-snaplock-attributes
aggr-snapshot-attributes      : aggr-snapshot-attributes
aggr-space-attributes         : aggr-space-attributes
aggr-volume-count-attributes  : aggr-volume-count-attributes
aggregate-name                : aggr0
aggregate-uuid                : b48decd3-704b-11e0-b9c5-123478563412
nodes                         : nodes
striping-type                 : unknown

```

---

### Parameters
#### **Request**
The Zephyr API (ZAPI) request.  This argument accepts the request as a string, but it must be a well-formed XML fragment.  Do not include the XML header or the <netapp> wrapper tag.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

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

#### **RequestXML**
The Zephyr API (ZAPI) request.  This argument accepts the request as a .NET XmlDocument object.  Do not include the XML header or the <netapp> wrapper tag when building the request.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Inputs
System.Xml.XmlDocument

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Notes
Category: system
Family: cluster, vserver

---

### Syntax
```PowerShell
Invoke-NcSystemApi [-Request] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSystemApi [-RequestXML] <XmlDocument> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
