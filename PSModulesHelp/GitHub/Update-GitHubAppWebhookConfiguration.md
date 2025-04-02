Update-GitHubAppWebhookConfiguration
------------------------------------

### Synopsis
Update a webhook configuration for an app

---

### Description

Updates the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see
"[Creating a GitHub App](/developers/apps/creating-a-github-app)."

You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
to access this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-GitHubAppWebhookConfiguration -URL 'https://example.com' -ContentType 'json' -Secret 'mysecret' -InsecureSSL
Updates the webhook configuration for the authenticated app to deliver payloads to `https://example.com` with a `json` content type
and a secret of `mysecret` disabling SSL verification when delivering payloads.
```

---

### Parameters
#### **URL**
The URL to which the payloads will be delivered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ContentType**
The media type used to serialize the payloads. Supported values include `json` and `form`.
Valid Values:

* json
* form

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Secret**
If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for delivery signature headers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **InsecureSSL**
Determines whether the SSL certificate of the host for URL will be verified when delivering payloads.
We strongly recommend not setting this as you are subject to man-in-the-middle and other attacks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Update a webhook configuration for an app](https://docs.github.com/rest/apps/webhooks#update-a-webhook-configuration-for-an-app)

---

### Syntax
```PowerShell
Update-GitHubAppWebhookConfiguration [[-URL] <String>] [[-ContentType] <String>] [[-Secret] <String>] [-InsecureSSL] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
