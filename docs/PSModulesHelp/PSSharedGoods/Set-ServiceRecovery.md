Set-ServiceRecovery
-------------------

### Synopsis
Configures the recovery options for a specified Windows service.

---

### Description

This function sets the recovery options for a Windows service on a remote server. It allows you to define the actions to take upon service failure and the time intervals between these actions.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-ServiceRecovery -ServiceDisplayName "Pulseway" -Server "MAIL1"
Configures the recovery options for the "Pulseway" service on the server "MAIL1" with default settings.
```

---

### Parameters
#### **ServiceDisplayName**
The display name of the service for which recovery options need to be set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Server**
The name of the server where the service is located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **action1**
The action to take for the first failure. Default is "restart".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **time1**
The time interval (in milliseconds) before the first action is taken. Default is 30000 milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **action2**
The action to take for the second failure. Default is "restart".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **time2**
The time interval (in milliseconds) before the second action is taken. Default is 30000 milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

#### **actionLast**
The action to take for subsequent failures. Default is "restart".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **timeLast**
The time interval (in milliseconds) before the subsequent action is taken. Default is 30000 milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |8       |false        |

#### **resetCounter**
The time interval (in seconds) after which the failure counter is reset. Default is 4000 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

---

### Notes
For more information on service recovery options, refer to: https://technet.microsoft.com/en-us/library/cc742019.aspx

---

### Syntax
```PowerShell
Set-ServiceRecovery [-ServiceDisplayName] <String> [-Server] <String> [[-action1] <String>] [[-time1] <Int32>] [[-action2] <String>] [[-time2] <Int32>] [[-actionLast] <String>] [[-timeLast] <Int32>] [[-resetCounter] <Int32>] [<CommonParameters>]
```
