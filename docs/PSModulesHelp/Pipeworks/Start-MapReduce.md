Start-MapReduce
---------------

### Synopsis
Runs a MapReduce on a set of data

---

### Description

Runs a MapReduce on a set of data, sequentially or in background jobs, on one or more machines.

MapReduce is an approach to summarizing data.  With MapReduce:

* A Map function takes each value of incoming data and returns one or more objects summarizing that data
* The summarized data is grouped and passed to one or more functions that reduce that data into a final result

---

### Related Links
* [http://en.wikipedia.org/wiki/Mapreduce](http://en.wikipedia.org/wiki/Mapreduce)

---

### Examples
> EXAMPLE 1

```PowerShell
New-Object PSObject -Property @{
    Text = "the quick brown fox jumped over the lazy dog"
} | 
    Start-MapReduce -Map {
        param($Text, $data)
foreach ($w in ($text -split ' ')) {
            New-Object PSObject -Property @{
                Word = $w 
                Count = 1
            }
        }
    } -Reduce {
        param($Word, $WordCount) 

        New-Object PSObject -Property @{
            Word = $word 
            Count = $WordCount | Measure-Object -Property Count -Sum | Select-Object -ExpandProperty Sum
        } 
    }
```

---

### Parameters
#### **Map**
One or more map functions

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ScriptBlock[]]`|true    |1       |false        |

#### **Reduce**
One or more reduce functions

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ScriptBlock[]]`|true    |2       |false        |

#### **InputObject**
A set of input data

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **ShardSize**
The number of records in each shard.  By default, this will be the square root of the number of total items.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **BatchSize**
The number of record in each batch.  By default, this will be the square root of the number of the shard size.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Buffer**
The buffer between job launches.  By default, 1/4th of a second.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **RunReduceSequentially**
If set, reduce will be run sequentially

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RunMapSequentially**
If set, map will be run sequentially

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Grid**
A list of computers that will be used in the map reduce

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|true    |named   |false        |Node   |

#### **IncludeLocalhost**
If set, the local machine will be included in the grid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Credential**
The credential to use when remoting to the grid

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **LocalRatio**
The ratio of use of the local node to remote nodes in the grid.  By default, the ratio will be 1/n, where N is the number of nodes including localhost.
If provided, a use of the local host will be entered in once for every N items.  For instance, a LocalRatio of 1 would run every other job on the local machine, a LocalRatio of 2 would run every 3rd job on the local machine, and so on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Start-MapReduce [-Map] <ScriptBlock[]> [-Reduce] <ScriptBlock[]> -InputObject <PSObject[]> [-ShardSize <UInt32>] [-BatchSize <UInt32>] [-Buffer <TimeSpan>] [-RunReduceSequentially] [-RunMapSequentially] [<CommonParameters>]
```
```PowerShell
Start-MapReduce [-Map] <ScriptBlock[]> [-Reduce] <ScriptBlock[]> -InputObject <PSObject[]> [-ShardSize <UInt32>] [-BatchSize <UInt32>] [-Buffer <TimeSpan>] [-RunReduceSequentially] [-RunMapSequentially] -Grid <String[]> [-IncludeLocalhost] [-Credential <PSCredential>] [-LocalRatio <UInt32>] [<CommonParameters>]
```
