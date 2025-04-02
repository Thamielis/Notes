Get-NcEmsDestinationName
------------------------

### Synopsis
Retrieves a collection of event destinations.

---

### Description

Retrieves a collection of event destinations. Create an event destination using New-NcEmsEventNotificationDestination.This cmdlet is supported with Rest.

---

### Related Links
* [Set-NcEmsDestinationName](Set-NcEmsDestinationName)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsDestinationName -Name snmp-traphost
NcController            : 10.236.69.71
CertificateCA           :
CertificateName         :
CertificateSerialNumber :
Connectivity            : DataONTAP.C.Types.Ems.Connectivity
Destination             :
FilterName              : {default-trap-events}
Name                    : snmp-traphost
SystemDefined           : True
Type                    : snmp
SyslogPort              :
SyslogTransport         :

```

---

### Parameters
#### **Name**
Name of the Destination.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |0       |true (ByPropertyName)|DestinationName|

#### **Template**
Specify $a = Get-NcEmsDestinationName -Template, to get an empty event destination object for use with advanced queries involving the Attributes like $b = Get-NcEmsDestinationName -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcEmsDestinationName -Template, to get an empty event destination object for use with advanced queries involving the Attributes like $b = Get-NcEmsDestinationName -Query $a.

|Type                                              |Required|Position|PipelineInput|
|--------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Ems.EmsDestinationNameOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.Ems.EmsDestinationNameOutput, to get an empty event destination object for use with advanced queries involving the Attributes like $b = Get-NcEmsDestinationName -Attributes $a.

|Type                                              |Required|Position|PipelineInput|
|--------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Ems.EmsDestinationNameOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsDestinationNameOutput

---

### Notes
Category: Ems
Api: api/support/ems/destinations/{name}
Family: Controller

---

### Syntax
```PowerShell
Get-NcEmsDestinationName [-Name] <String> [<CommonParameters>]
```
```PowerShell
Get-NcEmsDestinationName -Template <DataONTAP.C.Types.Ems.EmsDestinationNameOutput> [<CommonParameters>]
```
```PowerShell
Get-NcEmsDestinationName -Query <DataONTAP.C.Types.Ems.EmsDestinationNameOutput> [-Attributes <DataONTAP.C.Types.Ems.EmsDestinationNameOutput>] [<CommonParameters>]
```
