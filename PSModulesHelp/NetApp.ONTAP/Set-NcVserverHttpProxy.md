Set-NcVserverHttpProxy
----------------------

### Synopsis

Set-NcVserverHttpProxy [-ProxyServer <string>] [-ProxyPort <int>] [-Vserver <string>] [-Ipspace <string>] [-IsAuthEnabled <bool>] [-Username <string>] [-Password <string>] [-SkipConfigValidation] [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-WhatIf] [-Confirm] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Ipspace**
Specifies the Ipspace for which the HTTP proxy should be configured. this parameter is mutually exclusive with vserver parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **IsAuthEnabled**
Specifies whether authentication is required for the HTTP proxy. By default it is set to false.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[bool]`|false   |Benannt |true (ByPropertyName)|

#### **Password**
Specifies the password for the username to authenticate with the HTTP proxy when authentication is enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **ProxyPort**
Specifies the port number on which the HTTP proxy service is configured for the server.

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[int]`|false   |Benannt |true (ByPropertyName)|

#### **ProxyServer**
Specifies the HTTP proxy hostname or IP address

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |Benannt |true (ByPropertyName)|

#### **SkipConfigValidation**
Skip the config validation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Benannt |false        |

#### **Username**
Specifies the username to authenticate with the HTTP proxy when authentication is enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **Vserver**
Specifies the vserver for which the HTTP proxy should be configured. This parameter is mutually exclusive with ipsapce parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **ZapiCall**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Benannt |false        |ONTAPI |

#### **ZapiRetryCount**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Benannt |false        |

---

### Inputs
System.String
System.Int32
System.Boolean
NetApp.Ontapi.Filer.C.NcController[]

---

### Outputs
* DataONTAP.C.Types.Vserver.HttpProxy
DataONTAP.C.Types.Vserver.VserverInfo

---

### Syntax
```PowerShell
syntaxItem                                                                                                        
```
```PowerShell
----------                                                                                                        
```
```PowerShell
{@{name=Set-NcVserverHttpProxy; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
