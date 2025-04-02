Set-HyperFlexHost
-----------------

### Synopsis
Modifies Cisco HyperFlex storage settings.

---

### Description

This cmdlet modifies settings of Cisco HyperFlex storage systems.

---

### Related Links
* [Get-HyperFlexHost](Get-HyperFlexHost)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Modifying Cisco HyperFlex Storage Systems Credentials

$host = Get-HyperFlexHost
$creds = Get-VBRCredentials
Set-HyperFlexHost -Host $host -Credentials $creds
This example shows how to modify Cisco HyperFlex credentials.

Perform the following steps:
1. Run the Get-HyperFlexHost cmdlet. Save the result to the $host variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
3. Run the Set-HyperFlexHost cmdlet. Set the $host variable as the Host parameter value. Set the $creds variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the storage.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableProxyAutoSelection**
Enables automatic proxy selection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a Cisco HyperFlex without showing warnings in the PowerShell console

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies the storage you want to modify.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCiscoHxHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Proxy**
Specifies the array of proxies you want to use to work with this storage.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start the storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.CiscoHX.CCiscoHxHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-HyperFlexHost [-Credentials <CInternalCredentials>] [-Description <String>] [-EnableProxyAutoSelection] [-Force] -Host <CCiscoHxHost> [-Name <String>] [-Password <String>] [-Proxy <IProxy[]>] [-SkipRescan] 
```
```PowerShell
[-UserName <String>] [<CommonParameters>]
```
