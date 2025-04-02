New-DPSInstallConfiguration
---------------------------

### Synopsis

---

### Description

---

### Parameters
#### **AcceptEula**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AccessUri**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdministratorEmail**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdministratorPassword**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdministratorUsername**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabaseHost**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabaseName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabasePassword**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabaseUserName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DisableEncryptConfig**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DPSPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **EnableTelemetry**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **FailoverPartner**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GenerateSelfSignedCertificate**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HttpListenerUri**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IntegratedSecurity**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **MaxPoolSize**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MinPoolSize**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **RetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **RetryInterval**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ServerDescription**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ServerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SourceZipPath**
Zip file of the server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Timeout**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **TrustServerCertificate**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UseEncryptedConnection**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-DPSInstallConfiguration -detailed". For technical information, type "Get-Help New-DPSInstallConfiguration -full".

---

### Syntax
```PowerShell
New-DPSInstallConfiguration [-AcceptEula <Boolean>] [-AccessUri <String>] [-HttpListenerUri <String>] [-DPSPath <String>] [-GenerateSelfSignedCertificate <Boolean>] [-DisableEncryptConfig <Boolean>] [-SourceZipPath <String>] [-DatabaseHost <String>] [-DatabaseName <String>] [-DatabaseUserName <String>] [-DatabasePassword <String>] [-IntegratedSecurity <Boolean>] [-UseEncryptedConnection <Boolean>] [-TrustServerCertificate <Boolean>] [-FailoverPartner <String>] [-MinPoolSize <Int32>] [-MaxPoolSize <Int32>] [-RetryCount <Int32>] [-RetryInterval <Int32>] [-Timeout <Int32>] [-ServerName <String>] [-ServerDescription <String>] [-EnableTelemetry <Boolean>] [-AdministratorUsername <String>] [-AdministratorPassword <String>] [-AdministratorEmail <String>] [<CommonParameters>]
```
