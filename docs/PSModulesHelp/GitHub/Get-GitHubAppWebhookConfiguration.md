Get-GitHubAppWebhookConfiguration
---------------------------------

### Synopsis
Get a webhook configuration for an app

---

### Description

Returns the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see
"[Creating a GitHubApp](/developers/apps/creating-a-github-app)."

You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
to access this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubAppWebhookConfiguration
Returns the webhook configuration for the authenticated app.
```

---

### Parameters
#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Notes
[Get a webhook configuration for an app](https://docs.github.com/rest/apps/webhooks#get-a-webhook-configuration-for-an-app)

---

### Syntax
```PowerShell
Get-GitHubAppWebhookConfiguration [[-Context] <Object>] [<CommonParameters>]
```
