Invoke-NaPerfstat
-----------------

### Synopsis
Gather perfstat information.

---

### Description

Gather perfstat information.

This cmdlet performs a basic perfstat.  Output files are in the Perfstat 8.1 format.  The collected data conforms to the following restrictions:
-   All data collection is done via SSH.
-   Only FILER data is collected.
-   No SystemShell commands are run.
-   Stuttered statit commands are run in "full" mode.  That is, the statit commands are stuttered for the entire parallel command time duration.

---

### Examples
> Example 1

```PowerShell
Invoke-NaPerfstat -Directory C:\perfstat -Iterations 2 -InterationSleepTime 30
Run a perfstat on the current controller with 2 iterations and 30 seconds between iterations.
```

---

### Parameters
#### **Directory**
Output directory to copy all resulting files.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Vfiler**
Restrict vfiler commands to the given Vfilers.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **SampleInterval**
Sysstat/statit frequency in seconds.  Default value is based on the value supplied for Time.
                   
Time <= 60          SampleInterval = 1
60 < Time <= 300    SampleInterval = 10
300 < Time <= 600   SampleInterval = 30
Time > 600          SampleInterval = 60

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Time**
Time to run parallel commands in seconds.  Default value is 120.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Iterations**
Number of iterations to run.  Default value is 1.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IterationSleepTime**
Number of seconds to sleep between iterations.  Default value is 0.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Controller**
The Data ONTAP controller object, embodied by an NaController object.  This parameter is returned by the Connect-NaController cmdlet.  If not specified, the value in the global variable CurrentNaController is used.

|Type            |Required|Position|PipelineInput|Aliases         |
|----------------|--------|--------|-------------|----------------|
|`[NaController]`|false   |named   |false        |Filer<br/>Server|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Invoke-NaPerfstat [[-Directory] <String>] [[-Vfiler] <String[]>] [-SampleInterval <Int32>] [-Time <Int32>] [-Iterations <Int32>] [-IterationSleepTime <Int32>] [-Controller <NaController>] 
```
```PowerShell
[<CommonParameters>]
```
