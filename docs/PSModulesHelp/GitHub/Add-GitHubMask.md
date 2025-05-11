Add-GitHubMask
--------------

### Synopsis
Masks a value in a log

---

### Description

Masking a value prevents a string or variable from being printed in the log. Each masked word separated by whitespace is
replaced with the * character. You can use an environment variable or string for the mask's value. When you mask a value,
it is treated as a secret and will be redacted on the runner. For example, after you mask a value, you won't be able to
set that value as an output.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-Mask $SecretValue
Masks the value of $SecretValue so that its printed like ***.
```
> EXAMPLE 2

```PowerShell
$SecretValue1, $SecretValue2 | Mask
Masks the value of $SecretValue1 and $SecretValue2 so that its printed like ***, using the pipeline
```

---

### Parameters
#### **Value**
The value to mask

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

---

### Notes
[Masking a value in a log](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#masking-a-value-in-a-log)

---

### Syntax
```PowerShell
Add-GitHubMask [-Value] <String[]> [<CommonParameters>]
```
