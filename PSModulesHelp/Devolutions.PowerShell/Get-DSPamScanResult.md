Get-DSPamScanResult
-------------------

### Synopsis
Retrieve the outcome of the most recent scan job associated with a specific scan configuration

---

### Description

Retrieve the outcome of the most recent scan job associated with a specific scan configuration.

---

### Related Links
* [Get-DSPamScanConfiguration](Get-DSPamScanConfiguration)

* [Import-DSPamScanResult](Import-DSPamScanResult)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-DSPamScanConfiguration -LiteralName 'ScanA' | Get-DSPamScanResult
Get the scan result for the configuration named 'ScanA'
```
> EXAMPLE 2

PS C:\> $providerID = 'the-desired-pam-provider-ID'
        $folderID = 'the-desired-pam-vault-or-folder-ID'
        $configuration = Get-DSPamScanConfiguration -LiteralName 'ScanA';
        $toImport = Get-DSPamScanResult -InputObject $configuration -Filter '@domain.net' -ExcludedManaged;
        $providerResult = Get-DSPamProvider
        $provider = $providerResult.Data | Where -Property ID -eq $providerID
        $importResult = Import-DSPamScanResult -ScanResult $toImport -Provider $provider -FolderID $folderID
From the 'ScanA' PAM scan's result, import all users who have '@domain.net' in their username, hostname, fullname, or description in the PAM folder specified by $folderID.

---

### Parameters
#### **ExcludeManaged**
Exclude the managed users

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filter**
The global filter, identical to the web UI filter, is designed to be applied to the username, hostname, fullname, and description fields.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **InputObject**
PAM scan configuration object obtained from Get-DSPamScanConfiguration

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[ScanConfigurationDto]`|true    |1       |true (ByValue)|

---

### Inputs
Devolutions.Server.NetworkDiscovery.Dto.ScanConfigurationDto

PAM scan configuration object obtained from Get-DSPamScanConfiguration

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSScanResult.PSScanResult[]

---

### Notes
For more information, type "Get-Help Get-DSPamScanResult -detailed". For technical information, type "Get-Help Get-DSPamScanResult -full".

---

### Syntax
```PowerShell
Get-DSPamScanResult [-InputObject] <ScanConfigurationDto> [[-Filter] <String>] [-ExcludeManaged] [<CommonParameters>]
```
