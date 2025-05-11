Get-NetIPConfiguration
----------------------

### Synopsis
Gets IP network configuration.

---

### Description

The Get-NetIPConfiguration cmdlet gets network configuration, including usable interfaces, IP addresses, and DNS servers.

If you do not specify any parameters, this cmdlet gets IP configuration properties for all non-virtual connected interfaces on a computer.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288381)

* [Get-DNSClientServerAddress](Get-DNSClientServerAddress)

* [Get-NetAdapter](Get-NetAdapter)

* [Get-NetIPAddress](Get-NetIPAddress)

* [Get-NetIPInterface](Get-NetIPInterface)

* [Get-NetRoute](Get-NetRoute)

---

### Examples
> Example 1: Get the IP configuration

```PowerShell
PS C:\>Get-NetIPConfiguration
This command gets IP configuration information. When this cmdlet is run without parameters, it gets the IP configuration information for all of the non-virtual connected interfaces on the computer.
```
> Example 2: Get all IP configuration details

```PowerShell
PS C:\>Get-NetIPConfiguration -All
This command gets the IP configuration information for all of the interfaces on the computer, including virtual interfaces, loopback interfaces, and disconnected interfaces.
```
> Example 3: Get the IP configuration information with a common parameter

```PowerShell
PS C:\>Get-NetIPConfiguration -Verbose
This command gets IP configuration information. By using the Verbose parameter, the networking cmdlets are shown to gather and format the information displayed in this cmdlet.
```
> Example 4: Get the IP configuration by interface index

```PowerShell
PS C:\>Get-NetIPConfiguration –InterfaceIndex 12
This command gets the IP configuration information for the interface at the index 12.
```
> Example 5: Get the IP configuration from pipeline input

```PowerShell
PS C:\>Get-NetIPConfiguration | Get-NetIPAddress
This command gets the IP address information, including the prefix length.
```

---

### Parameters
#### **All**
Indicates that the cmdlet retrieves the IP configuration properties for all of the interfaces on a computer, including virtual interfaces, loopback interfaces, and disconnected interfaces.

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[Switch]`|true    |named   |false        |IncludeAllInterfaces|

#### **AllCompartments**
Indicates that the cmdlet gets the IP configuration properties for all of the compartments on a computer.

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[Switch]`|false   |named   |false        |IncludeAllCompartments|

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type          |Required|Position|PipelineInput        |Aliases                        |
|--------------|--------|--------|---------------------|-------------------------------|
|`[CimSession]`|false   |named   |True (ByPropertyName)|PSComputerName<br/>ComputerName|

#### **CompartmentId**
Specifies an identifier for network compartment in the protocol stack. By default, the cmdlet gets Net IP configuration in the default compartment. If you specify a value for this parameter, the cmdlet gets any matching Net IP configuration in the compartment specified in this field.

|Type     |Required|Position|PipelineInput       |
|---------|--------|--------|--------------------|
|`[Int32]`|false   |named   |true(ByPropertyName)|

#### **Detailed**
Indicates that the cmdlet retrieves additional interface and computer configuration information, including the computer name, link layer address, network profile, MTU length, and DHCP status.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InterfaceAlias**
Specifies an alias of a network interface. The cmdlet gets an IP configuration that matches the alias.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |True (ByPropertyName)|ifAlias|

#### **InterfaceIndex**
Specifies an index of a network interface. The cmdlet gets an IP configuration that matches the index.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int32]`|true    |named   |True (ByPropertyName)|ifIndex|

---

### Inputs
None

---

### Outputs
* None

---

### Syntax
```PowerShell
Get-NetIPConfiguration [[-InterfaceAlias] <String>] [-AllCompartments] [-CimSession <CimSession>] [-CompartmentId <Int32>] [-Detailed] [<CommonParameters>]
```
```PowerShell
Get-NetIPConfiguration [-AllCompartments] [-CimSession <CimSession>] [-CompartmentId <Int32>] [-Detailed] -All [<CommonParameters>]
```
```PowerShell
Get-NetIPConfiguration [-AllCompartments] [-CimSession <CimSession>] [-CompartmentId <Int32>] [-Detailed] -InterfaceIndex <Int32> [<CommonParameters>]
```
