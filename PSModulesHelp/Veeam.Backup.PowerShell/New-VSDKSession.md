New-VSDKSession
---------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **BackupServerCredentials**

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **BackupServerName**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **BackupServerPort**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |named   |True (ByPropertyName)|

#### **PlatformId**

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **ProxyCredentials**

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **ProxyName**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **ProxyPort**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.String

System.Int32

Veeam.Backup.Common.CCredentials

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VSDKSession -BackupServerCredentials <CCredentials> -BackupServerName <String> -BackupServerPort <Int32> [-PlatformId <Guid>] -ProxyCredentials <CCredentials> -ProxyName <String> -ProxyPort <Int32> 
```
```PowerShell
[<CommonParameters>]
```
