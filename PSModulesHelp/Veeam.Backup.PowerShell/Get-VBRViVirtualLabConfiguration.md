Get-VBRViVirtualLabConfiguration
--------------------------------

### Synopsis
Returns virtual labs and their settings.

---

### Description

This cmdlet returns the VBRViVirtualLabConfiguration object that contains an array of virtual labs and all their settings. You can use this object to modify settings of virtual labs.
Run the Set-VBRViVirtualLab cmdlet to modify settings of virtual labs.

---

### Examples
> Example 1. Getting all Virtual Labs

Get-VBRViVirtualLabConfiguration
DesignatedResourcePoolName : Exchange Virtual Lab
DesignatedVMFolderName     : Exchange Virtual Lab
CacheDatastore             : esx09-das05
ProxyAppliance             : Exchange Virtual Lab
ProxyApplianceEnabled      : True
NetworkMapping             : {Exchange Virtual Lab VM Network}
NetworkOptions             : {Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkOptions
RoutingBetweenvNicsEnabled : False
IsMultiHost                : False
DVS                        :
IpMappingRule              : {}
StaticIPMappingEnabled     : False
Type                       : Advanced
IdOnHost                   : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server                     : Veeam.Backup.Core.Common.CHost
Platform                   : VMWare
Id                         : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name                       : Exchange Virtual Lab
Description                : Created by Powershell at 2/20/2020 5:56 AM.

DesignatedResourcePoolName : SQL Virtual Lab
DesignatedVMFolderName     : SQL Virtual Lab
CacheDatastore             : esx09-das05
ProxyAppliance             : SQL Virtual Lab
ProxyApplianceEnabled      : True
NetworkMapping             : {SQL Virtual Lab VM Network}
NetworkOptions             : {Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkOptions
RoutingBetweenvNicsEnabled : False
IsMultiHost                : False
DVS                        :
IpMappingRule              : {}
StaticIPMappingEnabled     : False
Type                       : Advanced
IdOnHost                   : 43d2457a-ddee-424d-9fd3-42e021a77309
Server                     : Veeam.Backup.Core.Common.CHost
Platform                   : VMWare
Id                         : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name                       : SQL Virtual Lab
Description                : Created by Powershell at 2/20/2020 5:56 AM.
This command returns all virtual labs that are added to the Veeam Backup & Replication infrastructure.
The cmdlet output will contain settings of the virtual labs.
> Example 2. Getting Virtual Lab by ID

Get-VBRViVirtualLabConfiguration -Id "6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec"
DesignatedResourcePoolName : Exchange Virtual Lab
DesignatedVMFolderName     : Exchange Virtual Lab
CacheDatastore             : esx09-das05
ProxyAppliance             : Exchange Virtual Lab
ProxyApplianceEnabled      : True
NetworkMapping             : {Exchange Virtual Lab VM Network}
NetworkOptions             : {Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkOptions
RoutingBetweenvNicsEnabled : False
IsMultiHost                : False
DVS                        :
IpMappingRule              : {}
StaticIPMappingEnabled     : False
Type                       : Advanced
IdOnHost                   : 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec
Server                     : Veeam.Backup.Core.Common.CHost
Platform                   : VMWare
Id                         : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name                       : Exchange Virtual Lab
Description                : Created by Powershell at 2/20/2020 5:56 AM.
This command returns the 6b2686ae-9e1b-4c6e-b6fb-842d7155a9ec virtual lab.
The cmdlet output will contain settings of the virtual lab.
> Example 3. Getting Virtual Lab by Name

Get-VBRViVirtualLabConfiguration -Name "SQL Virtual Lab"
DesignatedResourcePoolName : SQL Virtual Lab
DesignatedVMFolderName     : SQL Virtual Lab
CacheDatastore             : esx09-das05
ProxyAppliance             : SQL Virtual Lab
ProxyApplianceEnabled      : True
NetworkMapping             : {SQL Virtual Lab VM Network}
NetworkOptions             : {Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkOptions
RoutingBetweenvNicsEnabled : False
IsMultiHost                : False
DVS                        :
IpMappingRule              : {}
StaticIPMappingEnabled     : False
Type                       : Advanced
IdOnHost                   : 43d2457a-ddee-424d-9fd3-42e021a77309
Server                     : Veeam.Backup.Core.Common.CHost
Platform                   : VMWare
Id                         : 8762b1ea-3422-4f84-8472-e596d7c8265e
Name                       : SQL Virtual Lab
Description                : Created by Powershell at 2/20/2020 5:56 AM.
This command returns the SQL Virtual Lab virtual lab.
The cmdlet output will contain settings of the virtual lab.

---

### Parameters
#### **Id**
Specifies an array of IDs for a virtual lab.
The cmdlet will return an array of virtual labs with the specifies ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names for a virtual lab.
The cmdlet will return an array of virtual labs with the specifies names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRViVirtualLabConfiguration [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRViVirtualLabConfiguration [-Name <String[]>] [<CommonParameters>]
```
