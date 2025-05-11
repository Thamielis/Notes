Add-Interaction
---------------

### Synopsis
Adds a user interaction to user storage

---

### Description

Adds a user interaction to user storage.  
        
Interactions are things a user has done within a service.  
        
For instance, you might Add-Interaction "VoteCount" 1 when someone votes on a video.

You can use interactions for personalized statistical tracking, and you can also use interactions to control if someone can use a command.        

Interactions may only contain numbers.  Interactions can only be used within a Pipeworks web site

---

### Related Links
* [Get-Person](Get-Person)

* [Confirm-Person](Confirm-Person)

---

### Examples
> EXAMPLE 1

```PowerShell
$session["User"] | 
    Add-Interaction "VoteCount" 1
```

---

### Parameters
#### **InputObject**
The object that is being interacted with,

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |named   |true (ByValue)|

#### **InteractionName**
The name of the interaction

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Change**
The amount the interaction has changed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|

#### **ResetInteractionCount**
If set, the interaction count will be set to the change, instead of added to the change.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **AwardName**
The name of the award that will be given to the object

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **RemoveAward**
If set, the award will be removed from the object, instead of added to it.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|

#### **PassThru**
If set, will output the modified object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Add-Interaction -InputObject <PSObject> [-InteractionName] <String> [[-Change] <Double>] [-ResetInteractionCount] [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-Interaction -InputObject <PSObject> -AwardName <String> -RemoveAward [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-Interaction -InputObject <PSObject> -AwardName <String> [-PassThru] [<CommonParameters>]
```
