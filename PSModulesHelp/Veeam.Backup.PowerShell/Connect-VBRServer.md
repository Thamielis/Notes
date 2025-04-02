Connect-VBRServer
-----------------

### Synopsis
Connects to a Veeam backup server.

---

### Description

This cmdlet creates connection with a local or remote Veeam backup server.
The connection starts a Veeam PowerShell session during which you can perform all operations available with Veeam PowerShell.
Within one session, you can connect to one Veeam server.
To connect to another Veeam server, you need to close the current session.
Run Disconnect-VBRServer to stop session with the current Veeam server.
Run Get-VBRServerSession to get information about the current session.

---

### Examples
> Example 1

```PowerShell
Connect-VBRServer -Server 192.24.125.135
This command connects to the 192.24.125.135 Veeam backup server as a current user.
```
> Example 2

Connect-VBRServer -Server "192.24.125.135" -User "TECH\Administrator" -Password "Password
This command connects to the 192.24.125.135 server using the User/Password authentication.
> Example 3

$creds = Get-Credential
Connect-VBRServer -Credential $creds -Server 192.24.125.135
This example shows how to connect to the 192.24.125.135 Veeam backup server using the credentials prompt.
1. Run the Get-Credential cmdlet. The cmdlet will prompt for a user name and password. Enter the necessary values. Save the result to the Screds variable.
2. Run the Connect-VBRServer cmdlet. Set the $creds variable as the Credential parameter value. Specify the Server parameter value.

---

### Parameters
#### **Credential**
Specifies the credentials you want to use for authenticating with the Veeam server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Veeam server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Specifies the port for connection.
Default: 9392.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the Veeam server to which you want to connect.
Default: localhost.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Timeout**
Specifies timeout for waiting for a blocked session.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the remote server.
Note: You must specify the user name in the DOMAIN\Username format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Connect-VBRServer -Credential <PSCredential> [-Port <Int32>] [-Server <String>] [-Timeout <Int32>] [<CommonParameters>]
```
```PowerShell
Connect-VBRServer -Password <String> [-Port <Int32>] [-Server <String>] [-Timeout <Int32>] -User <String> [<CommonParameters>]
```
