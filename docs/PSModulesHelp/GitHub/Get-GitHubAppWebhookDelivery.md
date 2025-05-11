Get-GitHubAppWebhookDelivery
----------------------------

### Synopsis
List deliveries for an app webhook or get a delivery for an app webhook by ID.

---

### Description

Returns a list of webhook deliveries or a specific delivery for the webhook configured for a GitHub App.

You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
to access this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubAppWebhookDelivery
Returns a list of webhook deliveries for the webhook for the authenticated app.
```
> EXAMPLE 2

```PowerShell
Get-GitHubAppWebhookDelivery -ID 123456
Returns the webhook delivery with the ID `123456` for the authenticated app.
```

---

### Parameters
#### **ID**
The ID of the delivery.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|true    |named   |false        |delivery_id<br/>DeliveryID|

#### **NeedingRedelivery**
Only the ones to redeliver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **TimeSpan**
The timespan to check for redeliveries in hours.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Outputs
* GitHubWebhook[]

---

### Notes
[Get a delivery for an app webhook](https://docs.github.com/rest/apps/webhooks#get-a-delivery-for-an-app-webhook)
[Get a webhook configuration for an app](https://docs.github.com/rest/apps/webhooks#get-a-webhook-configuration-for-an-app)

---

### Syntax
```PowerShell
Get-GitHubAppWebhookDelivery [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubAppWebhookDelivery -ID <String> [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubAppWebhookDelivery -NeedingRedelivery [-TimeSpan <Int32>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
