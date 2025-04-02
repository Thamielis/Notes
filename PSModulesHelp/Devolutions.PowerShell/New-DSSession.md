New-DSSession
-------------

### Synopsis
Establishes a connection with your Devolutions Server instance.

---

### Description

Establishes a connection with your Devolutions Server by retrieving server informations and setting global variables that are required for accessing the API.

---

### Related Links
* [Close-DSSession](Close-DSSession)

* [Get-DSIsLogged](Get-DSIsLogged)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $SecurePassword = ConvertTo-SecureString 'YourPassword' -AsPlainText -Force;
        $SessionData = @{
            BaseURI = "Your/DVLS/Instance/URL"
            Credentials = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
        };

        New-DSSession @SessionData
Authenticate with the splatting of the hash table containing the required parameters.
```
> EXAMPLE 2

```PowerShell
PS C:\> $SecurePassword = ConvertTo-SecureString $YourPassword -AsPlainText -Force
        $Credentials = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
	    $BaseURI = "Your/DVLS/Instance/URL"

        New-DSSession -Credentials $Credentials -BaseURI $URI
Authenticate by using the parameters.
```
> EXAMPLE 3

```PowerShell
PS C:\> $SecurePassword = ConvertTo-SecureString $YourPassword -AsPlainText -Force
	    $Credentials = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
	    $BaseURI = "Your/DVLS/Instance/URL"

        New-DSSession -Credentials $Credentials -BaseURI $URI
Authenticate using an application user.
```
> EXAMPLE 4

```PowerShell
PS C:\> New-DSSession -BaseURI "Your/DVLS/Instance/URL" -WindowsAuthentication
A Windows user authenticates himself with his logged account.
```
> EXAMPLE 5

```PowerShell
PS C:\> New-DSSession -BaseURI "Your/DVLS/Instance/URL" -UseOAuth
Authenticate using OAuth in a web browser.
```

---

### Parameters
#### **AsApplication**
Required when using an application user to authenticate

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BaseUri**
URL to your Devolutions Server instance

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Credential**
PSCredential with your Devolutions Server username and password

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |1       |false        |

#### **DomainId**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Timeout**
Polling delay in seconds. Default value is 15 seconds. The value must be between 3 and 600 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UseOAuth**
Use OAuth in a web browser.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WindowsAuthentication**
Use Windows Authentication. Must be on Windows.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSSession -detailed". For technical information, type "Get-Help New-DSSession -full".

---

### Syntax
```PowerShell
New-DSSession [[-Credential] <PSCredential>] [-BaseUri] <String> [-DomainId <String>] [-Timeout <Int32>] [-AsApplication] [-UseOAuth] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
New-DSSession -WindowsAuthentication [-BaseUri] <String> [-DomainId <String>] [-Timeout <Int32>] [-AsApplication] [-UseOAuth] [-AsLegacyResponse] [<CommonParameters>]
```
