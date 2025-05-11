Connect-NcController
--------------------

### Synopsis
Connect to a clustered Data ONTAP controller.

---

### Description

Establish a connection to a clustered Data ONTAP storage controller.

Unless 'Transient' is true, this connection is saved in the global variable CurrentNcController.  All other clustered ONTAP cmdlets in the Data ONTAP PowerShell Toolkit utilize this global variable if their 'Controller' parameter is not explicitly provided.  The clustered Data ONTAP Toolkit is capable of storing multiple connections in CurrentNcController; use the -Add parameter to use that feature.

Connections are established using HTTPS by default. Supply the Credential parameter (see examples) or save credentials in the Toolkit credentials cache.

Use the Vserver parameter to initiate a connection to a vserver context.

---

### Related Links
* [Find-NcController](Find-NcController)

---

### Examples
> Example 1

Connect-NcController 10.61.172.155
Connect to a clustered ONTAP controller using HTTPS.  In this example, the credentials are assumed to come from the Toolkit's credentials cache.

In this example, the address is that of a cluster admin Vserver.

Ontapi             : 1.15
Vserver            :
Mode               : Cluster
OntapiMajorVersion : 1
OntapiMinorVersion : 15
Version            : NetApp Release RollingRock__8.1.0 Cluster-Mode: Mon May 09 06:25:48 PDT 2011
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 10000
Name               : 10.61.172.155
Address            : 10.61.172.155
Port               : 443
Credentials        : System.Net.NetworkCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

> Example 2

```PowerShell
Connect-NcController 10.61.172.155 -Credential admin -Vserver vserver1
Connect to controller '10.61.172.155' using HTTPS/HTTP.  PowerShell will prompt for admin credentials.

In this example, the address is that of a cluster admin vserver but a data vserver is also specified.  This causes the connection to be made to the cluster admin vserver, but all subsequent cmdlets that are only supported by a data vserver are directed to vserver 'vserver1'.

Ontapi             : 1.15
Vserver            : vserver1
Mode               : Cluster
MaxIterRecords     : 100
OntapiMajorVersion : 1
OntapiMinorVersion : 15
Version            : NetApp Release RollingRock__8.1.0 Cluster-Mode: Tue Aug 23 05:34:04 PDT 2011
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 60000
Name               : 10.61.172.155
Address            : 10.61.172.155
Port               : 443
Credentials        : NetApp.Ontapi.OntapiCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 3

```PowerShell
Connect-NcController 10.60.189.142
Connect to a management LIF on a data vserver.  While directly connected to a data vserver, cmdlets may not be directed to the cluster admin vserver or any other data vserver.

Ontapi             : 1.15
Vserver            : costea01
Mode               : Cluster
MaxIterRecords     : 100
OntapiMajorVersion : 1
OntapiMinorVersion : 15
Version            : NetApp Release 8.1RC2 Cluster-Mode: Thu Oct 27 19:21:18 PDT 2011
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 60000
Name               : 10.60.189.142
Address            : 10.60.189.142
Port               : 443
Credentials        : NetApp.Ontapi.OntapiCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 4

```PowerShell
$password = ConvertTo-SecureString "p@ssword" -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "admin",$password
Connect-NcController 10.61.172.155 -Credential $cred
Connect to controller '10.61.172.155' using HTTP/HTTPS but suppress the credential prompt by creating a PSCredential object programmatically.

Ontapi             : 1.15
Vserver            :
Mode               : Cluster
OntapiMajorVersion : 1
OntapiMinorVersion : 15
Version            : NetApp Release RollingRock__8.1.0 Cluster-Mode: Mon May 09 06:25:48 PDT 2011
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 10000
Name               : 10.61.172.155
Address            : 10.61.172.155
Port               : 443
Credentials        : System.Net.NetworkCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 5

Connect-NcController 10.61.172.155 -Vserver vserver1
Connect-NcController 10.61.172.155 -Vserver vserver2 -Add
Get-NcVol | select NcController, Vserver, Name | ft -AutoSize
Connect to two vserver contexts and get the volume list from both.

NcController  Vserver  Name
------------  -------  ----
10.61.172.155 vserver1 georgeVol1
10.61.172.155 vserver1 vol1
10.61.172.155 vserver1 vserver1vol0
10.61.172.155 vserver2 vserver2vol0

---

### Parameters
#### **Name**
The name of the storage controller.  This value may also be a string representation of an IP address.  If not an address, the name must be resolvable to an address.

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|Filer  |

#### **Port**
The port on which to connect to the storage controller.  If not set, it defaults to 80 for HTTP and 443 for HTTPS.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **AccessToken**
Specify the OAuth token.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **Credential**
A System.Management.Automation.PSCredential object containing the credentials needed to log into the storage controller.

|Type            |Required|Position|PipelineInput        |Aliases       |
|----------------|--------|--------|---------------------|--------------|
|`[PSCredential]`|false   |named   |true (ByPropertyName)|Cred<br/>Creds|

#### **Transient**
Specify to prevent setting the global variable CurrentNcController.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Vserver**
If connecting to a cluster LIF, use this parameter to tunnel commands to a vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Timeout**
Connection timeout in milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Add**
Specify to add this connection to the global variable CurrentNcController instead of replacing the value in the variable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ApplicationName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |AppName|

#### **SSLVersion**

Valid Values:

* TLSv1.2
* TLSv1.1
* TLSv1
* SSLv3

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

---

### Inputs

---

### Outputs
* NetApp.Ontapi.Filer.C.NcController

---

### Notes
Category: toolkit
Family: cluster, vserver

---

### Syntax
```PowerShell
Connect-NcController [-Name] <String[]> [-Port <UInt16>] [-Credential <PSCredential>] [-Transient] [-Vserver <String>] [-Timeout <Int32>] [-Add] [-ApplicationName <String>] [-SSLVersion 
```
```PowerShell
<String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
