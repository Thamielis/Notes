Get-NcEnvironmentSensors
------------------------

### Synopsis
Gets the sensors information from the environmental subsystem.

---

### Description

Gets the sensors information from the environmental subsystem.

---

### Related Links
* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

Get-NcEnvironmentSensors -NodeName f3250-215-73-75-01
Get details of all sensors on a particular node

Node                 Sensor                          Type                 ThresholdSensorState   Discret
----                 ------                          ----                 --------------------   -------
f3250-215-73-75-01   PSU2                            fru                  normal                 normal
f3250-215-73-75-01   PSU1                            fru                  normal                 normal
f3250-215-73-75-01   Fan3                            fru                  normal                 normal
f3250-215-73-75-01   Fan2                            fru                  normal                 normal
f3250-215-73-75-01   Fan1                            fru                  normal                 normal
f3250-215-73-75-01   Charger Volt                    voltage              normal
f3250-215-73-75-01   Charger Cycles                  counter              normal
f3250-215-73-75-01   Charger Curr                    current              normal
f3250-215-73-75-01   Bat Temp                        thermal              normal
f3250-215-73-75-01   Bat Run Time                    battery_life         normal
f3250-215-73-75-01   Bat Capacity                    current              normal
f3250-215-73-75-01   Bat Curr                        current              normal
f3250-215-73-75-01   Bat 8.0V                        voltage              normal
f3250-215-73-75-01   Bat 1.8V                        voltage              normal
f3250-215-73-75-01   PSU2 Over Curr                  discrete             normal                 normal
f3250-215-73-75-01   PSU2 Over Volt                  discrete             normal                 normal
f3250-215-73-75-01   PSU2 Over Temp                  discrete             normal                 normal
f3250-215-73-75-01   PSU2 Input Type                 discrete             normal                 normal
f3250-215-73-75-01   PSU2 Fault                      discrete             normal                 normal
f3250-215-73-75-01   PSU2 Pwr Out OK                 discrete             normal                 normal
f3250-215-73-75-01   PSU2 Pwr In OK                  discrete             normal                 normal
f3250-215-73-75-01   PSU2 Fan2 Fault                 discrete             normal                 normal
f3250-215-73-75-01   PSU2 Fan2 Speed                 fan                  normal
f3250-215-73-75-01   PSU2 Fan1 Fault                 discrete             normal                 normal
f3250-215-73-75-01   PSU2 Fan1 Speed                 fan                  normal
f3250-215-73-75-01   PSU2 Curr                       current              normal
f3250-215-73-75-01   PSU2 Temp                       thermal              normal
f3250-215-73-75-01   PSU2 Present                    discrete             normal                 normal
f3250-215-73-75-01   PSU1 Over Curr                  discrete             normal                 normal
f3250-215-73-75-01   PSU1 Over Volt                  discrete             normal                 normal
f3250-215-73-75-01   PSU1 Over Temp                  discrete             normal                 normal
f3250-215-73-75-01   PSU1 Input Type                 discrete             normal                 normal
f3250-215-73-75-01   PSU1 Fault                      discrete             normal                 normal
f3250-215-73-75-01   PSU1 Pwr Out OK                 discrete             normal                 normal
f3250-215-73-75-01   PSU1 Pwr In OK                  discrete             normal                 normal
f3250-215-73-75-01   PSU1 Fan2 Fault                 discrete             normal                 normal
f3250-215-73-75-01   PSU1 Fan2 Speed                 fan                  normal
f3250-215-73-75-01   PSU1 Fan1 Fault                 discrete             normal                 normal
f3250-215-73-75-01   PSU1 Fan1 Speed                 fan                  normal
f3250-215-73-75-01   PSU1 Curr                       current              normal
f3250-215-73-75-01   PSU1 Temp                       thermal              normal
f3250-215-73-75-01   PSU1 Present                    discrete             normal                 normal
f3250-215-73-75-01   IO 12V OC Flt                   discrete             normal                 normal
f3250-215-73-75-01   IO 12V Curr                     current              normal
f3250-215-73-75-01   IO 12V                          voltage              normal
f3250-215-73-75-01   IO STBY 5V                      voltage              normal
f3250-215-73-75-01   IO 3.3V                         voltage              normal
f3250-215-73-75-01   IO 2.5V                         voltage              normal
f3250-215-73-75-01   IO 1.0V                         voltage              normal
f3250-215-73-75-01   Ctrl 12V OC Flt                 discrete             normal                 normal
f3250-215-73-75-01   Ctrl 12V Curr                   current              normal
f3250-215-73-75-01   LM56 Temp                       thermal              normal
f3250-215-73-75-01   Post FET Ctrl V                 voltage              normal
f3250-215-73-75-01   Ctrl 12V                        voltage              normal
f3250-215-73-75-01   10G 2.5V                        voltage              normal
f3250-215-73-75-01   10G 1.8V                        voltage              normal
f3250-215-73-75-01   10G 1.2V                        voltage              normal
f3250-215-73-75-01   10G 1.0V                        voltage              normal
f3250-215-73-75-01   STBY 5V                         voltage              normal
f3250-215-73-75-01   STBY 1.8V                       voltage              normal
f3250-215-73-75-01   5V                              voltage              normal
f3250-215-73-75-01   3.3V                            voltage              normal
f3250-215-73-75-01   2.5V                            voltage              normal
f3250-215-73-75-01   1.8V                            voltage              normal
f3250-215-73-75-01   1.5V                            voltage              normal
f3250-215-73-75-01   1.2V                            voltage              normal
f3250-215-73-75-01   1.1V                            voltage              normal
f3250-215-73-75-01   1.05V                           voltage              normal
f3250-215-73-75-01   1.0V                            voltage              normal
f3250-215-73-75-01   CPU1 VCC                        voltage              normal
f3250-215-73-75-01   CPU0 VCC                        voltage              normal
f3250-215-73-75-01   CPU VTT                         voltage              normal
f3250-215-73-75-01   Sysfan3 F2 Speed                fan                  normal
f3250-215-73-75-01   Sysfan3 F1 Speed                fan                  normal
f3250-215-73-75-01   Sysfan3 Fault                   discrete             normal                 normal
f3250-215-73-75-01   Sysfan3 Present                 discrete             normal                 normal
f3250-215-73-75-01   Sysfan2 F2 Speed                fan                  normal
f3250-215-73-75-01   Sysfan2 F1 Speed                fan                  normal
f3250-215-73-75-01   Sysfan2 Fault                   discrete             normal                 normal
f3250-215-73-75-01   Sysfan2 Present                 discrete             normal                 normal
f3250-215-73-75-01   Sysfan1 F2 Speed                fan                  normal
f3250-215-73-75-01   Sysfan1 F1 Speed                fan                  normal
f3250-215-73-75-01   Sysfan1 Fault                   discrete             normal                 normal
f3250-215-73-75-01   Sysfan1 Present                 discrete             normal                 normal
f3250-215-73-75-01   IO Mid2 Temp                    thermal              normal
f3250-215-73-75-01   IO Mid1 Temp                    thermal              normal
f3250-215-73-75-01   CPU1 Hot                        discrete             normal                 normal
f3250-215-73-75-01   CPU1 Therm Trip                 discrete             normal                 normal
f3250-215-73-75-01   CPU1 Error                      discrete             normal                 normal
f3250-215-73-75-01   CPU0 Hot                        discrete             normal                 normal
f3250-215-73-75-01   CPU0 Therm Trip                 discrete             normal                 normal
f3250-215-73-75-01   CPU0 Error                      discrete             normal                 normal
f3250-215-73-75-01   NVMEM Bat Temp                  thermal              normal
f3250-215-73-75-01   PCI Slot Temp                   thermal              normal
f3250-215-73-75-01   Out Flow Temp                   thermal              normal
f3250-215-73-75-01   In Flow Temp                    thermal              normal
f3250-215-73-75-01   CPU1 Temp Margin                thermal              normal
f3250-215-73-75-01   CPU0 Temp Margin                thermal              normal
f3250-215-73-75-01   Partner IO Pre                  discrete             normal                 normal
f3250-215-73-75-01   Partner Ctrl Pre                discrete             normal                 normal
f3250-215-73-75-01   SP Status                       discrete             normal                 normal
f3250-215-73-75-01   Usbmon Pres                     discrete             normal                 normal
f3250-215-73-75-01   Usbmon Status                   discrete             normal                 normal
f3250-215-73-75-01   Board Backup Temp               discrete             normal                 normal

---

### Parameters
#### **NodeName**
Specify to filter by Nodes

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node   |

#### **SensorName**
Specify to filter by Sensors

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Sensor |

#### **SensorType**
Specify to filter by type of sensors

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |3       |true (ByPropertyName)|Type   |

#### **ThresholdSensorState**
Specify to filter by threshold sensor state

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DiscreteSensorState**
Specify to filter by discrete sensor state

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[EnvironmentSensorsInfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[EnvironmentSensorsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Environment.EnvironmentSensorsInfo

---

### Notes
Category: environment sensor
API: environment-sensors-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEnvironmentSensors [[-NodeName] <String[]>] [[-SensorName] <String[]>] [[-SensorType] <String[]>] [-ThresholdSensorState <String>] [-DiscreteSensorState <String>] [-Attributes 
```
```PowerShell
<EnvironmentSensorsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEnvironmentSensors -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEnvironmentSensors -Query <EnvironmentSensorsInfo> [-Attributes <EnvironmentSensorsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
