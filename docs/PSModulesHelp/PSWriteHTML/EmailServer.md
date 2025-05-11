EmailServer
-----------

### Synopsis
Defines the email server configuration for sending emails.

---

### Description

This function sets up the email server configuration including server address, port, authentication credentials, and SSL settings.

---

### Examples
> EXAMPLE 1

```PowerShell
EmailServer -Server "mail.example.com" -Port 587 -UserName "user@example.com" -Password "P@ssw0rd" -SSL
Configures the email server with the specified server address, port, username, password, and SSL enabled.
```

---

### Parameters
#### **Server**
Specifies the address of the email server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Port**
Specifies the port number of the email server. Default is 587.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **UserName**
Specifies the username for authentication with the email server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Password**
Specifies the password for authentication with the email server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **PasswordAsSecure**
Indicates that the password should be treated as a secure string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PasswordFromFile**
Indicates that the password should be read from a file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SSL**
Indicates whether SSL should be used for the connection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseDefaultCredential**
Specifies whether to use default credentials for authentication.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[Switch]`|false   |named   |false        |UseDefaultCredentials|

---

### Syntax
```PowerShell
EmailServer [[-Server] <String>] [[-Port] <Int32>] [[-UserName] <String>] [[-Password] <String>] [-PasswordAsSecure] [-PasswordFromFile] [-SSL] [-UseDefaultCredential] [<CommonParameters>]
```
