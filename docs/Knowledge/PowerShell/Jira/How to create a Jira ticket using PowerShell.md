The possibility to create Jira tickets in an automated can be very handy. But it can be a little bit tricky because Jira is quite customizable and therefore there is no universal PowerShell function that will work for everybody.

In this post, I will show you how to solve this challenge 😉.

> In our company, we use a cloud Confluence solution. So mainly authentication part will be different for the on-premises version of the Jira.
> 
> You can use my function [New-JiraTicket][1] as a template, but without modification, this won't work in your environment!

___

## [Permalink][2]Prerequisites

-   Official PowerShell module [JiraPS][3]
-   Account with permission to create tickets in your Jira project + it's [API token][4]
-   To know your:
    -   Confluence URL (`https://contoso.atlassian.net`)
    -   Jira project name
        -   can be retrieved from the URL of your project (`https://contoso.atlassian.net/jira/servicedesk/projects/**PROJECTNAME**/queues`)

> For purposes of this article, I will use following made-up values:
> 
> -   Confluence account that has permissions to create a Jira ticket == **[JiraTicketCreator@contoso.com][5]**
> -   Confluence URL == **[contoso.atlassian.net][6]**
> -   Jira project name == **helpdesk**
> -   Jira issue type == **IT Help**

___

## [Permalink][7]Step 1 - Authentication

## [Permalink][8]Granting permission to create Jira ticket

-   Login to your Jira project with an account that can grant permissions to other users (admin)
-   Open `Project settings > People > Add people` and add the account you want to grant permissions to (_[JiraTicketCreator@contoso.com][9]_) and select role `Service desk team` ![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1648111127107/I35LNvh-j.png?auto=compress,format&format=webp)
    
    ## [Permalink][10]API key creation
    
-   Log to your Confluence environment as a user that has permission to create tickets (_[JiraTicketCreator@contoso.com][11]_) in your Jira project
-   Follow this [tutorial to create API key][12]
    -   Save this API key to a safe location so we can use it later

## [Permalink][13]Using API key for authentication

The PowerShell code that can be used to authenticate to our made-up Cloud Jira environment 👇

```
Import-Module JiraPS
$credential = Get-Credential -UserName 'JiraTicketCreator@contoso.com' -Message "Use account's API TOKEN as a password!"
Set-JiraConfigServer 'https://contoso.atlassian.net'  # required since version 2.10
New-JiraSession -Credential $credential
```

___

## [Permalink][14]Step 2 - Getting all prerequisites for creating the ticket

Jira tickets can have several required fields that have to be filled so the ticket can be created. And this totally depends on your setup.

The ticket can be of different types, sub-types, there can be participants, description, etc.

So how can we find what fields are available and the list of values we can use to fill them?

There is [official article about this topic][15].

Get basic ticket/issue information 👇

```
# get Jira projects
Get-JiraProject

# get Jira issue types
Get-JiraIssueType

# get all ticket fields
Get-JiraIssueCreateMetadata -Project 'helpdesk'-IssueType 'IT Help'

# get only required ticket fields
Get-JiraIssueCreateMetadata -Project 'helpdesk' -IssueType 'IT Help' | ? required

# get all ticket fields and their allowed values
Get-JiraIssueCreateMetadata -Project 'helpdesk'-IssueType 'IT Help' | % {$_ | select Id, Name, Required, @{n='AllowedValues';e={$_.AllowedValues.Value}}}
```

In case there are some required custom fields, you have to prepare a hashtable that will set them correctly when the ticket will be created 👇.

So let's say that our ticket has one required field (`Support area`) 👇 ![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1648115118663/E4gt6KDn6.png?auto=compress,format&format=webp) So we create a new `$field` hash-table, where the `key` will be the `id` of such field and `value` will be another hash-table like 👇 There is also an official article about [working with custom fields][16].

```
$field = @{
    'customfield_13100' = @{
        value = 'issue'
    }
}
```

> ATTENTION! values in most of the Jira PowerShell commands are case-sensitive!

___

## [Permalink][17]Step 3 - Creating the ticket

Now when we are authenticated and the hash-table (`$field`) for defining required field(s) is set we can create our ticket like 👇

```
$params = @{
    Project     = 'helpdesk'
    IssueType   = 'IT Help'
    Summary     = "Some issue"
    Description = "blablabla"
}
if ($field) {
    $params.Fields = $field
}

New-JiraIssue @params
```

The whole code than can look like 👇. But **don't forget that I am using made-up values!**

```
Import-Module JiraPS

# authenticate
$credential = Get-Credential -UserName 'JiraTicketCreator@contoso.com' -Message "Use account's API TOKEN as a password!"
Set-JiraConfigServer 'https://contoso.atlassian.net'  # required since version 2.10
New-JiraSession -Credential $credential

# prepare hash with required fields
$field = @{
    'customfield_13100' = @{
        value = 'issue'
    }
}

# create Jira ticket
$params = @{
    Project     = 'helpdesk'
    IssueType   = 'IT Help'
    Summary     = "Some issue"
    Description = "blablabla"
    Fields = $field
}

New-JiraIssue @params
```

___

## [Permalink][18]TIP: What about adding participants?

If your ticket supports adding of participants, you can add them like 👇

```
# get participants field ID (I assume that field is named "Request Participants")
$customFieldId = Get-JiraIssueCreateMetadata -Project 'helpdesk'-IssueType 'IT Help' | ? name -EQ "Request Participants" | select -expand Id

# list of participants IDs
$participantList = @()

# translate participants UPN to ID (because of GDPR)
'JohnDoe@contoso.com', 'MarieF@contoso.com' | % {
    # name cannot be used because of GDPR strict mode enabled
    # special permission had to be granted for accessing user rest api section
    # global permission to "Browse users and groups"
    $accountId = Invoke-JiraMethod "https://contoso.atlassian.net/rest/api/3/user/search?query=$_" | select -ExpandProperty accountId
    if ($accountId) {
        $participantList += @{ accountId = $accountId }
    } else {
        Write-Warning "User $_ wasn't found i.e. won't be added as participant"
    }
}

# enrich existing hash-table with participants
$field.$customFieldId = @($participantList)
```

___

## [Permalink][19]Summary

I hope this helps somebody and again, you can check my [New-JiraTicket][20] function as an inspiration.

[1]: https://github.com/ztrhgf/useful_powershell_functions/blob/master/JIRA/New-JIRATicket.ps1
[2]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-prerequisites "Permalink"
[3]: https://www.powershellgallery.com/packages/JiraPS/2.9.0
[4]: https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/
[5]: mailto:JiraTicketCreator@contoso.com
[6]: https://contoso.atlassian.net/
[7]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-step-1-authentication "Permalink"
[8]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-granting-permission-to-create-jira-ticket "Permalink"
[9]: mailto:JiraTicketCreator@contoso.com
[10]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-api-key-creation "Permalink"
[11]: mailto:JiraTicketCreator@contoso.com
[12]: https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/#Create-an-API-token
[13]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-using-api-key-for-authentication "Permalink"
[14]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-step-2-getting-all-prerequisites-for-creating-the-ticket "Permalink"
[15]: https://atlassianps.org/docs/JiraPS/about/creating-issues.html
[16]: https://atlassianps.org/docs/JiraPS/about/custom-fields.html
[17]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-step-3-creating-the-ticket "Permalink"
[18]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-tip-what-about-adding-participants "Permalink"
[19]: https://doitpsway.com/how-to-create-a-jira-ticket-using-powershell#heading-summary "Permalink"
[20]: https://github.com/ztrhgf/useful_powershell_functions/blob/master/JIRA/New-JIRATicket.ps1