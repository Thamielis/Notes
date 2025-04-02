Get-NcLdapConfig
----------------

### Synopsis
Get the list of Lightweight Directory Access Protocol (LDAP) configurations in the cluster.

---

### Description

Get the list of Lightweight Directory Access Protocol (LDAP) configurations in the cluster.

---

### Related Links
* [New-NcLdapConfig](New-NcLdapConfig)

* [Set-NcLdapConfig](Set-NcLdapConfig)

* [Remove-NcLdapConfig](Remove-NcLdapConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcLdapConfig -VserverContext lemon
Get the LDAP configuration for Vserver lemon.

NcController           : 192.168.182.144
ClientConfig           : ldap_client
ClientEnabled          : False
ClientEnabledSpecified : True

```

---

### Parameters
#### **ClientConfig**
The name of an existing Lightweight Directory Access Protocol (LDAP) client configuration.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a LdapConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLdapConfig -Template" to get the initially empty LdapConfig object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapConfig]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty LdapConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LdapConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLdapConfig -Template" to get the initially empty LdapConfig object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapConfig

---

### Notes
Category: ldap
API: ldap-config-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLdapConfig [[-ClientConfig] <String[]>] [-Attributes <LdapConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapConfig -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLdapConfig -Query <LdapConfig> [-Attributes <LdapConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
