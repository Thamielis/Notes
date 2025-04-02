Get-NcCommand
-------------

### Synopsis
Get a list of clustered Data ONTAP cmdlets.

---

### Description

Get a list of clustered Data ONTAP cmdlets.

Get-NcCommand is similar in functionality to Get-NcHelp, while offering advanced filtering of available cmdlets in the DataONTAP module.  Cmdlets may be searched by Name, Api, Category, Family, Verb and/or Noun.

The ListAvailable switch will restrict the results to only cmdlets available on the given (or current) controller connection.

The ListUnavailable switch will restrict the results to only cmdlets unavailable on the given (or current) controller connection.

---

### Examples
> Example 1

Get-NcCommand -Category net -Verb Get, Set
Get all of the get and set cmdlets in the net category.

Name                                Category        Family               Api
----                                --------        ------               ---
Get-NcNetDns                        net             {cluster, vserver}   {net-dns-get-iter}
Get-NcNetDnsHost                    net             {cluster, vserver}   {net-hosts-get-iter}
Get-NcNetInterface                  net             {cluster, vserver}   {net-interface-get-iter}
Get-NcNetPort                       net             {cluster}            {net-port-get-iter}
Get-NcNetPortIfgrp                  net             {cluster}            {net-port-get-iter, net-port-ifgrp-get}
Get-NcNetPortVlan                   net             {cluster}            {net-vlan-get-iter}
Get-NcNetRoutingGroupRoute          net             {cluster}            {net-routing-group-route-get-iter}
Set-NcNetDns                        net             {vserver}            {net-dns-modify}
Set-NcNetDnsHost                    net             {vserver}            {net-hosts-modify}
Set-NcNetInterface                  net             {cluster}            {net-interface-modify}
Set-NcNetPort                       net             {cluster}            {net-port-modify}

> Example 2

Get-NcCommand -Category net -Verb Get, Set -ListAvailable
Get all of the get and set cmdlets in the net category available to the current controller connection.

Name                                Category        Family               Api
----                                --------        ------               ---
Get-NcNetDns                        net             {cluster, vserver}   {net-dns-get-iter}
Get-NcNetDnsHost                    net             {cluster, vserver}   {net-hosts-get-iter}
Get-NcNetInterface                  net             {cluster, vserver}   {net-interface-get-iter}
Get-NcNetRoutingGroupRoute          net             {cluster}            {net-routing-group-route-get-iter}
Set-NcNetDns                        net             {vserver}            {net-dns-modify}
Set-NcNetDnsHost                    net             {vserver}            {net-hosts-modify}

> Example 3

Get-NcCommand -Category net -Verb Get, Set -ListUnavailable
Get all of the get and set cmdlets in the net category unavailable to the current controller connection.

Name                                Category        Family               Api
----                                --------        ------               ---
Get-NcNetPort                       net             {cluster}            {net-port-get-iter}
Get-NcNetPortIfgrp                  net             {cluster}            {net-port-get-iter, net-port-ifgrp-get}
Get-NcNetPortVlan                   net             {cluster}            {net-vlan-get-iter}
Set-NcNetInterface                  net             {cluster}            {net-interface-modify}
Set-NcNetPort                       net             {cluster}            {net-port-modify}

---

### Parameters
#### **Name**
Name of the cmdlet.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Api**
Api of the cmdlet.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Family**
Family the cmdlet belongs to.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Category**
Category the cmdlet belongs to.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Verb**
Cmdlet verb.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Noun**
Cmdlet noun.  Wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on the first controller in the collection.

|Type            |Required|Position|PipelineInput        |Aliases                          |
|----------------|--------|--------|---------------------|---------------------------------|
|`[NcController]`|false   |named   |true (ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **ListAvailable**
If specified, only cmdlets available on the given controller are listed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ListUnavailable**
If specified, only cmdlets unavailable on the given controller are listed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Help.HelpInfo

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Get-NcCommand [[-Name] <String[]>] [-Api <String[]>] [-Family <String[]>] [-Category <String[]>] [-Verb <String[]>] [-Noun <String[]>] [-Controller <NcController>] [-VserverContext <String>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcCommand [[-Name] <String[]>] [-Api <String[]>] [-Family <String[]>] [-Category <String[]>] [-Verb <String[]>] [-Noun <String[]>] -ListAvailable [-Controller <NcController>] 
```
```PowerShell
[-VserverContext <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcCommand [[-Name] <String[]>] [-Api <String[]>] [-Family <String[]>] [-Category <String[]>] [-Verb <String[]>] [-Noun <String[]>] -ListUnavailable [-Controller <NcController>] 
```
```PowerShell
[-VserverContext <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
