Set-VBRKMSServer
----------------

### Synopsis
Modifies settings of KMS servers.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet modifies settings of Key Management System servers (KMS server) added to the Veeam Backup & Replication console.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRKMSServer](Get-VBRKMSServer)

---

### Examples
> Modifying KMS Server Settings

$server = Get-VBRKMSServer -Id "8f723f68-82c6-430d-8915-58a0582440a4"
Set-VBRKMSServer -Server $server -Port 5696
This example shows how to modify the port number for the KMS server added to the Veeam Backup & Replication console.
Perform the following steps:
1. Run the Get-VBRKMSServer cmdlet. Specify the Id parameter values. Save the result to the $server variable.
2. Run the Set-VBRKMSServer cmdlet. Set the $server variable as the Server parameter value. Provide the Port parameter value.

---

### Parameters
#### **CACertificate**
Specifies the KMS server certificate.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[X509Certificate2]`|false   |named   |False        |

#### **ClientCertificate**
Specifies the client certificate issued by the KMS administrator for Veeam Backup & Replication.
Note: The client certificate must contain a private key and be exportable.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[X509Certificate2]`|false   |named   |False        |

#### **Description**
Specifies description of the KMS server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies a port number to connect to the KMS server.
Deafult: 5696.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies a KMS server which settings you want to modify.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRKMSServer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRKMSServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRKMSServer [-CACertificate <X509Certificate2>] [-ClientCertificate <X509Certificate2>] [-Description <String>] [-Port <Int32>] -Server <VBRKMSServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
