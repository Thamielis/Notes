EmailOptions
------------

### Synopsis
Configures email options for sending notifications.

---

### Description

This function sets the priority and delivery notifications for email notifications.

---

### Examples
> EXAMPLE 1

```PowerShell
EmailOptions -Priority 'High' -DeliveryNotifications 'OnSuccess'
Configures email options with High priority and delivery notifications on success.
```
> EXAMPLE 2

```PowerShell
EmailOptions
Configures email options with default settings.
```

---

### Parameters
#### **Priority**
Specifies the priority of the email. Valid values are 'Low', 'Normal', or 'High'.
Valid Values:

* Low
* Normal
* High

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **DeliveryNotifications**
Specifies when delivery notifications should be sent. Valid values are 'None', 'OnSuccess', 'OnFailure', 'Delay', or 'Never'.
Valid Values:

* None
* OnSuccess
* OnFailure
* Delay
* Never

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Encoding**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
EmailOptions [[-Priority] <String>] [[-DeliveryNotifications] <Object>] [[-Encoding] <String>] [<CommonParameters>]
```
