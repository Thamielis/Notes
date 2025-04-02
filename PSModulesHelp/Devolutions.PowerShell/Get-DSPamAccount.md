Get-DSPamAccount
----------------

### Synopsis
Fetch pam accounts.

---

### Description

Fetch pam accounts. There is three way to do so. First, get a specific account by using the AccountID parameter. Second, get all pam accounts by calling the cmdlet without parameters. Third, get all pam accounts of a specific folder by using the FolderID parameter.
In case there is a lot of PAM accounts, it is possible an TryGoOfflineException occurs. If that is the case, there is two way to avoid that error. First, when calling New-DSSession, use the Timeout parameter to increase the polling delay. Another way is to use AsBasicInformation switch of this cmdlet. This will return a simplified object with the information to quickly identify the PAM accounts of interest.

---

### Related Links
* [Get-DSPamAccountSyncStatus](Get-DSPamAccountSyncStatus)

* [New-DSPamAccount](New-DSPamAccount)

* [Remove-DSPamAccount](Remove-DSPamAccount)

* [Update-DSPamAccount](Update-DSPamAccount)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $searchRes = Search-DSEntry -By Username -Match ExactExpression -Value 'MyUsername' -IncludePamVaults -IncludeVault @();
        $search = $searchRes[0];
        $pamAccountRes = Get-DSPamAccount -AccountID $search.ID
Get the PAM account whose username is 'MyUsername'. It is assumed in this example that the username is unique, so the search result contains a single result.
```
> EXAMPLE 2

```PowerShell
PS C:\> $pamBasicRes = Get-DSPamAccount -AsBasicInformation;
        $nameStarts = $pamBasicRes | Where Label -like 'MyName*';
        foreach ($pamBasic in $nameStarts) { Remove-DSPamAccount -AccountID $pamBasic.ID }
Delete all PAM Accounts whose name starts with 'MyName'.
```

---

### Parameters
#### **AccountID**
Pam account's ID

|Type    |Required|Position|PipelineInput|Aliases        |
|--------|--------|--------|-------------|---------------|
|`[Guid]`|true    |named   |false        |PamCredentialID|

#### **AsBasicInformation**
The returned object will be simplified. It allows simple identification of the PAM Account (ID, Label, Username, Domain), its PAM folder (FolderID, FolderName), and its PAM vault (TeamFolderID). It is quicker than obtaining the complete PAM Accounts objects.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FolderID**
Get all accounts in the specified folder

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamCredential[]

* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSPamAccount -detailed". For technical information, type "Get-Help Get-DSPamAccount -full".

---

### Syntax
```PowerShell
Get-DSPamAccount -AccountID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSPamAccount [-FolderID <Guid>] [-AsBasicInformation] [-AsLegacyResponse] [<CommonParameters>]
```
