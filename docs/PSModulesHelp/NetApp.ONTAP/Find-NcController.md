Find-NcController
-----------------

### Synopsis
Discover clustered Data ONTAP controllers.

---

### Description

Discover clustered Data ONTAP controllers.  This cmdlet is used in various ways to find controllers on the network.  It uses SNMP to perform the discovery, so SNMP must be enabled on the controllers.  It does not rely on any SNMP functionality in the Microsoft Windows host operating system.  This cmdlet does support IPv6.

To discover a single controller:

Find-NcController -Address 10.58.94.234

To discover controllers within a range of addresses:

Find-NcController -StartAddress 10.58.94.1 -EndAddress 10.58.94.254

To discover controllers on a subnet:

Find-NcController -Address 10.58.94.1 -Mask 255.255.255.0

or use CIDR notation:

Find-NcController -Address 10.58.94.0/24

---

### Related Links
* [Connect-NcController](Connect-NcController)

---

### Examples
> Example 1

```PowerShell
Find-NcController 10.58.94.234
Discover a controller (if any exists) at address '10.58.94.234'.

Type             : Cluster
SerialNumber     : 1-80-000011
Uuid             : fca8c5f0-7cb6-11e0-a998-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          : Chris Lionetti
Location         : SeaLab-A7
Address          : 10.58.94.234
Name             : Cerebus

```
> Example 2

```PowerShell
Find-NcController -StartAddress 10.58.94.1 -EndAddress 10.58.94.254 -Timeout 250
Discover all controllers between the addresses '10.58.94.1' and '10.58.94.254', inclusive.

Type             : Cluster
SerialNumber     : 1-80-000013
Uuid             : be838e1e-9f67-11e0-8878-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          :
Location         : sealab-A7
Address          : 10.58.94.217
Name             : Cyclop

Type             : Cluster
SerialNumber     : 1-80-000013
Uuid             : be838e1e-9f67-11e0-8878-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          :
Location         : sealab-A7
Address          : 10.58.94.218
Name             : Cyclop

Type             : Cluster
SerialNumber     : 1-80-000013
Uuid             : be838e1e-9f67-11e0-8878-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          :
Location         : sealab-A7
Address          : 10.58.94.219
Name             : Cyclop

Type             : Cluster
SerialNumber     : 1-80-000011
Uuid             : fca8c5f0-7cb6-11e0-a998-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          : Chris Lionetti
Location         : SeaLab-A7
Address          : 10.58.94.234
Name             : Cerebus

Type             : Cluster
SerialNumber     : 1-80-000011
Uuid             : fca8c5f0-7cb6-11e0-a998-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          : Chris Lionetti
Location         : SeaLab-A7
Address          : 10.58.94.244
Name             : Cerebus

```
> Example 3

```PowerShell
Find-NcController -Address 10.58.94.0 -Mask 255.255.255.0
Find all controllers on a subnet.  The -Address parameter is any address on the subnet, while the -Mask parameter defines the range of addresses using the subnet mask.

Type             : Cluster
SerialNumber     : 1-80-000013
Uuid             : be838e1e-9f67-11e0-8878-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          :
Location         : sealab-A7
Address          : 10.58.94.217
Name             : Cyclop

Type             : Cluster
SerialNumber     : 1-80-000013
Uuid             : be838e1e-9f67-11e0-8878-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          :
Location         : sealab-A7
Address          : 10.58.94.218
Name             : Cyclop

Type             : Cluster
SerialNumber     : 1-80-000011
Uuid             : fca8c5f0-7cb6-11e0-a998-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          : Chris Lionetti
Location         : SeaLab-A7
Address          : 10.58.94.234
Name             : Cerebus

Type             : Cluster
SerialNumber     : 1-80-000011
Uuid             : fca8c5f0-7cb6-11e0-a998-123478563412
Description      : NetApp Release RollingRock__8.1.0 Cluster-Mode: Wed May 11 02:15:40 PDT 2011
ObjectIdentifier : 1.3.6.1.4.1.789.2.5
Contact          : Chris Lionetti
Location         : SeaLab-A7
Address          : 10.58.94.244
Name             : Cerebus

```
> Example 4

Find-NcController -Address 10.60.189.0/24 -Timeout 250 | select Name, Address
Find all controllers on a subnet.

Name       Address
----       -------
vxe3170a-c 10.60.189.37
vxe3170a-c 10.60.189.39
beatles    10.60.189.85
beatles    10.60.189.86
beatles    10.60.189.87
beatles    10.60.189.88
dot-vsac12 10.60.189.131
dot-vsac12 10.60.189.133
vvol-vsim  10.60.189.155
vvol-vsim  10.60.189.156
VxeRubble  10.60.189.171
VxeRubble  10.60.189.172

---

### Parameters
#### **Community**
If specified, this is the community string to use during SNMP discovery.  The default value is 'public'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Address**
Specify to discover a single address, or to specify any address within a subnet when using the -Mask parameter, or to specify a subnet in CIDR format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Timeout**
Timeout value for discovery, specified in milliseconds.  Default is 5000.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **NoPing**
For efficiency, the discovery engine first attempts to ping a controller before sending any SNMP commands.  But if ICMP traffic is blocked within a network, specify this option to forego pinging and proceed to the SNMP query stage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **All**
Specify to return all SNMP devices, not just clustered Data ONTAP controllers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Mask**
Specify in dotted quad notation when specifying a subnet to query.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **StartAddress**
The starting address within an address range to query.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |Start  |

#### **EndAddress**
The ending address within an address range to query.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |End    |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Discovery.SnmpDevice

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Find-NcController [-Community <String>] [-Address] <String> [-Timeout <Int32>] [-NoPing] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [<CommonParameters>]
```
```PowerShell
Find-NcController [-Community <String>] [-Address] <String> [-Mask] <String> [-Timeout <Int32>] [-NoPing] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Find-NcController [-Community <String>] -StartAddress <String> -EndAddress <String> [-Timeout <Int32>] [-NoPing] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [<CommonParameters>]
```
