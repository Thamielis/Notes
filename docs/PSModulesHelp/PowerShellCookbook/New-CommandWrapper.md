New-CommandWrapper
------------------

### Synopsis
Adds parameters and functionality to existing cmdlets and functions.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
New-CommandWrapper Get-Process `
      -AddParameter @{
          SortBy = {
              $newPipeline = {
                  __ORIGINAL_COMMAND__ | Sort-Object -Property $SortBy
              }
          }
      }
This example adds a 'SortBy' parameter to Get-Process. It accomplishes
this by adding a Sort-Object command to the pipeline.
```
> EXAMPLE 2

$parameterAttributes = @'
          [Parameter(Mandatory = $true)]
          [ValidateRange(50,75)]
          [Int]
'@
New-CommandWrapper Clear-Host `
      -AddParameter @{
          @{
              Name = 'MyMandatoryInt';
              Attributes = $parameterAttributes
          } = {
              Write-Host $MyMandatoryInt
              Read-Host "Press ENTER"
         }
      }

This example adds a new mandatory 'MyMandatoryInt' parameter to
Clear-Host. This parameter is also validated to fall within the range
of 50 to 75. It doesn't alter the pipeline, but does display some
information on the screen before processing the original pipeline.

---

### Parameters
#### **Name**
The name of the command to extend

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Begin**
Script to invoke before the command begins

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **Process**
Script to invoke for each input element

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

#### **End**
Script to invoke at the end of the command

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |4       |false        |

#### **AddParameter**
Parameters to add, and their functionality.
The Key of the hashtable can be either a simple parameter name,
or a more advanced parameter description.
If you want to add additional parameter validation (such as a
parameter type,) then the key can itself be a hashtable with the keys
'Name' and 'Attributes'. 'Attributes' is the text you would use when
defining this parameter as part of a function.
The Value of each hashtable entry is a scriptblock to invoke
when this parameter is selected. To customize the pipeline,
assign a new scriptblock to the $newPipeline variable. Use the
special text, __ORIGINAL_COMMAND__, to represent the original
command. The $targetParameters variable represents a hashtable
containing the parameters that will be passed to the original
command.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-CommandWrapper [-Name] <Object> [[-Begin] <ScriptBlock>] [[-Process] <ScriptBlock>] [[-End] <ScriptBlock>] [[-AddParameter] <Hashtable>] [<CommonParameters>]
```
