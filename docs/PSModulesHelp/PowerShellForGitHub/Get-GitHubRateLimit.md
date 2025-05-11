Get-GitHubRateLimit
-------------------

### Synopsis
Gets the current rate limit status for the GitHub API based on the currently configured
authentication (Access Token).

---

### Description

Gets the current rate limit status for the GitHub API based on the currently configured
authentication (Access Token).

Use Set-GitHubAuthentication to change your current authentication (Access Token).

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRateLimit
```

---

### Parameters
#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* GitHub.RateLimit
Limits returned are _per hour_.

The Search API has a custom rate limit, separate from the rate limit
governing the rest of the REST API. The GraphQL API also has a custom
rate limit that is separate from and calculated differently than rate
limits in the REST API.

For these reasons, the Rate Limit API response categorizes your rate limit.
Under resources, you'll see three objects:

The core object provides your rate limit status for all non-search-related resources
in the REST API.
The search object provides your rate limit status for the Search API.
The graphql object provides your rate limit status for the GraphQL API.

Deprecation notice
The rate object is deprecated.
If you're writing new API client code or updating existing code,
you should use the core object instead of the rate object.
The core object contains the same information that is present in the rate object.

---

### Syntax
```PowerShell
Get-GitHubRateLimit [[-AccessToken] <String>] [<CommonParameters>]
```
