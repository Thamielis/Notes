Invoke-GitHubGraphQLQuery
-------------------------

### Synopsis
Invoke a GraphQL query against the GitHub GraphQL API

---

### Description

Use this function to invoke a GraphQL query against the GitHub GraphQL API.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GitHubGraphQLQuery -Query $query -Variables $Variables
```

---

### Parameters
#### **Query**
The GraphQL query to execute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Variables**
The variables to pass to the query.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |2       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Notes
[GitHub GraphQL API documentation](https://docs.github.com/graphql)

---

### Syntax
```PowerShell
Invoke-GitHubGraphQLQuery [-Query] <String> [[-Variables] <Hashtable>] [[-Context] <Object>] [<CommonParameters>]
```
