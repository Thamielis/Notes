Write-AspDotNetScriptPage
-------------------------

### Synopsis
Writes an ASP.NET page that executes PowerShell script

---

### Description

Runs a PowerShell script inside of an ASP.net page.  

The runspace used in the ASP.NET script page will be reused for as long as the session is active.

Variables set while running your script will be available throughout the session.                       

PowerShellV2 must be installed on the server, but no other special binaries are required.

---

### Related Links
* [about_ServerSidePowerShell](about_ServerSidePowerShell)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-AspDotNetScriptPage -PrependBootstrapper -ScriptBlock {
    $response.Write("<pre>
$(Get-Help Get-Command -full | Out-String -width 1024)
</pre>")            
} | 
    Set-Content
```

---

### Parameters
#### **ScriptBlock**
The script block to embed in the page.  This will use the runScript function declared in the bootstrapper.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[ScriptBlock]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Text**
The direct ASP.NET text to embed in the page.  To run scripts inside of this text, use <% runScript(); %>
|LinesForInput 6

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **NoBootstrapper**
If set, prepends the bootstrapper code to the ASP.NET page.  
This is required the first time you want to run PowerShell inside of your ASP.NET page.
It declares a function, runScript, which you can use to run PowerShell

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |7       |true (ByPropertyName)|

#### **MasterPage**
If set, the page generated will include this page as the ASP.NET master page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **IsMasterPage**
If set, the page generated will be a master page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |4       |true (ByPropertyName)|

#### **CodeFile**
If set, uses a codefile page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **Inherit**
If set, inherits from another codefile page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-AspDotNetScriptPage [[-MasterPage] <String>] [[-IsMasterPage]] [[-CodeFile] <String>] [[-Inherit] <String>] [<CommonParameters>]
```
```PowerShell
Write-AspDotNetScriptPage [-ScriptBlock] <ScriptBlock> [[-NoBootstrapper]] [[-MasterPage] <String>] [[-IsMasterPage]] [[-CodeFile] <String>] [[-Inherit] <String>] [<CommonParameters>]
```
```PowerShell
Write-AspDotNetScriptPage [-Text] <String> [[-NoBootstrapper]] [[-MasterPage] <String>] [[-IsMasterPage]] [[-CodeFile] <String>] [[-Inherit] <String>] [<CommonParameters>]
```
