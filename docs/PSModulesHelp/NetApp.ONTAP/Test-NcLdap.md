Test-NcLdap
-----------

### Synopsis
Display the status of an LDAP configuration

---

### Description

Display the status of an LDAP configuration

---

### Examples
> Example 1

Test-NcLdap
Display the status of an LDAP configuration

ClientConfig        : client_config1
Ldap_Status         : False
LdapStatusDetails   : Error: Validate the Ldap configuration procedure failed
                        [  1 ms] Entry for host-address: 10.140.111.49 not found in the
                                 current source: FILES. Ignoring and trying next available
                                 source
                        [     1] Source: DNS unavailable. Entry for
                                 host-address:10.140.111.49 not found in any of the
                                 available sources
                        [     1] Resolved LDAP servers: 10.140.111.49. Vserver: 3
                        [     2] Failed to initiate Kerberos authentication. Trying NTLM.
                        [     2] TCP connection to ip 10.140.111.49, port 389 via
                                 interface 0.0.0.0 failed: Network is unreachable.
                        [     3] Unable to connect to LDAP (NIS & Name Mapping) service on
                                 (Error: Can't contact LDAP server)
                        [     3] No servers available for LDAP_NIS_AND_NAME_MAPPING,
                                 vserver: 3, domain: .
                      **[     3] FAILURE: Unable to make a connection (LDAP (NIS & Name
                      **         Mapping):), result: 6940

NcController        : 10.140.111.42
Vserver             : vs1
LdapStatusSpecified : True

---

### Parameters
#### **Vserver**
Specifies the Vserver for the LDAP configuration.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information isavailable will be returned.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapStatus]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty ldap-client-check object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ldap-client-check object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Test-NcLdap -Template" to get the initially empty ldap-client-check object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LdapStatus]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ldap.LdapStatus

---

### Notes
Category: ldap
API: ldap-check-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Test-NcLdap [[-Vserver] <String[]>] [-Attributes <LdapStatus>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcLdap -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcLdap -Query <LdapStatus> [-Attributes <LdapStatus>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
