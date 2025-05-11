Invoke-Office365
----------------

### Synopsis
Invokes commands within Office365

---

### Description

Invokes PowerShell commands within Office365

---

### Related Links
* [http://help.outlook.com/en-us/140/cc952755.aspx](http://help.outlook.com/en-us/140/cc952755.aspx)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-Office365 -ScriptBlock { Get-Mailbox -Identity james.brundage@start-automating.com }
```

---

### Parameters
#### **Account**
The credential for the Office365 account

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |2       |true (ByPropertyName)|

#### **AccountSetting**
A list of account settings to use.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ServerName**
The exchange server name.  Only required if you're not invoking against Office365

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **ScriptBlock**
The script block to run in Office365

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ArgumentList**
Any arguments to the script

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|false   |named   |true (ByValue)|

#### **Name**
The name of the session.  If omitted, the name will contain the email used to connect to Office365.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AsJob**
If set, will run the command in a background job

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **FreshConnection**
If set, will create a fresh connection and destroy the connection when the command is complete.  
This is slower, but less likely to make the exchange server experience a session bottleneck.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Invoke-Office365 [[-Account] <PSCredential>] [-AccountSetting <String[]>] [[-ScriptBlock] <String[]>] [-ArgumentList <PSObject[]>] [-Name <String>] [-AsJob] [-FreshConnection] [<CommonParameters>]
```
```PowerShell
Invoke-Office365 [[-Account] <PSCredential>] [-AccountSetting <String[]>] [-ServerName] <String> [[-ScriptBlock] <String[]>] [-ArgumentList <PSObject[]>] [-Name <String>] [-AsJob] [-FreshConnection] [<CommonParameters>]
```
