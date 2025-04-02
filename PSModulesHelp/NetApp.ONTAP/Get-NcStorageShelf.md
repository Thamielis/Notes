Get-NcStorageShelf
------------------

### Synopsis
Get shelf information about one or more storage shelves.

---

### Description

Get shelf information about one or more storage shelves.

---

### Related Links
* [Get-NcStorageShelfError](Get-NcStorageShelfError)

---

### Examples
> Example 1

Get-NcStorageShelf
ConnectionType                  : sas
CoolingFans                     : {1, 2, 3, 4...}
CurrentSensors                  : {1, 2, 3, 4...}
DiskCount                       : 24
FcPorts                         :
IsLocalAttach                   : True
IsLocallyAttachedShelf          :
ModuleType                      : iom3
NcController                    : 10.225.215.73
OpStatus                        : normal
Paths                           : {DataONTAP.C.Types.StorageShelf.StorageShelfPathInfo, DataONTAP.C.Types.StorageShelf.
                                  StorageShelfPathInfo}
PowerSupplyUnits                : {1, 2, 3, 4}
SasPorts                        : {0, 1, 2, 3...}
SerialNumber                    : SHJ000000015430
Shelf                           : 1.2
ShelfBays                       : {0, 1, 2, 3...}
ShelfConnectionType             :
ShelfErrors                     :
ShelfId                         : 2
ShelfModel                      : DS4243
ShelfModules                    : {BA, BA}
ShelfOpStatus                   :
ShelfSerialNumber               :
ShelfState                      :
ShelfUid                        : 50:05:0c:c1:02:04:41:9c
ShelfVendorName                 :
StackId                         : 1
State                           : online
TemperatureSensors              : {1, 2, 3, 4...}
VendorName                      : NETAPP
VoltageSensors                  : {1, 2, 3, 4...}
IsLocalAttachSpecified          : True
IsLocallyAttachedShelfSpecified : False

---

### Parameters
#### **Shelf**
Name of the storage shelf(ves) for which information is to be returned.

|Type        |Required|Position|PipelineInput        |Aliases              |
|------------|--------|--------|---------------------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ShelfName<br/>Shelves|

#### **Vendor**
Restrict results by vendor names.

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|VendorName<br/>Vendors|

#### **ConnectionType**
Restrict results to one or more type of storage shelves. Possible values: fc, sas, unknown

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Types  |

#### **OperationStatus**
Restrict results to shelves in specific operational states : normal, warning, critical, error, unknown

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|State<br/>OpStatus|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[StorageShelfInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[StorageShelfInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageShelf.StorageShelfInfo

---

### Notes
Category: ses
API: storage-shelf-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelf [[-Shelf] <String[]>] [-Vendor <String[]>] [-ConnectionType <String[]>] [-OperationStatus <String[]>] [-Attributes <StorageShelfInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelf -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStorageShelf -Query <StorageShelfInfo> [-Attributes <StorageShelfInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
