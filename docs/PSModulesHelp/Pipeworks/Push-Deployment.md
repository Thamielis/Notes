Push-Deployment
---------------

### Synopsis
Pushes a deployment to Azure

---

### Description

Pushes an existing deployment to an Azure service

---

### Related Links
* [Get-Deployment](Get-Deployment)

* [Import-Deployment](Import-Deployment)

* [Remove-Deployment](Remove-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Push-Deployment "StartAutomating" ".\startautomating.cspkg" ".\startautomating.cscfg" -FirstLabel Start-Scripting -Second Update-Web
```

---

### Parameters
#### **ServiceName**
The name of the service

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **PackagePath**
The path to the CSPackage (.cspkg) file

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ConfigurationPath**
The path to the CSConfigurationFile (.cscfg) file

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **FirstLabel**
The label of the first deployment slot

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SecondLabel**
The label of the second deployment slot

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **StorageAccount**
The name of the storage account that will contain the bits

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **StorageKey**
The storage key of the storage account that will contain the bits

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ToAzureVM**
If set, will push the deployment to Azure VMs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ComputerName**
The name of the computers that will receive the deployment

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Credential**
The name of the computers that will receive the deployment

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|true    |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Push-Deployment -ServiceName <String> -PackagePath <String> -ConfigurationPath <String> [-FirstLabel <String>] [-SecondLabel <String>] [<CommonParameters>]
```
```PowerShell
Push-Deployment -StorageAccount <String> -StorageKey <String> -ToAzureVM [-ComputerName <String[]>] -Credential <PSCredential> [<CommonParameters>]
```
