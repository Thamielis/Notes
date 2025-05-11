Set-VBRLinuxTrustedHostPolicy
-----------------------------

### Synopsis
Sets the trust policy for Linux hosts.

---

### Description

This cmdlet sets the trust policy for Linux hosts.
The policy determines which protected computers running Linux OS are allowed to connect to the backup server. Veeam Backup & Replication recognizes a host as trusted if this host has connected to the Veeam backup server before. Veeam Backup & Replication remembers trusted hosts and keeps them in a database. You can add trusted hosts to the database manually by importing hosts SSH fingerprints from a file.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Setting up Connections with Trusted Linux Hosts

Set-VBRLinuxTrustedHostPolicy -Type KnownHosts -PassThru
                  
                                                                                                 Type
                                                                                                 ----
                                                                                           KnownHosts
This command instructs Veeam Backup & Replication to establish connections only with trusted Linux hosts.

---

### Parameters
#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Type**
Specifies the trust policy type. You can set the trust policy one of the following types:
* All: Use this option if you want to allow all newly discovered Linux hosts to connect to the backup server.
* KnownHosts: Use this option if you want to allow all only trusted Linux hosts to connect to the backup server.
Valid Values:

* All
* KnownHosts

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRLinuxTrustedHostPolicyType]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLinuxTrustedHostPolicyType

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRLinuxTrustedHostPolicy [-PassThru] -Type {All | KnownHosts} [<CommonParameters>]
```
