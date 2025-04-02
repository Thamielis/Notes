Invoke-NcSsh
------------

### Synopsis
Send a Data ONTAP CLI command via SSH.

---

### Description

Send a Data ONTAP CLI command via SSH.

This cmdlet is useful for querying or manipulating Data ONTAP if a more specific PowerShell cmdlet is not available.  It may also be used to to interact in ONTAP in lieu of opening a terminal connection to the controller.

---

### Related Links
* [Connect-NcController](Connect-NcController)

---

### Examples
> Example 1

Invoke-NcSsh system health status show
Invoke the cluster CLI command 'system health status show'.

NcController : 10.61.172.155
Value        : Status
               ---------------
               OK

> Example 2

```PowerShell
Invoke-NcSsh -Name beam@10.61.167.211 -PrivateKeyFile C:\ssh\privatekey -Command "version"
Invoke the CLI command "version" via SSH.  Use the specified private key file for authentication.

NcController : 10.61.167.211
Value        : NetApp Release 8.1.2 Cluster-Mode: Tue Oct 30 23:53:39 PDT 2012

```
> Example 3

```PowerShell
$passphrase = Read-Host -AsSecureString "Passphrase"
Invoke-NcSsh -Name beam@10.61.167.211 -PrivateKeyFile C:\ssh\win2k8devrre0_privatekey -Command "version" -Passphrase $passphrase
Invoke the CLI command "version" via SSH.  Use the specified private key file for authentication.  Use a prompt to gather the passphrase.

NcController : 10.61.167.211
Value        : NetApp Release 8.1.2 Cluster-Mode: Tue Oct 30 23:53:39 PDT 2012

```
> Example 4

```PowerShell
$DataONTAP_SSHPrivateKeyFile = "C:\ssh\privatekey"
Invoke-NcSsh -Name beam@10.61.167.211 -Command "version" -Passphrase $passphrase
Invoke the CLI command "version" via SSH.  Use the private key file specified in the $DataONTAP_SSHPrivateKeyFile variable.  Use the passphrase from Example 3.

NcController : 10.61.167.211
Value        : NetApp Release 8.1.2 Cluster-Mode: Tue Oct 30 23:53:39 PDT 2012

```
> Example 5

```PowerShell
Invoke-NcSsh -Name beam@10.61.167.211 -Command "version" -Passphrase (ConvertTo-SecureString "passphrase" -AsPlainText -Force)
Invoke the CLI command "version" via SSH.  Use the private key file specified in the $DataONTAP_SSHPrivateKeyFile variable and a plaintext passphrase.

NcController : 10.61.167.211
Value        : NetApp Release 8.1.2 Cluster-Mode: Tue Oct 30 23:53:39 PDT 2012

```

---

### Parameters
#### **Command**
The command string to send to Data ONTAP.  If the command string contains hyphens, enclose the command in quotes lest PowerShell attempt to interpret those as cmdlet arguments.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Credential**
Use this argument to explicitly provide SSH credentials for authenticating in ONTAP.  If credentials are provided, they take precedence over any other credentials that may be available.  If not provided, the cmdlet will look for valid credentials from either the specified NcController object or $global:CurrentNcController as appropriate.  Failing that, credentials will be sought in the Toolkit's credential cache.

|Type            |Required|Position|PipelineInput|Aliases       |
|----------------|--------|--------|-------------|--------------|
|`[PSCredential]`|false   |named   |false        |Cred<br/>Creds|

#### **Port**
The port on which to connect to the storage controller.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Timeout**
Connection timeout in milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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

#### **Name**
The name or address of the controller to connect to.  If a hostname is specified, it must be resolvable to an IP address.  Specify either this argument or the -Controller argument, but not both.
Optionally, specify the user in the <user>@<hostname> format.  If this format is specified, the cmdlet will attempt to authenticate the user using private key authentication.

|Type      |Required|Position|PipelineInput                 |Aliases                                         |
|----------|--------|--------|------------------------------|------------------------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|ControllerName<br/>Address<br/>ControllerAddress|

#### **Username**
Specify the username to log in as using the private key file.  If the Name parameter is specified in the <user>@<hostname> format, this parameter is ignored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Passphrase**
Passphrase required for the private key file.  If not specified, the private key does not require a passphrase.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **PrivateKeyFile**
Full path to the private key file to use to authenticate the connection.  If not specified, the $DataONTAP_SSHPrivateKeyFile variable is consulted.  The $DataONTAP_SSHPrivateKeyFile variable may contain one or more paths to private key files, or directories containing private key files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Controller**
The controller(s) to connect to, embodied in an NcController object as returned by Connect-NcController.  Specify
either this argument or the -Name argument, but not both.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[NcController[]]`|true    |named   |true (ByValue, ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.MultilineStr

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Invoke-NcSsh -Command <String[]> [-Credential <PSCredential>] [-Port <Int32>] [-Timeout <Int32>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSsh -Name <String> -Command <String[]> [-Credential <PSCredential>] [-Port <Int32>] [-Timeout <Int32>] [-Username <String>] [-Passphrase <SecureString>] [-PrivateKeyFile <String>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSsh -Controller <NcController[]> -Command <String[]> [-Credential <PSCredential>] [-Port <Int32>] [-Timeout <Int32>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [<CommonParameters>]
```
