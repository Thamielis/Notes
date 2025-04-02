Get-VBRComputerFileProxyServer
------------------------------

### Synopsis
Returns file proxy servers added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet returns an array of file proxy servers added to your Veeam Backup & Replication infrastructure.

---

### Examples
> Example 1. Getting All File Proxy Servers

Get-VBRComputerFileProxyServer
Id                            Description                   Server                                 ConcurrentTaskNumber
--                            -----------                   ------                                 --------------------
2df7b4a9-e230-4bc7-97a6-db... Created by Veeam Backup & ... Veeam.Backup.Core.Common.C...                             2
5a7c25b9-87cb-41e3-bb1b-81... Created by Powershell at 8... Veeam.Backup.Core.Common.C...                             7
This command gets all file proxy servers that are added to the Veeam Backup & Replication infrastructure.
The cmdlet output will contain the following details on file proxy servers: ID, Description, Server and ConcurrentTaskNumber.
> Example 2. Getting File Proxy Server by Name

Get-VBRComputerFileProxyServer -Name "File Proxy 01"
Id                            Description                   Server                                 ConcurrentTaskNumber
--                            -----------                   ------                                 --------------------
dbb139cf-4ac1-4a9e-95fa-e9... Created by Powershell at 8... Veeam.Backup.Core.Common.C...                             2
This command gets all file proxy servers that are added to the Veeam Backup & Replication infrastructure by the file proxy server name.
The cmdlet output will contain the following details on file proxy servers: ID, Description, Server and ConcurrentTaskNumber.
> Example 3. Getting File Proxy Server by ID

Get-VBRComputerFileProxyServer -Id "02da6898-308d-44ac-b007-94d81576c296"
Id                            Description                   Server                                 ConcurrentTaskNumber
--                            -----------                   ------                                 --------------------
02da6898-308d-44ac-b007-94... Created by Powershell at 8... Veeam.Backup.Core.Common.C...                             2
This command gets all file proxy servers that are added to the Veeam Backup & Replication infrastructure by the file proxy server ID.
The cmdlet output will contain the following details on file proxy servers: ID, Description, Server and ConcurrentTaskNumber.

---

### Parameters
#### **Id**
Specifies an array of IDs of file proxy server. The cmdlet will return an array of these servers with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names of a file proxy server. The cmdlet will return an array of these servers with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

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
Get-VBRComputerFileProxyServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRComputerFileProxyServer -Name <String[]> [<CommonParameters>]
```
