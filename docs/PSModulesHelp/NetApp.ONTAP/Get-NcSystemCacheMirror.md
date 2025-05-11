Get-NcSystemCacheMirror
-----------------------

### Synopsis
Iterate over a list of Cache Mirror Settings.

---

### Description

Iterate over a list of Cache Mirror Settings.

---

### Examples
> Example 1

Get-NcSystemCacheMirror
Iterate over a list of Cache Mirror Settings.

Enabled NcController                  Node                                       EnabledSpecified
                      ------- ------------                  ----                                       ----------------
                         True 10.236.44.243                 sti32-vsim-ucs480e                                     True
                         True 10.236.44.243                 sti32-vsim-ucs480f                                     True

> Example 2

Get-NcSystemCacheMirror -Node sti32-vsim-ucs480f
Get the attributes of Cache Mirror Settings of node sti32-vsim-ucs480f

Enabled NcController                  Node                                       EnabledSpecified
                      ------- ------------                  ----                                       ----------------
                         True 10.236.44.243                 sti32-vsim-ucs480f                                     True

> Example 3

$c = Get-NcSystemCacheMirror -Template
$c.Node = "sti32-vsim-ucs480f"
Get-NcSystemCacheMirror -Query $c
Get the attributes of Cache Mirror Settings of node sti32-vsim-ucs480f

Enabled NcController                  Node                                       EnabledSpecified
                      ------- ------------                  ----                                       ----------------
                         True 10.236.44.243                 sti32-vsim-ucs480f                                     True

---

### Parameters
#### **Node**
Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information isavailable will be returned.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CacheMirror]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
Specify to get an empty CacheMirror object object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CacheMirror object object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemCacheMirror -Template" to get the initially empty CacheMirror object object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CacheMirror]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.CacheMirror

---

### Notes
Category: system
API: system-cache-mirror-get-iter
Family: ontap-cluster

---

### Syntax
```PowerShell
Get-NcSystemCacheMirror [[-Node] <String[]>] [-Attributes <CacheMirror>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemCacheMirror -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcSystemCacheMirror -Query <CacheMirror> [-Attributes <CacheMirror>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
